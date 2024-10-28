<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 정보 작성</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
</head>
<body>
    <h2>기업 정보 작성하기</h2>
    <form action="${pageContext.request.contextPath}/CompInfo/Write" method="post" enctype="multipart/form-data">
        <div>
            <label>기업 아이디:</label>
            <input type="text" name="comid" value="${sessionScope.comid}" readonly />
        </div>
        <div>
            <label>소개:</label>
            <input type="text" name="title" />
        </div>
        <div>
            <label>상세 소개:</label>
            <textarea name="content"></textarea>
        </div>
        <div>
            <label>연혁:</label>
            <textarea name="history"></textarea>
        </div>
        <div>
            <label>직원 수:</label>
            <input type="text" name="peopleNum" />
        </div>
        <div>
            <label>홈페이지:</label>
            <input type="text" name="link" />
        </div>
        <div>
            <label>이미지:</label>
            <input type="file" name="image" />
        </div>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/CompInfo/Grid'">취소</button>
    </form>
</body>
</html>