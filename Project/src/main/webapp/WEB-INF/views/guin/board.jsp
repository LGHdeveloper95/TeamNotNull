<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet"  href="/css/common.css" />
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
        body>*not(header){
            display: flex;
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
            min-height: 100vh; /* 화면 전체 높이 사용 */
            background-color: #f9f9f9; /* 배경색 (선택 사항) */
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
            flex: 1; /* Flex-grow로 크기 조정 */
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
        #write{
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file = "/WEB-INF/include/head.jsp" %>
<main>
    <div id="rectable">
        <table>
            <thead>
            <tr>
                <td>구인공고</td>
            </tr>
            </thead>
            <c:if test= "${ empty recList }">
                <tr>
                    <td>모집중인 공고가 없습니다 😢</td>
                </tr>
            </c:if>
            <c:if test="${ not empty recList }">
                <c:forEach items="${ recList }" var="rec">
                    <!-- ${ rec } userid=null, userpw=null, username=null, RECNUM=rec001, COMID=null, RECTITLE=소프트웨어 개발자 모집 -->
                    <tr>
                        <td>
                            <a href="/Guin/View/recnum=${ rec.recnum }">${ rec.rectitle }</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        <c:if test="${not empty sessionScope.comid}">
            <a href="/Guin/Write?comid=${sessionScope.comid}" id ="write">글쓰기</a>
        </c:if>
    </div>
    <div class="profile">
        <div><img src="/img/profile.png" alt="profile"></div>
        <div>
            <c:if test="${not empty sessionScope.userid}">${ sessionScope.userid }님 환영합니다</c:if>
            <c:if test="${not empty sessionScope.comid}">${ sessionScope.comid }님 환영합니다</c:if>
            <c:if test="${ empty sessionScope.userid && empty sessionScope.comid }">로그인이 필요합니다
                <div><a href="/Login/">로그인</a></div>
            </c:if>
        </div>
        <div>
            <c:if test="${not empty sessionScope.userid || not empty sessionScope.comid}">
                <a href="">Mypage</a>
                <a href="/Login/Logout">logout</a>
            </c:if>
        </div>
    </div>
</main>
</body>
</html>


