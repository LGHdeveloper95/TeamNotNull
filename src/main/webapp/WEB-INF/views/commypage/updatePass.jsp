<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="/css/common.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>GUGUIN : 비밀번호수정</title>
    <style>
        #listtable {
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 5%;
            max-width: 100%; /* 최대 너비 설정 */
            flex: 1; /* Flex-grow로 크기 조정 */
        }
        table{
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 5%;
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
        .green{
            color:green;
        }
        .container{
          max-width: 30%;
          vertical-align: top;
          margin: 10px;
          border-radius: 5%;
          border: 1px solid #ccc;
        }
        .btn{ background-color: black; color: white; }
        .btn:hover{ text-decoration: none; border: 2px solid black;}
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <div>
        <form action="/ComMyPage/UpdatePass" method="POST">
            <input type="hidden" name="comid" value="${com.comid}"/>
        <table>
            <thead>
            <tr>
                <td>비밀번호 변경</td>
                <td>
                    <a class = "btn" href="/ComMyPage/Board">목록</a>
                    <input type="submit" class="btn" value="수정">
                </td>
            </tr>
            </thead>
            <tr>
                <td><c class="red">*</c> 현재 비밀번호</td>
                <td><input type="password" id="checkpw"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 변경 비밀번호</td>
                <td><input type="password" name="compw" id="changepw" class="password" onchange="checkPw()"/>
                <div></div></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 비밀번호 확인</td>
                <td><input type="password" id="changepwCheck"/></td>
            </tr>
        </table>
        </form>
    </div>
    <div class="container">
      <%@include file="/WEB-INF/include/profile.jsp"%>
    </div>
</main>
<script>
	//비밀번호 정규식 확인
	function checkPw(){
		let passwd = document.querySelector('.password');
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
    document.getElementsByTagName('form').item(0).onsubmit=()=>{
        if($('#checkpw').val()==null||$('#checkpw').val()==""){
            alert("비밀번호를 입력해주세요.");
            $('#checkpw').focus();
            return false;
        }
        if($('#checkpw').val()!='${com.compw}'){
            alert("비밀번호를 확인해주세요.");
            $('#checkpw').focus();
            return false;
        }
        if($('#changepw').val()==null||$('#changepw').val()==""){
            alert("변경할 비밀번호를 입력해주세요.");
            $('#changepw').focus();
            return false;
        }
        if($('#changepwCheck').val()!=$('#changepw').val()){
            alert("변경 비밀번호를 확인해주세요.");
            $('#changepwCheck').focus();
            return false;
        }

        alert("비밀번호 수정 완료.");
        return true;
    }
</script>
<%@include file = "/WEB-INF/include/footer.jsp" %>
</body>
</html>