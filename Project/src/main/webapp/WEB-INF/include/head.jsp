<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<header>
  <div>
    <a href="/"><img alt="title" src="/img/banner.png" id="banner"></a>
  </div>
<c:if test="${ not empty sessionScope.userid || not empty sessionScope.comid }">
  <div id="session-timer">
    남은 시간: <span id="timer">30:00</span>&nbsp;&nbsp;
    <button id="loginTenstioin" onclick="extendSession()">로그인 연장</button>
  </div>
</c:if>
<div id="menus">
    <div><a href="/Guin/Board">구인정보</a></div>
    <div><a href="/Gusik/Board">구직정보</a></div>
    <div><a href="/Comp/Board">기업정보</a></div>
    <div><a href="/Cs/Board">고객센터</a></div>
</div>
</header>
<script>
  // 30분 타이머 설정 (1800초 = 30분)
  var sessionTimeout = 1800; 

  function startTimer() {
	  var timer = setInterval(function() {
		  sessionTimeout--;
		  
		  // 타이머가 0이 되면 세션 만료 처리
		  if (sessionTimeout <= 0) {
			  clearInterval(timer);
			  alert('세션이 만료되었습니다. 다시 로그인해주세요.');
			  window.location.href = '/home'; // 홈 화면으로 리다이렉트
			  }

		  // 시간 형식 변환
		  var minutes = Math.floor(sessionTimeout / 60);
		  var seconds = sessionTimeout % 60;
		  if (seconds < 10) {
			  seconds = '0' + seconds;
			  }

		  // 타이머 표시
		  document.getElementById('timer').innerText = minutes + ':' + seconds;

	  }, 1000); // 1초마다 업데이트
	  }
  // 세션 시간 연장 함수
  function extendSession() {
	  sessionTimeout = 1800; // 타이머를 30분으로 리셋
	  alert('로그인 연장 되었습니다.');
	  }

  window.onload = function() {
	  startTimer(); // 페이지 로드 시 타이머 시작
  };
</script>