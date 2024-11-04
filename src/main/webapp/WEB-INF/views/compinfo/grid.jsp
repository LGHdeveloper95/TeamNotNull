<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GUGUIN : 기업정보목록</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style>
        /* 전체 컨테이너: 중앙 정렬 및 여백 설정 */
        .megabox {
            padding: 2% 5%; /* 상단 및 좌우 여백 설정 */
            align-content: center;
            vertical-align: top;
            border-radius: 10px; /* 모서리 둥글게 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
        }

        /* 전체 페이지의 큰 박스 중앙 정렬 및 반응형 배치 */
        .bigbigbox {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            gap: 10px; /* 내부 간격 */
        }

        /* 기업 정보 리스트 컨테이너 스타일 */
        .bigbox {
            display: inline-block;
            max-width: 1100px; /* 전체 너비 조정 */
            width: 75%; /* 내부 요소 너비 */
            text-align: center;
            padding: 20px; /* 내부 여백 */
            background-color: #f2f2f2; /* 배경색 */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            flex-direction: column;
            align-items: center;
            transform-origin: center;
            transition: transform 0.3s ease-in-out;
            margin-right: 20px;
        }

        /* 프로필 컨테이너 */
        .container {
            width: 265px;
            height: 65%;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
        
        /* 기업 정보 그리드: 4x2 형식으로 고정 */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 가로 4개 열 */
            grid-template-rows: repeat(2, auto); /* 세로 2줄로 고정 */
            gap: 15px;
            width: 100%;
        }

        /* 그리드 아이템 스타일 */
        .grid-item {
            border: 2px solid #cccccc; /* 테두리 색 */
            padding: 10px;
            text-align: center;
            transition: transform 0.3s, color 0.3s; /* 색상 전환 추가 */
            background-color: #f9f9f9; /* 배경색 */
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            color: #333333; /* 기본 텍스트 색상 */
            font-weight: bold; /* 글씨 볼드체 */
        }

        /* 그리드 아이템 호버 효과 */
        .grid-item:hover {
            transform: scale(1.05);
        }

        /* 그리드 이미지 스타일 */
        .grid-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
            transition: transform 0.3s;
        }

        /* 그리드 이미지 호버 효과 */
        .grid-item:hover img {
            transform: scale(1.1);
        }

        /* 그리드 텍스트 스타일 */
        .grid-item p {
            color: black; /* 기본 텍스트 색상 상속 */
            margin-top: 10px;
            font-size: 1.1em;
            font-weight: bold;
            transition: transform 0.3s, color 0.3s;
        }

        /* 텍스트 호버 효과 */
        .grid-item:hover p {
            color: black; /* 호버 시 텍스트 색상 */
            transform: scale(1.1); /* 텍스트 크기 확대 */
        }

        /* 페이지네이션 스타일 */
        .pagination {
            text-align: center;
            margin-top: 20px;
        }

        /* 페이지네이션 버튼 */
        .pagination a {
            margin: 0 5px;
            padding: 5px 10px;
            text-decoration: none;
            background-color: black;
            color: white;
            border-radius: 10%;
        }

        /* 현재 페이지 강조 */
        .pagination a.active {
            font-weight: bold;
            background-color: #575757;
            color: #fff;
            border-color: #007bff;
            border-radius: 10%;
        }

        /* 작성하기 버튼 스타일 */
        .write-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #ccc;
            color: #333;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 5px;
            font-weight: bold;
        }

        /* 작성하기 버튼 호버 효과 */
        .write-button:hover {
            background-color: #333;
            color: white;
        }

        /* 작성 버튼의 전체 컨테이너 */
        .button-container {
            text-align: left;
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp" %>
<main>
     <div class="megabox">
    <div class="bigbigbox">
    <form class="bigbox">  
        <div class="grid-container">
            <c:forEach var="company" items="${compInfoList}" varStatus="status">
                <div class="grid-item">
                    <a href="${pageContext.request.contextPath}/CompInfo/View?comid=${company.comid}">
                        <img src="${imageList[status.index]}" alt="${imageList[status.index]}" />
                        <p>${company.title}</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </form>
        <div class="container">
        <%@include file="/WEB-INF/include/profile.jsp" %>
       </div>
    </div>

    <c:if test="${paging.totalPages > 1}">
        <div class="pagination">
            <c:forEach begin="1" end="${paging.totalPages}" var="page">
                <a href="?page=${page}" class="${page == paging.page ? 'active' : ''}">${page}</a>
            </c:forEach>
        </div>
    </c:if>

    <!-- 작성 버튼: 기업아이디로 로그인한 사용자에게만 표시 -->
    <c:if test="${not empty sessionScope.comid}">
        <div class="button-container">
            <button class="write-button" onclick="location.href='${pageContext.request.contextPath}/CompInfo/Write'">작성하기</button>
        </div>
    </c:if>
     </div>
</main>
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>

