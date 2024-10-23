<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사람과 기업을 연결하는 구구인</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <link rel="stylesheet"  href="/css/common.css" />

    <style>
        #login_button {
        td{
            text-align: center;
            background: #333;
            color:white;
            font-weight: bold;
            border: 1px solid silver;
            padding: 0;
        }
        td:hover{
            background: #c0c0c0;
            color:white;
        }
        a{
            text-decoration:none;
            color:white;
            display:block;
            padding:15px 65px;
            width:100%;
        }

        }
        main{
            display: grid;
            place-items: center;
            margin: 50px 0;
        }

    </style>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <h2>Login</h2>
    <table id="login_button">
        <tr>
            <td><a href="#" onclick="return false" id="personal" >개인</a></td>
            <td><a href="#" onclick="return false" id="business">기업</a></td>
        </tr>
    </table>

    <div id = "login">
    </div>

</main>
<script>
    <c:if test="${loginFail==false}">
    alert("로그인 정보가 일치하지 않습니다.");
    </c:if>
    document.getElementById("personal").onclick=()=>{
        let html ="<form action='/Login/User' method='POST'>";
        html+="<table>";
        html+="<tr>"
        html+="<th><h2>개인 로그인</h2></th>";
        html+="</tr>";
        html+="<tr><td><div>아이디 : <input type='text' name='userid'/></div>";
        html+="<div>비밀번호 : <input type='password' name='userpw'/></div>";
        html+="<input type = 'submit' value='로그인'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        html+="<a href='/Join/UserJoin'>회원가입</a></td>";
        html+="</tr>";
        html+="</table>";
        html+="</form>";
        document.getElementById("login").innerHTML=html;
    }
    document.getElementById("business").onclick=()=>{
        let html ="<form action='/Login/Com' method='POST'>";
        html+="<table>";
        html+="<tr>"
        html+="<th><h2>기업 로그인</h2></th>";
        html+="</tr>";
        html+="<tr><td><div>아이디 : <input type='text' name='comid'/></div>";
        html+="<div>비밀번호 : <input type='password' name='compw'/></div>";
        html+="<input type = 'submit' value='로그인'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        html+="<a href='/Join/ComJoin'>회원가입</a></td>";
        html+="</tr>";
        html+="</table>";
        html+="</form>";
        document.getElementById("login").innerHTML=html;
    }
</script>
</body>
</html>






