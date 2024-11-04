<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GUGUIN : 기업정보작성</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style>
        body {
            background-color: #fff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('/img/bgimg.png') no-repeat center center fixed;
            background-size: cover;
            filter: blur(10px);
            opacity: 0.5;
            z-index: -1;
        }

        .big-div {
            background-color: #f9f9f9;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 600px;
            z-index: 1;
        }

        .form-floating {
            position: relative;
            margin-bottom: 20px;
        }

        .form-floating input, .form-floating textarea {
            width: 100%;
            padding: 15px 10px 10px 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
        }

        .form-floating label {
            position: absolute;
            top: 15px;
            left: 10px;
            font-size: 16px;
            color: #aaa;
            transition: all 0.2s ease;
            pointer-events: none;
        }

        .form-floating input:focus ~ label,
        .form-floating input:not(:placeholder-shown) ~ label,
        .form-floating textarea:focus ~ label,
        .form-floating textarea:not(:placeholder-shown) ~ label {
            top: 5px;
            font-size: 12px;
            color: #333;
        }

        .submit-btn, .cancel-btn {
            height: 40px;
            padding: 0 15px;
            border: none;
            background-color: #d3d3d3;
            color: black;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin: 10px 5px;
        }

        .submit-btn:hover, .cancel-btn:hover {
            background-color: #333;
            color: white;
            transform: scale(1.02);
        }
    </style>
</head>
<body>
    <div class="big-div">
        <h2>기업 정보 작성하기</h2>
        <form action="${pageContext.request.contextPath}/CompInfo/Write" method="post" enctype="multipart/form-data">
            <div class="form-floating">
                <input type="text" id="companyId" name="comid" value="${sessionScope.comid}" readonly placeholder=" ">
                <label for="companyId">기업 아이디</label>
            </div>
            <div class="form-floating">
                <input type="text" id="title" name="title" placeholder=" ">
                <label for="title">소개</label>
            </div>
            <div class="form-floating">
                <textarea id="content" name="content" placeholder=" "></textarea>
                <label for="content">상세 소개</label>
            </div>
            <div class="form-floating">
                <textarea id="history" name="history" placeholder=" "></textarea>
                <label for="history">연혁</label>
            </div>
            <div class="form-floating">
                <input type="text" id="peopleNum" name="peopleNum" placeholder=" ">
                <label for="peopleNum">직원 수</label>
            </div>
            <div class="form-floating">
                <input type="text" id="link" name="link" placeholder=" ">
                <label for="link">홈페이지</label>
            </div>
            <div class="form-floating">
                <input type="file" id="image" name="image" placeholder=" ">
                <label for="image">이미지</label>
            </div>
            <button type="submit" class="submit-btn">등록</button>
            <button type="button" class="cancel-btn" onclick="location.href='${pageContext.request.contextPath}/CompInfo/Grid'">취소</button>
        </form>
    </div>
</body>
</html>