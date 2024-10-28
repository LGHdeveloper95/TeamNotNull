<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="icon" type="image/png" href="/img/favicon.ico"/>
    <link rel="stylesheet" href="/css/common.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        #rectable {
            margin: 20px auto;
            max-width: 800px;
            border: 1px solid #ccc;
            border-radius: 8px;
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

        body > *

        not
        (
        header

        )
        {
            display: flex
        ;
            justify-content: center
        ; /* 수평 중앙 정렬 */
            align-items: center
        ; /* 수직 중앙 정렬 */
            min-height: 100vh
        ; /* 화면 전체 높이 사용 */
            background-color: #f9f9f9
        ; /* 배경색 (선택 사항) */
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
            width: 70%;

        }
        td img{
             width:20%;
        }

        .profile {
            flex: 0 0 150px; /* 고정 너비를 120px로 설정 */
            display: flex;
            flex-direction: column; /* 세로 방향 정렬 */
            align-items: center; /* 중앙 정렬 */
        }

        .profile img {
            width: 80px; /* 프로필 이미지 너비를 80px로 설정 */
            height: auto; /* 비율 유지 */
            border-radius: 50%; /* 원형으로 만들기 (선택 사항) */
        }

        #write {
            text-align: center;
        }
    </style>
</head>
<body>
<main>
    <div id="rectable">
        <table>
            <tr>
                <h4>Title:</h4>
                <td colspan="2">${res.restitle}</td>
            </tr>
            <tr>
                <th colspan="2">ConTent</th>
            </tr>
            <tr>
                <td><h4>인적사항</h4>
                    <div> 이름: ${user.username}</div>
                    <div> 생년월일: ${user.birth}</div>
                    <div> 휴대폰: ${user.uphone}</div>
                    <div> 주소: ${user.uaddr}</div>
                    <div> 이메일: ${user.email}</div>
                </td>
                <td>사진:<img src="/img/profile.png">${res.picture}</td>
            </tr>
            <tr>
                <td colspan="2">
                    <div>학력:${res.edu_content}</div>
                    <div>경력:${res.career_content}</div>
                    <div>자격증:${res.license}</div>
                    <div>스킬:${res.skill} </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                 <textarea cols="100" rows="40">${res.motivation}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="/ComMyPage/Pass?pass_id=1" class="btn btn-success" role="button">합격</a>
                    <a href="/ComMyPage/Pass?pass_id=0"class="btn btn-danger" role="button">불합격</a>
                </td>
            </tr>
        </table>
    </div>
</main>
</body>
</html>


