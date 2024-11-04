<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GUGUIN : 아이디중복확인</title>
    <style>
        .bigbox {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            gap: 20px; /* 내부 요소 간의 간격 설정 */
        }
        .box {
            border: 6px solid #3f3f3f;
            border-radius: 7%;
            padding: 20px;
            text-align: center;
        }
        .duplicate {
            color: red;
            font-weight: bold;
        }
        .available {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body class="bigbox">
    <img src="/img/banner.png" alt="Logo" style="width: 40%; margin-top: -70px;">

    <div class="box">
        <h3>아이디 중복 확인 결과</h3>
        <%
            boolean isDuplicate = (Boolean) request.getAttribute("isDuplicate");
            if (isDuplicate) {
                out.println("<p class='duplicate'>이미 사용 중인 아이디입니다.</p>");
            } else {
                out.println("<p class='available'>사용 가능한 아이디입니다.</p>");
            }
        %>
        <button onclick="window.close()">닫기</button>
    </div>
</body>
</html>