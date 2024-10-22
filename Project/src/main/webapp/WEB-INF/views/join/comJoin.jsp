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
            <form action="/join" method="post" >
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
                 <div class="submitdiv">
                <button type="submit" class="submit-btn">가입하기</button>
                 </div>
            </form>
        </div>
    </div>
</body>
</html>




