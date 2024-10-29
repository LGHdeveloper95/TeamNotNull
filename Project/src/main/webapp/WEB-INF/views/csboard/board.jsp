<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>고객센터 게시판</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style>
       main {
	    max-width: 1200px;
	    margin: 0 auto;
	    padding: 20px;
	    background-color: #f9f9f9; /* 연한 회색 배경 */
	    border-radius: 8px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
	}
	
	h2 {
	    text-align: center;
	    margin-bottom: 20px;
	    color: #333; /* 짙은 회색 */
	}
	
	/* 버튼 스타일 */
	.btn-primary, .btn-secondary {
	    background-color: #333; /* 짙은 회색 (검정에 가까운) */
	    color: white;
	    padding: 10px 15px;
	    border: none;
	    border-radius: 5px;
	    font-size: 14px;
	    cursor: pointer;
	    margin-right: 10px;
	    display: inline-block;
	}
	
	.btn-secondary {
	    background-color: #555; /* 중간 회색 */
	}
	
	.btn-primary:hover, .btn-secondary:hover {
	    background-color: #000; /* 검정 */
	    transition: background-color 0.3s ease;
	}
	
	/* 테이블 스타일 */
	table {
	    width: 100%;
	    border-collapse: collapse;
	    margin-bottom: 20px;
	    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
	}
	
	table th, table td {
	    padding: 10px;
	    text-align: center;
	    border: 1px solid #ddd; /* 연한 회색 테두리 */
	}
	
	table th {
	    background-color: #333; /* 짙은 회색 */
	    color: white;
	    font-weight: bold;
	}
	
	table td a {
	    color: #333; /* 짙은 회색 */
	    text-decoration: none;
	}
	
	table td a:hover {
	    color: #000; /* 검정 */
	    text-decoration: underline;
	}
	
	/* 테이블 행 스타일 */
	table tbody tr:nth-child(even) {
	    background-color: #f2f2f2; /* 매우 연한 회색 */
	}
	
	table tbody tr:hover {
	    background-color: #e0e0e0; /* 조금 더 짙은 회색 */
	}
    </style>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp" %>

<main>
    <h2>고객센터 게시판</h2>



    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.qnum}</td>
                    <td>
					    <c:choose>
					        <c:when test="${not empty board.userid}">
					            ${board.userid}
					        </c:when>
					        <c:otherwise>
					            ${board.comid}
					        </c:otherwise>
					    </c:choose>
				   </td>
                    <td>
                       <a href="/Cs/View?qnum=${board.qnum}">
                            ${board.qtitle}
                        </a>
                    </td>
                     <td>${board.qdate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
	
	<!-- 세션에 userid 또는 comid 있는지 확인 -->
<c:if test="${not empty sessionScope.userid || not empty sessionScope.comid}">
    <a href="/Cs/Writeform" class="btn btn-primary">문의하기</a>
    <!-- 내가 쓴 글 보기 버튼 -->
    <form action="/Cs/myPosts" method="get" style="display:inline;">
        <button type="submit" class="btn btn-secondary">나의 문의 모아보기</button>
    </form>
</c:if>

    <%@include file="/WEB-INF/include/csPaging.jsp" %>

</main>

</body>
</html>

