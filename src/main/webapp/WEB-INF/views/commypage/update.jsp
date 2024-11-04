<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="/css/common.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>GUGUIN : 내정보수정</title>
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
        .container {
            width: 250px;
            height: 40%;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 25px 20px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <div>
        <form action="/ComMyPage/Update" method="POST">
            <input type="hidden" name="comid" value="${com.comid}"/>
            <input type="hidden" name="boss" value="${com.boss}"/>
        <table>
            <thead>
            <tr>
                <td colspan="2">내 정보 </td>
                <td>
                    <a class = "btn btn-primary" href="/ComMyPage/Board">목록</a>
                    <c:if test="${sessionScope.comid eq com.comid}">
                        <input type="submit" class="btn btn-success" value="수정">
                    </c:if>
                </td>
            </tr>
            </thead>
            <tr>
                <td rowspan="6" style="max-width: 130px; text-align: center;"><img src="/img/samsung.png" alt="pic" style="width: 80%;"/></td>
                <td>기업 이름</td>
                <td>${ com.comname } </td>
            </tr>
            <tr>
                <td>대표자</td>
                <td>${com.boss}</td>
            </tr>
            <tr>
                <td><c class="red">*</c> 회사 연락처 </td>
                <td><input type="text" name="cphone" value="${ com.cphone }"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 주소 </td>
                <td><input type="text" name="caddr" value="${ com.caddr }"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 이메일 </td>
                <td><input type="email" name="bossemail" value="${ com.bossemail }"/></td>
            </tr>
            <tr>
                <td><c class="red">*</c> 비밀번호 확인 </td>
                <td><input type="password" id="checkpw"/></td>
            </tr>
        </table>
        </form>
    </div>
    <div class="container">
      <%@include file="/WEB-INF/include/profile.jsp"%>
    </div>
</main>
<script>
    document.getElementsByTagName('form').item(0).onsubmit=()=>{
        if($('input[name=cphone]').val()==null||$('input[name=cphone]').val()==""){
            alert("연락처를 입력해주세요.");
            $('input[name=cphone]').focus();
            return false;
        }
        if($('input[name=caddr]').val()==null||$('input[name=caddr]').val()==""){
            alert("주소를 입력해주세요.");
            $('input[name=caddr]').focus();
            return false;
        }
        if($('input[name=bossemail]').val()==null||$('input[name=bossemail]').val()==""){
            alert("이메일을 입력해주세요.");
            $('input[name=bossemail]').focus();
            return false;
        }
        if($('#checkpw').val()!='${com.compw}'){
            alert("비밀번호를 확인해주세요.");
            $('#checkpw').focus();
            return false;
        }

        alert("수정 완료.");
        return true;
    }
</script>
<%@include file = "/WEB-INF/include/footer.jsp" %>
</body>
</html>


