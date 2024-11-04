<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GUGUIN : 개인회원가입</title>
<link rel="icon" type="image/png" href="/image/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<style>
      body {
        background-color: #fff;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
        position: relative; /* 배경 가상 요소 위치 설정 */
        overflow: hidden; /* 스크롤 방지 */
    }

    /* 배경 이미지와 블러 효과 적용 */
    body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('/img/bgimg.png') no-repeat center center fixed;
        background-size: cover;
        filter: blur(10px); /* 블러 효과 */
        opacity: 0.5; /* 투명도 조절 */
        z-index: -1; /* 콘텐츠 위로 겹치지 않도록 뒤로 배치 */
    }

    /* .big-div 스타일 유지 */
    .big-div {
        background-color: #f9f9f9;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        text-align: center;
        width: 600px;
        z-index: 1; /* 배경보다 위에 오도록 설정 */
    }
    /* form-floating 스타일 */
    .form-floating {
        position: relative;
        margin-bottom: 20px;
    }
    .form-floating input {
        width: 100%;
        padding: 15px 10px 10px 10px; /* 상단 패딩을 더 추가 */
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .form-floating label {
        position: absolute;
        top: 15px; /* 라벨이 입력 칸 내부에 유지되도록 설정 */
        left: 10px;
        font-size: 16px;
        color: #aaa;
        transition: all 0.2s ease;
        pointer-events: none;
    }
    /* 입력 상태 시 라벨 스타일 */
    .form-floating input:focus ~ label,
    .form-floating input:not(:placeholder-shown) ~ label {
        top: 5px; /* 입력 시 라벨이 입력 칸 내부 상단으로 이동 */
        font-size: 12px;
        color: #333;
    }

    /* 아이디 입력칸과 버튼을 나란히 배치하고 높이를 맞춤 */
    .input-group {
        display: flex;
        align-items: center; /* 수평 정렬 */
    }
    .input-group input {
        flex: 1;
        height: 50px; /* 입력 필드 높이 */
        border-radius: 5px;
        padding: 0 10px;
        font-size: 16px;
    }
     /* 생일 입력칸 스타일 */
    .input-group input[type="date"] {
        padding: 10px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 15px; /* 생일 입력 칸과 휴대전화 입력 칸 사이 간격 */
        color: #333; /* 입력된 텍스트 색상 */
    }

    /* 플레이스홀더 스타일 */
    .input-group input[type="date"]::placeholder {
        color: #aaa; /* 연한 회색 플레이스홀더 텍스트 */
    }
     .input-group button { 
        height: 40px; /* 버튼 높이 */
        padding: 0 15px;
        border: none;
        background-color: #d3d3d3;
        color: black;
        cursor: pointer;
        border-radius: 5px;
        margin-left: 10px; /* 입력 필드와 버튼 사이 간격 */
        font-size: 16px;
        transition: background-color 0.3s ease;
        margin-top: -17px; /* 위치 조정: 버튼을 조금 올려서 수평 조정 */
    }
    .input-group button:hover {
        background-color: #333; /* 호버 시 검은색 */
        color:white;
    }
    .submit-btn,.back{
      height: 40px; /* 버튼 높이 */
        padding: 0 15px;
        border: none;
        background-color: #d3d3d3;
        color: black;
        cursor: pointer;
        border-radius: 5px;
        font-size: 16px;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    .submit-btn:hover,.back:hover {
        background-color: #333; /* 호버 시 검은색 */
        color:white;
        transform: scale(1.02);
    }
    .sex {
    text-align: left;
    margin-bottom: 5px;
    }
    .red{ color: red; }
    .green{ color: green; }
</style>
</head>
<body>

<div class="big-div">
    <div class="form-box">
        <img src="/img/banner.png" alt="Logo" style="width: 200px; margin-bottom: 20px;">
        <form action="/Join/UserJoin" method="post" onsubmit="return handleSubmit();">
            <!-- 아이디 입력란과 중복 확인 버튼을 함께 배치 -->
            <div class="input-group">
                <div class="form-floating" style="flex: 1;">
                    <input type="text" id="userid" name="userid" required placeholder=" ">
                    <label for="userid">개인 아이디</label>
                </div>
                <button type="button" onclick="openIdCheckPopup()">중복 확인</button>
            </div>

            <!-- 비밀번호 입력 -->
            <div class="form-floating">
                <input type="password" id="password" name="userpw" onchange="checkPw()" required placeholder=" ">
                <label for="password">비밀번호</label>
                <div></div>
            </div>

            <!-- 비밀번호 확인 -->
            <div class="form-floating">
                <input type="password" id="confirmPassword" required placeholder=" ">
                <label for="confirmPassword">비밀번호 확인</label>
            </div>

            <!-- 성명 입력 -->
            <div class="form-floating">
                <input type="text" id="username" name="username" required placeholder=" ">
                <label for="username">성명</label>
            </div>
            <!-- 성별 -->
            <div class="sex">
                    <label for="gender1">
                      <input type="radio" id="gender1" name="gender" value="여">
                      여성
                    </label>
                    <label for="gender2">
                      <input type="radio" id="gender2" name="gender" value="남">
                      남성
                    </label>
                </div>
            

            <!-- 생일 입력 -->
            <div class="input-group">
                
                <input type="date" id="birth" name="birth" required>
            </div>

            <!-- 휴대전화 입력 -->
            <div class="form-floating">
                <input type="text" id="uphone" name="uphone" required placeholder=" ">
                <label for="uphone">휴대전화</label>
            </div>

            <!-- 주소 입력 -->
            <div class="form-floating">
                <input type="text" id="address" name="uaddr" required placeholder=" ">
                <label for="address">주소</label>
            </div>

            <!-- 이메일 입력 -->
            <div class="form-floating">
                <input type="email" id="email" name="email" required placeholder=" ">
                <label for="email">이메일</label>
            </div>
            

            <div class="submitdiv">
                <button type="submit" class="submit-btn">가입하기</button>
                <button type="button" class="back" onclick="location.href='${pageContext.request.contextPath}/Login/'">취소</button>
            </div>
        </form>
    </div>
</div>

 <script>
                // 팝업 창을 여는 함수
                function openIdCheckPopup() {
                    var userid = document.getElementById('userid').value;
                    if (!userid) {
                        alert('아이디를 입력하세요.');
                        return;
                    }
                    const left = (window.screen.width-500) / 2;
                	const top = (window.screen.height-400) / 2;

                    window.open('/Join/checkUserId?userid=' + userid, 'idCheckPopup', 'width=500, height=400, left='+left+',top='+top);
                }

                //비밀번호 정규식 확인
                function checkPw(){
                	let passwd = document.querySelector('#password');
                	const pattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W_]).{5,}$/;
                	console.log(passwd.value);
                	if(!pattern.test(passwd.value)){
                		let html = '<div class="red"> * 비밀번호는 영문・숫자・특수문자를 포함한 5자리 이상이여야합니다.</div>';
                		passwd.nextElementSibling.innerHTML = html;
                	}
                	else{
                		let html = '<div class="green"> * 사용가능한 비밀번호입니다.</div>';
                		passwd.nextElementSibling.innerHTML = html;
                	}
                }
                // 비밀번호 재확인 함수
                function validatePassword() {
                    var password = document.getElementById('password').value;
                    var confirmPassword = document.getElementById('confirmPassword').value;
                    if (password !== confirmPassword) {
                        alert('비밀번호가 일치하지 않습니다.');
                        return false;
                    }
                    return true;
                }

                // 폼 제출 시 호출되는 함수
                function handleSubmit() {
                    // 비밀번호 확인
                    if (!validatePassword()) {
                        return false; // 비밀번호가 일치하지 않으면 제출 중단
                    }
                    
                    // 비밀번호가 일치하면 알림 표시 후 제출 진행
                    alert("회원가입이 완료되었습니다.");
                    return true; // 폼 제출 진행
                }
            </script>

</body>
</html>
