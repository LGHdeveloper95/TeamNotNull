<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GUGUIN : 공고목록</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet"  href="/css/common.css" />
    <style>
        #rectable {
            margin: 20px auto;
            width: 800px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
         .container {
            width: 250px;
            height:40%;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
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
            flex: 1;

            /* Flex-grow로 크기 조정 */
        }
        td:nth-child(1) {
            width:80%;
        }

        #write{
            display: block;
            float: right;
            padding: 20px 30px;
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
                <td colspan="2">나의 공고</td>
            </tr>
            </thead>
            <c:if test= "${ empty postList }">
                <tr>
                    <td>작성한 공고가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${ not empty postList }">
                <c:forEach items="${ postList }" var="post">
                    <!-- ${ post } userid=null, userpw=null, username=null, RECNUM=rec001, COMID=null, RECTITLE=소프트웨어 개발자 모집 -->
                    <tr>
                        <td colspan="2"><a href="/Post/View?recnum=${ post.recnum }">${ post.rectitle }</a></td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        <c:if test="${not empty sessionScope.comid}">
            <a href="/Post/WriteForm" id ="write">글쓰기</a>
        </c:if>
    </div>
    
    <div class="container">
    <%@include file="/WEB-INF/include/profile.jsp"%>
    </div>
</main>
</body>
<%@include file="/WEB-INF/include/footer.jsp"%>

</html>


