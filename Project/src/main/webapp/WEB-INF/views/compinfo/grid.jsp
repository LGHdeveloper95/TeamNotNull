<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 정보 목록</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style>
        .grid-container { display: grid; grid-template-columns: repeat(4, 1fr); gap: 10px; }
        .grid-item { border: 1px solid #ddd; padding: 10px; text-align: center; transition: transform 0.3s; }
        .grid-item:hover { transform: scale(1.05); } /* 그리드 아이템 호버 시 확대 효과 */
        
        .grid-item img { transition: transform 0.3s; }
        .grid-item:hover img { transform: scale(1.1); } /* 이미지 호버 시 확대 효과 */

        .grid-item p { color: #000; margin-top: 10px; font-size: 1.1em; } /* 제목의 글자색을 검정색으로 */
        
        .pagination { text-align: center; margin-top: 20px; }
        .pagination a { margin: 0 5px; padding: 5px 10px; text-decoration: none; color: #333; border: 1px solid #ddd; }
        .pagination a.active { font-weight: bold; background-color: #007bff; color: #fff; border-color: #007bff; }
        
        /* 작성하기 버튼 스타일 */
        .write-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 5px;
        }
        .write-button:hover {
            background-color: #0056b3;
        }

        .button-container { text-align: left; margin-top: 20px; } /* 작성하기 버튼 위치 조정 */
    </style>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp" %>
<main>
    <h2>기업 정보 목록</h2>
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
    
    
</main>
</body>
<%@include file = "/WEB-INF/include/footer.jsp" %>
</html>