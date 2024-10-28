<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="icon" type="image/png" href="/img/favicon.png" />
    <link rel="stylesheet"  href="/css/common.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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

        .clicked{
            background: #999999;
        }
        form table tr{
            height: 50px;
        }
/*        form table td{
            padding:0 10px;
        }*/

        form{
            width: 380px;
        }
        .btn{
            width: 110px;
            font-size: 13px;
        }
        .btn-light{
            width:380px;
            height: 60px;
            font-size: large;
            text-align: center;
            vertical-align: center;
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
    document.getElementById("personal").onclick=()=>{
        let html ="<br><form action='/Login/User' method='POST'>";
        html+="<h2>개인 로그인</h2>";
        html+="<div class='form-floating'><input type='text' name='userid' id='floatingId' class='form-control' placeholder='아이디'/>";
        html+="<label for='floatingId'>아이디</label></div>"
        html+="<div class='form-floating'><input type='password' name='userpw'  id='floatingPw'  class='form-control' placeholder='패스워드'/>";
        html+="<label for='floatingPw'>패스워드</label></div>"
        html+="<br><input type = 'submit' value='로그인' class='btn btn-light'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        html+="<a href='/Login/UserId' class='btn'>아이디 찾기</a>";
        html+="<a href='/Login/UserPw' class='btn'>비밀번호 찾기</a>";
        html+="<a href='/Join/UserJoin' class='btn'>회원가입</a>";
        html+="</form>";
        document.getElementById("login").innerHTML=html;
        document.getElementById("business").classList.remove("clicked");
        document.getElementById("personal").classList.add("clicked");
    }
    document.getElementById("business").onclick=()=>{
        let html ="<br><form action='/Login/Com' method='POST'>";
        html+="<h2>기업 로그인</h2>";
        html+="<div class='form-floating'><input type='text' name='comid' id='floatingId' class='form-control' placeholder='아이디'/>";
        html+="<label for='floatingId'>아이디</label></div>"
        html+="<div class='form-floating'><input type='password' name='compw'  id='floatingPw'  class='form-control' placeholder='패스워드'/>";
        html+="<label for='floatingPw'>패스워드</label></div>"
        html+="<br><input type = 'submit' value='로그인' class='btn btn-light'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        html+="<a href='/Login/ComId' class='btn'>아이디 찾기</a>";
        html+="<a href='/Login/ComPw' class='btn'>비밀번호 찾기</a>";
        html+="<a href='/Join/ComJoin' class='btn'>회원가입</a>";
        html+="</form>";

        document.getElementById("login").innerHTML=html;
        document.getElementById("personal").classList.remove("clicked");
        document.getElementById("business").classList.add("clicked");

    }
    document.getElementById("personal").click();
</script>
</body>
</html>






