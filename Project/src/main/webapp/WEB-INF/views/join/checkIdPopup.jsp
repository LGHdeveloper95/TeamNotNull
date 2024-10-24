<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 중복 확인</title>
</head>
<body>
    <h3>아이디 중복 확인 결과</h3>
    <%
        boolean isDuplicate = (Boolean) request.getAttribute("isDuplicate");
        if (isDuplicate) {
            out.println("<p>이미 사용 중인 아이디입니다.</p>");
        } else {
            out.println("<p>사용 가능한 아이디입니다.</p>");
        }
    %>
    <button onclick="window.close()">닫기</button>
</body>
</html>


