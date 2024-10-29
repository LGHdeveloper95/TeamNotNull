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
            margin: 20px auto;
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
        main>div{width: 100%;}
        button{ padding: 3px 10px; }
        .subtitle{ background-color: skyblue; }
        .content{
            height: 500px;
            vertical-align: top;
        }
        .btn{
            margin-left: 30px;
        }
    </style>

</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <div>
        <table>

            <thead>
            <tr>
                <td colspan="2">공고 제목 : ${ post.rectitle }</td>
                <td>
                    <a class = "btn btn-primary" href="/Post/Board">목록</a>
                    <c:if test="${sessionScope.comid eq post.comid}">
                        <a class = "btn btn-primary"  href="/Post/UpdateForm?recnum=${post.recnum}">수정 </a>
                        <a class = "btn btn-primary"  href="/Post/Delete?recnum=${post.recnum}">삭제 </a>
                    </c:if>
                </td>
            </tr>
            </thead>
            <tr>
                <td>부제 </td>
                <td colspan="2">${post.subtitle}</td>
            </tr>
            <tr>
                <td colspan="2"> 작성일 ${post.reg_date}</td>
                <td> 마감일 ${post.deadline}</td>
            </tr>
            <tr>
                <td rowspan="4" style="max-width: 130px; text-align: center;"><img src="/img/samsung.png" alt="pic" style="width: 80%;"/></td>
                <td>기업 이름</td>
                <td>${ com.comname } </td>
            </tr>
            <tr>
                <td>대표자</td>
                <td>${com.boss}</td>
            </tr>
            <tr>
                <td>회사 연락처</td>
                <td>${ com.cphone }</td>
            </tr>
            <tr>
                <td>주소</td>
                <td colspan="2">${ com.caddr }</td>
            </tr>
            <tr><td>우대 학력</td><td colspan="2">${ post.edu_name }</td></tr>
            <tr><td>우대 경력</td><td colspan="2">${ post.career_name }</td></tr>
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
                    <c:forEach items="${ skillList }" var="skill">
                        ${ skill.skill } /
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td>근무 지역</td>
                <td colspan="2">
                    <div>${region.sido}  ${region.gugun}</div>
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
            <tr class="content"><td colspan="3">${ post.gcontent }</td></tr>
        </table>
    </div>
    <%@include file="/WEB-INF/include/profile.jsp"%>

</main>
</body>
</html>


