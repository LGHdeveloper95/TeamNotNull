<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GUGUIN : 기업상세정보</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico" />
    <style>
        /* 흐릿한 배경 이미지 설정 */
        body {
            background: url('${pageContext.request.contextPath}${image}') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(10px);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .box {
            background-color: rgba(255, 255, 255, 0.9); /* 반투명 흰색 배경 */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
            text-align: center;
            width: 400px; /* 박스 크기 적당히 */
        }

        .box img {
            width: 350px; /* 이미지 크기 조절 */
            margin-bottom: 20px;
        }

        /* 라벨과 입력 필드 스타일 */
        .info-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-bottom: 15px;
        }

        .info-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .info-group input {
            font-size: 16px;
            color: #333;
            border: none;
            background-color: transparent;
            width: 100%;
            text-align: left;
            padding: 8px;
            font-family: Arial, sans-serif;
        }

        .box button {
            background-color: #333; /* 검정 버튼 */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .box button:hover {
            background-color: #000; /* 마우스 호버 시 */
        }

        .box button:active {
            transform: scale(0.98); /* 클릭 시 약간 작아지는 효과 */
        }
         /* 별점 UI */
        .rating {
            display: inline-flex;
            align-items: center;
           /*  margin-left: 10px; */
            font-size: 1.2em;
            color: #FFD700; /* 별 색상 */
            background-color: #333;
            border-radius: 15%;
            padding: 3px;
        }
        .info-group button:hover {
        background-color: #333; /* 호버 시 검정색으로 변경 */
    }
    </style>
</head>
<body>
    <div class="box">
        <img src="${pageContext.request.contextPath}${image}" alt="${compInfo.title}" />
        
         <div style="display: flex; justify-content: center; align-items: center;">
            <h2>${compInfo.title}</h2>
            <div class="rating" style="margin-left: 10px;">
                ${avgStarPoint} ★ <!-- 평균 별점 출력 -->
            </div>
        </div>
        <div class="info-group">
            <label>직원 수</label>
            <input type="text" value="${compInfo.people_num}" readonly />
        </div>

        <div class="info-group">
            <label>상세 소개</label>
            <input type="text" value="${compInfo.content}" readonly />
        </div>

        <div class="info-group">
            <label>연혁</label>
            <input type="text" value="${compInfo.history}" readonly />
        </div>

        <div class="info-group">
			    <button onclick="window.open('${compInfo.link}', '_blank')" style="background-color: #888; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; transition: background-color 0.3s;">
			        자사 사이트 방문
			    </button>
        </div>
        <div>
            <button onclick="location.href='${pageContext.request.contextPath}/CompInfo/Grid'">목록</button>
            <c:if test="${sessionScope.comid == compInfo.comid}">
                <button onclick="location.href='${pageContext.request.contextPath}/CompInfo/Update?comid=${compInfo.comid}'">수정</button>
                <form action="${pageContext.request.contextPath}/CompInfo/Delete/${compInfo.comid}" method="post" style="display:inline;">
                    <button type="submit">삭제</button>
                </form>
            </c:if>
        </div>
    </div>
</body>
</html>

