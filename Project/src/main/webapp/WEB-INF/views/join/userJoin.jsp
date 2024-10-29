<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원가입</title>
<link rel="icon" type="image/png" href="/image/favicon.ico" />
<link rel="stylesheet"  href="/css/common.css" />
<style>
  .red{ color: red; }
  .green{ color: green; }
</style>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
   <div class="big-div">
        <div class="form-box">
            <h2>개인 회원가입</h2>
            <form action="/Join/UserJoin" method="post" onsubmit="return handleSubmit();">
                <div class="input-group">
			        <label for="userid">개인 아이디</label>
			        <input type="text" id="userid" name="userid" required>
			        <button type="button" onclick="openIdCheckPopup()">중복 확인</button>
                </div>
                <div class="input-group">
                    <label for="userpw">비밀번호</label>
                    <input type="password" id="password" name="userpw" onchange="checkPw()" required>
                    <div></div>
                </div>
                <div class="input-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="confirmPassword"  required>
                </div>
                <div class="input-group">
                    <label for="username">성명</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="input-group">
                    <span>성별</span>
                    <label for="gender1">
                      <input type="radio" id="gender1" name="gender" value="여">
                      여
                    </label>
                    <label for="gender2">
                      <input type="radio" id="gender2" name="gender" value="남">
                      남
                    </label>
                </div>
                <div class="input-group">
                    <label for="uphone">생일</label>
                    <input type="date" id="birth" name="birth" required>
                </div>
                <div class="input-group">
                    <label for="uphone">휴대전화</label>
                    <input type="text" id="uphone" name="uphone" required>
                </div>
                <div class="input-group">
                    <label for="uaddr">주소</label>
                    <input type="text" id="address" name="uaddr" required>
                </div>
                <div class="input-group">
                    <label for="useremail">이메일</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="submitdiv">
                    <button type="submit" class="submit-btn">가입하기</button>
                </div>
            </form>

            <script>
                // 팝업 창을 여는 함수
                function openIdCheckPopup() {
                    var userid = document.getElementById('userid').value;
                    if (!userid) {
                        alert('아이디를 입력하세요.');
                        return;
                    }
                    window.open('/Join/checkUserId?userid=' + userid, 'idCheckPopup', 'width=400,height=300');
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
        </div>
    </div>
<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>