<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="/css/common.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>GUGUIN : 개인정보수정</title>
    <style>
        #listtable {
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 8px;
            max-width: 100%; /* 최대 너비 설정 */
            flex: 1; /* Flex-grow로 크기 조정 */
        }
        table{
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        thead { background-color: #f2f2f2; }
        thead td {
            font-weight: bold;
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #ccc;
        }
        tbody tr { transition: background-color 0.3s; }
        tbody td { padding: 12px; border-bottom: 1px solid #ccc; }
        a { text-decoration: none; color: #333; }
        a:hover { text-decoration: underline; }
        main {
            width: 70%;
            display: flex; /* Flexbox 사용 */
            align-items: flex-start; /* 위쪽 정렬 */
            margin: 20px auto; /* 메인 마진 추가 */
        }
        main>div{width: 100%;}
        button{ padding: 3px 10px; }
        .subtitle{ background-color: skyblue; }
        .content{
            height: 500px;
            vertical-align: top;
        }
        .btn{
            margin-left:20px;
        }
        .radio{
            opacity: 0;
        }
        .radio + label{
            padding: 5px 10px; border: 1px solid #ccc; border-radius: 3px;
        }
        .radio + label:hover{
            background: #cccccc;
        }
        input[type=radio]:checked + label{
            background: #AAAAAA;
            color:white;
        }
        input[name=rectitle],
        input[name=subtitle]{
            width: 400px;
        }
        .clicked{
            background: #AAAAAA;
            color:white;
        }
        span{
            padding:5px 5px;
        }
        span:hover{
            background: pink;
        }
        .clicked_skill:hover{
            background: #cccccc;
            opacity: 0.75;
        }
        .red{
            color:red;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <div>
        <form action="/MyPage/Update" method="POST">
            <input type="hidden" name="userid" value="${user.userid}"/>
        <table>
            <thead>
            <tr>
                <td>내 정보 </td>
                <td>
                    <a class = "btn btn-primary" href="/MyPage/Board">목록</a>
                    <c:if test="${sessionScope.userid eq user.userid}">
                        <input type="submit" class="btn btn-success" value="수정">
                    </c:if>
                </td>
            </tr>
            </thead>
            <tr>
                <td>이름</td>
                <td>${ user.username } </td>
            </tr>
            <tr>
                <td>성별</td>
                <td>${user.gender}</td>
            </tr>
            <tr>
                <td><c class="red">*</c> 생일 </td>
                <td><input type="date" name= "birth" value="${ user.birth }"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 연락처 </td>
                <td><input type="text" name= "uphone" value="${ user.uphone }"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 주소 </td>
                <td><input type="text" name="uaddr" value="${ user.uaddr }"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 이메일 </td>
                <td><input type="email" name="email" value="${ user.email }"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 비밀번호 확인 </td>
                <td><input type="password" id="checkpw"/></td>
            </tr>
        </table>
        </form>
    </div>
    <div class="profile">
        <div><img src="/img/profile.png" alt="profile"></div>
        <div>
            <c:if test="${not empty sessionScope.userid}">${ sessionScope.username }님 환영합니다</c:if>
            <c:if test="${not empty sessionScope.comid}">${ sessionScope.comname }님 환영합니다</c:if>
            <c:if test="${ empty sessionScope.userid && empty sessionScope.comid }">로그인이 필요합니다
                <div><a href="/Login/">로그인</a></div>
            </c:if>
        </div>
        <div>
            <c:if test="${ not empty sessionScope.userid }">
                <a href="/MyPage/Board" class="abutton">Mypage</a>
                <a href="/Login/Logout" class="abutton">logout</a>
            </c:if>
            <c:if test="${ not empty sessionScope.comid}">
                <a href="/ComMyPage/" class="abutton">Mypage</a>
                <a href="/Login/Logout" class="abutton">logout</a>
            </c:if>
        </div>
    </div>
</main>
<script>
    document.getElementsByTagName('form').item(0).onsubmit=()=>{
    	if($('input[name=birth]').val()==null||$('input[name=birth]').val()==""){
            alert("생일을 입력해주세요.");
            $('input[name=birth]').focus();
            return false;
        }
        if($('input[name=uphone]').val()==null||$('input[name=uphone]').val()==""){
            alert("연락처를 입력해주세요.");
            $('input[name=uphone]').focus();
            return false;
        }
        if($('input[name=uaddr]').val()==null||$('input[name=uaddr]').val()==""){
            alert("주소를 입력해주세요.");
            $('input[name=uaddr]').focus();
            return false;
        }
        if($('input[name=email]').val()==null||$('input[name=email]').val()==""){
            alert("이메일을 입력해주세요.");
            $('input[name=email]').focus();
            return false;
        }
        if($('#checkpw').val()==null||$('#checkpw').val()==""){
            alert("비밀번호를 입력해주세요.");
            $('#checkpw').focus();
            return false;
        }
        if($('#checkpw').val()!='${user.userpw}'){
            alert("비밀번호를 확인해주세요.");
            $('#checkpw').focus();
            return false;
        }

        alert("수정 완료.");
        return true;
    }
</script>
</body>
</html>