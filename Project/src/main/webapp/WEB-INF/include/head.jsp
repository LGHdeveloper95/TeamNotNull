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
  
  header {
    background: linear-gradient(to bottom, rgb(217, 216, 232) 75%, #e0e0e0 100%); /* 하단 회색 부분을 25%로 설정 */
    color: white;
    padding: 20px;
    text-align: center;
    box-shadow: 0 -15px 0 #e0e0e0 inset; /* 연한 회색 하단 띠를 올리는 효과 */
  }

  #banner {
    max-width: 100%;
    height: auto;
  }

  #session-timer {
    margin: 10px 0;
    font-size: 18px;
    color: #333;
    font-weight: bold;
  }

  #timer {
    font-weight: bold;
    color: #333;
  }

  #loginTenstioin {
    background-color: #333;
    color: #FFFFF0;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s;
  }

  #loginTenstioin:hover {
    background-color: rgb(208, 110, 10);
  }

  #menus {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    background-color: rgb(217, 216, 232);
    padding-bottom: 10px;
    position: relative;
    z-index: 2;
  }

  #menus a {
    text-decoration: none;
    color: #333;
    background-color: #f8f9fa;
    padding: 15px 20px;
    border: 2px solid #333;
    border-radius: 5px;
    position: relative;
    display: inline-block;
    transition: all 0.3s ease;
    margin-top: 20px;
  }

  #menus a::before {
    content: "";
    width: 0;
    height: 0;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 10px solid #333;
    position: absolute;
    top: -10px;
    left: 50%;
    transform: translateX(-50%);
  }

  #menus a:hover {
    background-color: #ddd;
    color: #000;
  }

  /* 현재 페이지 링크 스타일 */
  #menus a.current {
    background-color: #ddd;
    color: #000;
    padding-bottom: 25px;
    margin-top: 0;
    margin-bottom: -2px;
    border-bottom: 2px solid #ddd;
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
  <div id="menus">
    <c:if test="${ not empty sessionScope.comid }">
      <div><a href="/Gusik/Board" class="menu-link"><i class="fas fa-briefcase"></i>&nbsp;구직정보</a></div>
      <div><a href="/Post/Board" class="menu-link"><i class="fas fa-file-alt"></i>&nbsp;공고관리</a></div>
    </c:if>
    <c:if test="${ empty sessionScope.comid }">
      <div><a href="/Guin/Board" class="menu-link"><i class="fas fa-users"></i>&nbsp;구인정보</a></div>
      <div><a href="/Resume/Board" id="loginCheck" class="menu-link"><i class="fas fa-file"></i>&nbsp;이력서관리</a></div>
    </c:if>
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