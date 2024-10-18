<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원가입</title>
<link rel="icon" type="image/png" href="/image/favicon.ico" />
<link rel="stylesheet"  href="/css/common.css" />
 <script>
        var sessionTimeout = 1800; // 초기 30분 타이머 설정 (1800초)

        // 타이머 시작 및 업데이트 함수
        function startTimer() {
            var timer = setInterval(function() {
                sessionTimeout--;

                // 시간이 0이 되면 세션 만료 처리
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
            alert('세션이 30분 연장되었습니다.');
        }

        window.onload = function() {
            startTimer(); // 페이지 로드 시 타이머 시작
        };
    </script>
</head>
<body>
    <div class="container">
        <div class="banner">
            <a href="/"><img src="/image/banner.png" alt="사이트 배너"></a>
        </div>
        <div class="form-box">
            <h2>기업 회원가입</h2>
            <div id="session-timer">
                남은 시간: <span id="timer">30:00</span> <!-- 타이머 표시 -->
                <button type="button" onclick="extendSession()">세션 연장</button> <!-- 세션 연장 버튼 -->
            </div>
            <form action="/join" method="post">
                <div class="input-group">
                    <label for="companyId">기업 아이디</label>
                    <input type="text" id="companyId" name="companyId" required>
                </div>
                <div class="input-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="input-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <div class="input-group">
                    <label for="ceoName">대표자 성명</label>
                    <input type="text" id="ceoName" name="ceoName" required>
                </div>
                <div class="input-group">
                    <label for="businessNumber">사업자 번호</label>
                    <input type="text" id="businessNumber" name="businessNumber" required>
                </div>
                <div class="input-group">
                    <label for="phoneNumber">대표전화</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" required>
                </div>
                <div class="input-group">
                    <label for="address">사업장 주소</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div class="input-group">
                    <label for="email">대표자 이메일</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <button type="submit" class="submit-btn">가입하기</button>
            </form>
        </div>
    </div>
</body>
</html>