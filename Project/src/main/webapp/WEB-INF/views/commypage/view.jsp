<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico"/>
    <link rel="stylesheet" href="/css/common.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        #rectable {
            margin: 20px auto;
            max-width: 800px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background-color: #f2f2f2;
        }

        thead td {
            font-weight: bold;
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #ccc;
        }

        tbody tr {
            transition: background-color 0.3s;
        }

        tbody td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
        }

        a {
            text-decoration: none;
            color: #333;
        }

        a:hover {
            text-decoration: underline;
        }

        body > *

        not
        (
        header

        )
        {
            display: flex
        ;
            justify-content: center
        ; /* 수평 중앙 정렬 */
            align-items: center
        ; /* 수직 중앙 정렬 */
            min-height: 100vh
        ; /* 화면 전체 높이 사용 */
            background-color: #f9f9f9
        ; /* 배경색 (선택 사항) */
        }
        main {
            width: 80%;
            display: flex; /* Flexbox 사용 */
            align-items: flex-start; /* 위쪽 정렬 */
            margin: 20px; /* 메인 마진 추가 */
            gap: 20px; /* 두 div 사이에 간격 추가 */
            justify-content: space-between; /* 요소들 사이의 공간 조정 */
        }

        #rectable {
            max-width: 800px; /* 최대 너비 설정 */
            border: 1px solid #ccc;
            border-radius: 8px;
            flex: 1;

            /* Flex-grow로 크기 조정 */
        }

        td:nth-child(1) {
            width: 70%;

        }
        td img{
             width:20%;
        }

        .profile {
            flex: 0 0 150px; /* 고정 너비를 120px로 설정 */
            display: flex;
            flex-direction: column; /* 세로 방향 정렬 */
            align-items: center; /* 중앙 정렬 */
        }

        .profile img {
            width: 80px; /* 프로필 이미지 너비를 80px로 설정 */
            height: auto; /* 비율 유지 */
            border-radius: 50%; /* 원형으로 만들기 (선택 사항) */
        }

        #write {
            text-align: center;
        }
    </style>
</head>
<body>
<main>
    <div id="box">
        <button id="updateBtn">
            합격
        </button>
        <button id="deleteBtn">
            불합격
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
</main>
<script>
    const updateBtnEl = document.querySelector('#updateBtn');
    const deleteBtnEl = document.querySelector('#deleteBtn');

    updateBtnEl.addEventListener('click', function(){
        const result = confirm("정말로 합격하시겠습니까?");
        if (result) {
        window.location.href="/ComMyPage/ResumePass?sendnum=${resume.sendnum}&pass_code=1";}
    })
    deleteBtnEl.addEventListener('click', function(){
        //alert('ok');
        const result = confirm("정말로 붛합격하시겠습니까?");
        if (result) {
            window.location.href="/ComMyPage/ResumePass?sendnum=${resume.sendnum}&pass_code=0";        }
    })
</script>
    </div>
</main>
</body>
</html>


