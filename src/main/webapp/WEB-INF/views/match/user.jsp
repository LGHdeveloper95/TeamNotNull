<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
    <title>GUGUIN : 매칭정보</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style>
        .bigbox {
            padding: 2% 5%;
            align-content: center;
            vertical-align: top;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* inbox: 화면 정중앙에 위치시키기 */
        .inbox {
            margin-top: -10%;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            height: 100vh;
        }

        /* rectable: 가로 크기 확장 및 세로 스크롤 추가 */
        #rectable {
            margin-top: -20%;
            flex: 2;
            max-width: 1000px;
            max-height: 500px; /* 최대 높이 설정 */
            /* overflow-y: auto; */ /* 세로 스크롤 추가 */
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px 10px 10px;
        }

        .container {
            width: 250px;
            margin-top: -10%;
            height: 40%;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            padding: 10px;
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

        .bookmark {
            color: #333;
        }

        .bookmark.active {
            color: #ff0000;
        }
               .page{
            margin: 20px 0;
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
        }
    </style>
</head>
<body>
<%@include file = "/WEB-INF/include/head.jsp" %>
<main>
    <div class="bigbox">
        <div class="inbox">
            <div id="rectable">
                <table>
                    <thead>
                        <tr>
                            <td>구인공고</td>
                            <td>회사명</td>
                            <td>스크랩</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty recList}">
                            <tr>
                                <td colspan="3">모집중인 공고가 없습니다 😢</td>
                            </tr>
                        </c:if>
                        <c:if test="${not empty recList}">
                            <c:forEach items="${recList}" var="rec">
                                <tr>
                                    <td><a href="/Guin/View?recnum=${rec.recnum}">${rec.rectitle}</a></td>
                                    <td><a href="/Comp/View?comid=${rec.comname}">${rec.comname}</a></td>
                                    <td>
                                        <a href="javascript:void(0);" onclick="addScrap('${rec.recnum}', '${rec.comid}')">
                                            <i class="bi bi-file-earmark-plus"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
                <c:if test="${not empty sessionScope.comid}">
                    <a href="/Guin/Write?comid=${sessionScope.comid}" id="write">글쓰기</a>
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
            <div class="container">
                <%@include file="/WEB-INF/include/profile.jsp" %>
            </div>
        </div>
    </div>
</main>
<script>
    const loginBtnEl = document.querySelector('#loginBtn');
    if (loginBtnEl != null) {
        loginBtnEl.addEventListener('click', function() {
            window.location.href = '/Login/';
        });
    }

    function addScrap(recnum, comid) {
        fetch('/Guin/AddScrap', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ recnum: recnum, comid: comid })
        })
        .then(response => response.text())
        .then(text => {
            if (text === "scrapExists") {
                alert('이미 스크랩 했습니다');
            } else if (text === "success") {
                alert('스크랩 했습니다');
            } else if (text.includes("redirect:/Login")) {
                window.location.href = "/Login";
            } else {
                alert('스크랩 추가 실패');
            }
        })
        .catch(error => console.error('Error:', error));
    }
</script>
</body>
<%@include file = "/WEB-INF/include/footer.jsp" %>
</html>