<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GUGUIN : 매칭목록</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet"  href="/css/common.css" />
    <style>
    .bigbax{
                padding: 0 auto;
                width: 100%;
           }
    
        .box{
            margin-top: -10%;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            height: 100vh;
        }
        #rectable {
           margin-top: -20%;
            flex: 2;
            max-width: 1000px;
            max-height: 500px; /* 최대 높이 설정 */
            /* overflow-y: auto; */ /* 세로 스크롤 추가 */
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px 10px 10px;        }
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

        
        .container {
            width: 250px;
            margin-top: -10%;
            height: 40%;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        #write{
            text-align: center;
        }
      .page {
    margin: 20px 0;
    display: flex;
    justify-content: center;
    gap: 5px;
}

.page a {
    padding: 8px 12px;
    background-color: #ccc;
    color: #333;
    border-radius: 4px;
    text-decoration: none;
    transition: background-color 0.3s, color 0.3s;
}

.page a:hover {
    background-color: #333;
    color: white;
}

.page a.pagenum {
    margin: 0 3px; /* 화살표와 숫자 간격 조정 */
}
/* 현재 페이지 스타일 */
.page a.active {
    background-color: #333;
    color: white;
}
        .none{
            display: none;
        }    </style>
</head>
<body>
<%@include file = "/WEB-INF/include/head.jsp" %>
<main>
<div class="bigbax" >
   <div class="box">
    <div id="rectable">
        <table>
            <thead>
            <tr>
                <td>구직공고</td>
            </tr>
            </thead>
            <c:if test= "${ empty resList }">
                <tr>
                    <td>구인공고가 없습니다 😢</td>
                </tr>
            </c:if>
            <c:if test="${ not empty resList }">
                <c:forEach items="${ resList }" var="res">
                    <!-- ${ rec } userid=null, userpw=null, username=null, RECNUM=rec001, COMID=null, RECTITLE=소프트웨어 개발자 모집 -->
                    <tr>
                        <td>
                            <a href="/Gusik/View?resnum=${ res.resnum }">${ res.restitle }</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        <c:if test="${not empty sessionScope.userid}">
            <a href="/Gusik/Write?comid=${sessionScope.userid}" id ="write">글쓰기</a>
        </c:if>
         <div class="page">
                    <a class="pagenum" href="?pageNo=1">&lt;&lt;</a>
                    <a class="${page.startPage>1? 'pagenum':'none'}" href="?pageNo=${page.startPage-1}">&lt;</a>
                    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                        <a class="pagenum" href="?pageNo=${i}">${i}</a>
                    </c:forEach>
                    <a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?pageNo=${page.endPage+1}">&gt;</a>
                    <a class="pagenum" href="?pageNo=${page.totalPage}">&gt;&gt;</a>
                </div>
    </div>
    <div class="container" >
    <%@include file="/WEB-INF/include/profile.jsp"%>
    </div>
    
   </div>
    
    
</div>

</main>
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>


