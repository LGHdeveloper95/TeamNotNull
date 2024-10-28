<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 정보 수정</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
</head>
<body>
    <h2>${compInfo.title} 수정하기</h2>
    <form action="${pageContext.request.contextPath}/CompInfo/Update" method="post" enctype="multipart/form-data">
        <!-- 숨겨진 필드로 comid 전달 -->
        <input type="hidden" name="comid" value="${compInfo.comid}" /> 
        
        <div>
            <label>기업 아이디:</label>
            <input type="text" name="comid" value="${compInfo.comid}" readonly />
        </div>
        <div>
            <label>소개:</label>
            <input type="text" name="title" value="${compInfo.title}" />
        </div>
        <div>
            <label>상세 소개:</label>
            <textarea name="content">${compInfo.content}</textarea>
        </div>
        <div>
            <label>연혁:</label>
            <textarea name="history">${compInfo.history}</textarea>
        </div>
        <div>
            <label>직원 수:</label>
            <input type="text" name="peopleNum" value="${compInfo.people_num}" readonly />
        </div>
        <div>
            <label>홈페이지:</label>
            <input type="text" name="link" value="${compInfo.link}" />
        </div>
        <div>
            <label>이미지 변경:</label>
            <input type="file" name="image" />
            <p>현재 이미지:</p> 
            <img src="${pageContext.request.contextPath}${image}" alt="${compInfo.title}" width="100"/>
        </div>
        <button type="submit">수정 완료</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/CompInfo/View?comid=${compInfo.comid}'">취소</button>
    </form>
</body>
</html>