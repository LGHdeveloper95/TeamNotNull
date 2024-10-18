<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <title>Insert title here</title>
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
     </style>

</head>
<body>
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
          let html ="<form action='/Join/UserJoinForm' method='POST'>";
          html+="<table>";
          html+="<tr>"
          html+="<th><h2>개인 로그인</h2></th>";
          html+="</tr>";
          html+="<tr><td><div>아이디 : <input type='text' name='userid'/></div>";
          html+="<div>비밀번호 : <input type='password' name='userpw'/></div>";
          html+="<input type = 'submit' value='LOGIN'/><td>";
          html+="</tr>";
          html+="</table>";
          html+="</form>";
          document.getElementById("login").innerHTML=html;
     }
     document.getElementById("business").onclick=()=>{
          let html ="<form action='/Join/ComeJoinForm' method='POST'>";
          html+="<table>";
          html+="<tr>"
          html+="<th><h2>기업 로그인</h2></th>";
          html+="</tr>";
          html+="<tr><td><div>아이디 : <input type='text' name='comid'/></div>";
          html+="<div>비밀번호 : <input type='password' name='compw'/></div>";
          html+="<input type = 'submit' value='LOGIN'/><td>";
          html+="</tr>";
          html+="</table>";
          html+="</form>";
          document.getElementById("login").innerHTML=html;
     }
</script>
</body>
</html>






