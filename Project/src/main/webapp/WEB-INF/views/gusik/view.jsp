<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="/css/common.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Insert title here</title>
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
        button{ padding: 3px 10px; margin: 20px 0 0; }
        .subtitle{ background-color: skyblue; }
        .content{
            height: 300px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <div id="box">
        <button id="boardBtn" class="btn btn-primary">
            목록
        </button>
        <button id="headHuntingBtn" class="btn btn-primary">
            헤드헌팅
        </button>
        <table>
            <thead>
            <tr><td colspan="3">이력서 제목 : ${ resume.restitle }</td></tr></thead>
            <tr>
                <td rowspan="4">
                    <img src="/img/sinchanprofile.jpg" alt="pic" style="max-width: 200px;"/>
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
    <div class="profile"><!-- 로그인 프로필 -->
        <div><img src="/img/profile.png" alt="profile"></div>
        <div>${ sessionScope.boss }님<br>환영합니다</div>
        <div style="margin-top: 10px;">
            <a href="/ComMyPage/Board" class="abutton">Mypage</a>
            <a href="/Login/Logout" class="abutton">logout</a>
        </div>
    </div>
</main>
<script>
    let resnum='${resume.resnum}';
    const boardBtnEl = document.querySelector('#boardBtn');
    const HHBtnEl = document.querySelector('#headHuntingBtn');

    boardBtnEl.addEventListener('click', function(){
        //alert('ok');
        window.location.href="/Gusik/Board";
    })
    HHBtnEl.addEventListener('click', function(){
        //alert('ok');
        const result = confirm("정말로 헤드헌팅하시겠습니까?");
        if (result) {
            window.location.href='/Gusik/HeadHunting?resnum='+resnum;
        }
    })
</script>
</body>
</html>