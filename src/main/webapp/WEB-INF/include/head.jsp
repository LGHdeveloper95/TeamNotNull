<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    border-top: 2px solid #000000;
  }
  
  /* 배너 이미지 스타일 */
  #banner {
    max-width: 100%;
    height: auto;
    margin-top: 20px;
    width: 20%;
  }

  /* 상단 세션 타이머 스타일 */
  #session-timer {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin: 0 30px 15px;
    font-size: 18px;
    color: #333;
    font-weight: bold;
  }

  /* 로그인 연장 버튼 스타일 */
  #loginTenstioin {
    background: none;
    color: black;
    border: 2px solid black;
    border-radius: 5px;
    padding: 10px 12px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s, transform 0.2s;
  }

  #loginTenstioin:hover {
    background-color: black;
    color: white;
  }

  /* 메뉴 스타일 */
  #menus {
    display: flex;
    justify-content: space-between;
    background-color: #575757;
    padding: 15px 30px;
  }
  
  #menus div {
    flex: 1;
    text-align: center;
  }
  
  #menus a {
    color: white;
    font-weight: 600;
    position: relative;
  }

  #menus a:hover {
    text-decoration: none;
  }

  #menus a::after {
    content: "";
    display: block;
    height: 2px;
    background: #f4f4f4;
    transition: width 0.3s ease, opacity 0.3s ease;
    width: 0;
    opacity: 0;
    position: absolute;
    left: 50%;
    bottom: -5px;
    transform: translateX(-50%);
  }
  
  #menus a:hover::after {
    width: 100%;
    opacity: 1;
  }

  /* 현재 선택된 페이지 스타일 */
  #menus a.current {
    background-color: #f4f4f4;
    color: black;
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 10px 10px 0 0;
    margin-bottom: -2px;
    border-bottom: 8px solid #f4f4f4;
    transition: background-color 0.3s ease, color 0.3s ease;
  }

  /* 배경 이미지 스타일 */
  #background-image {
    width: 100%;
    height: 150px; /* 이미지 높이 설정 */
    object-fit: cover; /* 비율 유지하며 꽉 채우기 */
    margin-bottom: -5px;
    filter: grayscale(100%) brightness(1); /* 회색 필터와 밝기 조정 */
  }

</style>

<header>

  <div>
    <a href="/"><img alt="title" src="/img/banner.png" id="banner"></a>
  </div>
  <c:if test="${ not empty sessionScope.userid || not empty sessionScope.comid }">
    <div id="session-timer">
      남은 시간&nbsp;&nbsp;:&nbsp;&nbsp; <span id="timer">30:00</span>&nbsp;&nbsp;
      <button id="loginTenstioin" onclick="extendSession()">로그인 연장</button>
    </div>
  </c:if>
  <!-- 배경 이미지 -->
  <img src="/img/city.png" id="background-image" alt="City Background">
  <div id="menus">
    <c:if test="${ not empty sessionScope.comid }">
      <div><a href="/Gusik/Board" class="menu-link"><i class="fas fa-briefcase"></i>&nbsp;구직정보</a></div>
      <div><a href="/Post/Board" class="menu-link"><i class="fas fa-file-alt"></i>&nbsp;공고관리</a></div>
    </c:if>
    <c:if test="${ empty sessionScope.comid }">
      <div><a href="/Guin/Board" class="menu-link"><i class="fas fa-users"></i>&nbsp;구인정보</a></div>
      <div><a href="/Resume/Board" id="loginCheck" class="menu-link"><i class="fas fa-file"></i>&nbsp;이력서관리</a></div>
    </c:if>
    <div><a href="/Matching/" class="menu-link"><i class="fas fa-building"></i>&nbsp;자동매칭</a></div>
    <div><a href="/CompInfo/Grid" class="menu-link"><i class="fas fa-building"></i>&nbsp;기업정보</a></div>
    <div><a href="/Cs/Board" class="menu-link"><i class="fas fa-headset"></i>&nbsp;고객센터</a></div>
  </div>
</header>
<script>
  const loginCheckEl = document.querySelector('#loginCheck');
  var userid = '${ sessionScope.userid }';
  var comid = '${ sessionScope.comid }';
  console.log(userid, comid);
  if (userid == '' && comid == '') {
    loginCheckEl.addEventListener('click', function(event) {
      event.preventDefault();
      alert('로그인이 필요합니다');
      window.location.href = '/Login/';
    });
  }

  // 현재 URL과 일치하는 링크에 current 클래스를 추가
  document.querySelectorAll('.menu-link').forEach(link => {
    if (link.href === window.location.href) {
      link.classList.add('current');
    }
  });

  // 30분 타이머 설정 (1800초 = 30분)
  var sessionTimeout = 1800;

  function startTimer() {
    var timerElement = document.getElementById('timer');
    if (!timerElement) return;

    var timer = setInterval(function() {
      sessionTimeout--;

      if (sessionTimeout <= 0) {
        clearInterval(timer);
        alert('세션이 만료되었습니다. 다시 로그인해주세요.');
        window.location.href = '/';
      }

      var minutes = Math.floor(sessionTimeout / 60);
      var seconds = sessionTimeout % 60;
      if (seconds < 10) {
        seconds = '0' + seconds;
      }

      timerElement.innerText = minutes + ':' + seconds;
    }, 1000);
  }

  // 세션 시간 연장 함수
  function extendSession() {
    sessionTimeout = 1800;
    alert('로그인 연장 되었습니다.');
  }

  window.onload = function() {
    if (document.getElementById('session-timer')) {
      startTimer();
    }
  };
</script>