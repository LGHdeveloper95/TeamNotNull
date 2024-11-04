<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
    <title>GUGUIN : 공고상세보기</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet"  href="/css/common.css" />
    <style>
        .bigbox {
            padding: 2% 5%;
            align-content: center;
            vertical-align: top;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            justify-content: center; /* 전체 화면 가운데 정렬 */
            min-height: 100vh; /* 화면 전체 높이 */
        }

        /* inbox: 화면 중앙에 위치 및 flex 설정 */
        .inbox {
             margin-top: -22%; 
            display: flex;
            justify-content: space-around; /* 요소 간 공간 확보 */
            align-items: center; /* 수직 중앙 정렬 */
            gap: 10px;
            width: 70%; /* 전체 화면 너비 */
            max-width: 1200px; /* 최대 너비 제한 */
        }

        #rectable {
        flex-grow: 2; /* 가로 확장 */
        height: 70%;
        margin-bottom: -30%;
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow: auto; /* 내부 콘텐츠가 넘치지 않도록 설정 */
        max-width: 100%; /* 부모 요소의 너비 제한 */
    }

        .container {
            width: 250px;
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

        #write {
            text-align: center;
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
                <td colspan="2">공고 제목 : ${ po.rectitle }</td>
                <td>
                    <a class = "btn btn-primary" href="/Guin/Board">목록</a>                          
                    <a class = "btn btn-primary" href="javascript:void(0);" onclick="openResume('${po.recnum}')">지원하기</a>                        
                </td>
            </tr>
            </thead>
            <tr>
                <td>부제 </td>
                <td colspan="2">${po.subtitle}</td>
            </tr>
            <tr>
                <td> 작성일</td> <td> ${po.reg_date}</td>
                <td style="text-align: center"> 마감일 ${po.deadline}</td>
            </tr>
            <tr>
                <td>기업 이름</td>
                <td>${ co.comname } </td>
                <td rowspan="4" style="max-width: 300px; text-align: center;"><img src="/${po.image_path}" alt="pic" style="max-width: 260px; max-height: 260px;"/></td>
            </tr>
            <tr>
                <td>대표자</td>
                <td>${co.boss}</td>
            </tr>
            <tr>
                <td>회사 연락처</td>
                <td>${ co.cphone }</td>
            </tr>
            <tr>
                <td>주소</td>
                <td colspan="2">${ co.caddr }</td>
            </tr>
            <tr><td>우대 학력</td><td colspan="2">${ po.edu_name }</td></tr>
            <tr><td>우대 경력</td><td colspan="2">${ po.career_name }</td></tr>
            <tr>
                <td>우대 자격증</td>
                <c:if test="${ licenseList[0] != null }">
                    <td colspan="2">
                        <c:forEach items="${ licenseList }" var="license">
                            ${ license } /
                        </c:forEach>
                    </td>
                </c:if>
                <c:if test="${licenseList[0] eq null}">
                    <td colspan="2"> 없음</td>
                </c:if>
            </tr>
            <tr>
                <td>우대 기술</td>
                <td colspan="2">
                    <c:forEach items="${ sk }" var="skill">
                        ${ skill.skill } /
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td>근무 지역</td>
                <td colspan="2">
                    <div>${re.sido}  ${re.gugun}</div>
                </td>
            </tr>
        </table>
        <!-- 자기소개서--------------------------------------------------- -->
        <table>
            <thead>
            <tr>
                <td colspan="3">회사 소개</td>
            </tr>
            </thead>
            <tr class="content"><td colspan="3">${ po.gcontent }</td></tr>
        </table>
            </div>
            <div class="container">
                <%@include file="/WEB-INF/include/profile.jsp"%>
            </div>    
        </div>
    </div>
</main>

<script>

    function openResume(resnum) {
        window.open('/Guin/Apply?recnum=' + resnum, 'resumePopup', 'width=550,height=300');
    }
</script>
</body>
<%@include file = "/WEB-INF/include/footer.jsp" %>
</html>