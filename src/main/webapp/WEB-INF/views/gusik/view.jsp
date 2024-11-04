<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="/css/common.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>GUGUIN : 이력서상세보기</title>
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
            margin: 10px auto;
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
        #box{width: 100%;}
        button{ padding: 3px 10px; margin: 20px 10px 0; }
        .subtitle{ background-color: skyblue; }
        .content{
            height: 300px;
            vertical-align: top;
        }
        .container {
            margin-top: 5.5%;
            width: 250px;
            height:40%;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
         }
    </style>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <div id="box">
        <button id="boardBtn" class="btn btn-light">
            목록
        </button>
        <c:if test="${!empty sessionScope.comid}">
        <button id="bookBtn" class="btn btn-light">
            스크랩
        </button>
        </c:if>
        <table>
            <thead>
            <tr><td colspan="3">이력서 제목 : ${ resume.restitle }</td></tr></thead>
            <tr>
                <td rowspan="4">
                    <img src="${resume.picture}" alt="pic" style="max-width: 200px;"/>
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td>${ resume.username } </td>
            </tr>
            <tr>
                <td>성별</td>
                <td>${ user.gender }</td>
            </tr>
            <tr>
                <td>휴대전화</td>
                <td>${ user.uphone }</td>
            </tr>
            <tr>
                <td>주소</td>
                <td colspan="2">${ user.uaddr }</td>
            </tr>
            <tr><td>학력</td><td colspan="2">${ resume.edu_name }</td></tr>
            <tr><td>경력</td><td colspan="2">${ resume.career_name }</td></tr>
            <tr>
                <td>자격증</td>
                <c:if test="${ licenseList[0] != null }">
                    <td colspan="2">
                        <c:forEach items="${ licenseList }" var="license">
                            ${ license } /
                        </c:forEach>
                    </td>
                </c:if>
            </tr>
            <tr>
                <td>기술분야</td>
                <td colspan="2">
                    <c:forEach items="${ skillList }" var="skill">
                        ${ skill.skill } /
                    </c:forEach>
                </td>
            </tr>
        </table>
        <!-- 자기소개서--------------------------------------------------- -->
        <table>
            <thead>
            <tr>
                <td colspan="3">자기소개서</td>
            </tr>
            </thead>
            <tr class="subtitle"><td colspan="3">성장배경</td></tr>
            <tr class="content"><td colspan="3">${ resume.background }</td></tr>
            <tr class="subtitle"><td colspan="3">성격의 장단점</td></tr>
            <tr class="content"><td colspan="3">${ resume.personality } </td></tr>
            <tr class="subtitle"><td colspan="3">지원동기</td></tr>
            <tr class="content"><td colspan="3">${ resume.motivation } </td></tr>
        </table>
    </div>
    <div class="container" >
    <%@include file="/WEB-INF/include/profile.jsp"%>
    </div>
</main>
<script>
    let resnum='${resume.resnum}';
    const boardBtnEl = document.querySelector('#boardBtn');

    boardBtnEl.addEventListener('click', function(){
        //alert('ok');
        window.location.href="/Gusik/Board";
    })

    document.getElementById("bookBtn").onclick=()=>{
        window.location.href="/Gusik/Book?resnum="+resnum;
    }
</script>
</body>
</html>