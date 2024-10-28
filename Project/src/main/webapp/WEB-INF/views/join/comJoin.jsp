<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원가입</title>
<link rel="icon" type="image/png" href="/image/favicon.ico" />
<link rel="stylesheet"  href="/css/common.css" />
</head>
<body>

   <div class="big-div">
        <div class="form-box">
            <h2>기업 회원가입</h2>
            <form action="/Join/ComJoin" method="post" onsubmit="return handleSubmit();">
                <div class="input-group">
			        <label for="comid">기업 아이디</label>
			        <input type="text" id="companyId" name="comid" required>
			        <button type="button" onclick="openIdCheckPopup()">중복 확인</button>
                </div>
                <div class="input-group">
                    <label for="comnum">사업자 번호</label>
                    <input type="text" id="businessNumber" name="comnum" required>
                </div>
                <div class="input-group">
                    <label for="compw">비밀번호</label>
                    <input type="password" id="password" name="compw" required>
                </div>
                <div class="input-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="confirmPassword"  required>
                </div>
                <div class="input-group">
                    <label for="comname">기업명</label>
                    <input type="text" id="comname" name="comname" required>
                </div>
                <div class="input-group">
                    <label for="boss">대표자 성명</label>
                    <input type="text" id="ceoName" name="boss" required>
                </div>
                <div class="input-group">
                    <label for="cphone">대표전화</label>
                    <input type="text" id="phoneNumber" name="cphone" required>
                </div>
                <div class="input-group">
                    <label for="caddr">사업장 주소</label>
                    <input type="text" id="address" name="caddr" required>
                </div>
                <div class="input-group">
                    <label for="bossemail">대표자 이메일</label>
                    <input type="email" id="email" name="bossemail" required>
                </div>
                <div class="submitdiv">
                    <button type="submit" class="submit-btn">가입하기</button>
                </div>
            </form>

            <script>
                // 팝업 창을 여는 함수
                function openIdCheckPopup() {
                    var companyId = document.getElementById('companyId').value;
                    if (!companyId) {
                        alert('아이디를 입력하세요.');
                        return;
                    }
                    window.open('/Join/checkId?companyId=' + companyId, 'idCheckPopup', 'width=400,height=300');
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
</body>
</html>