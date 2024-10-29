<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="icon" type="image/png" href="/img/favicon.ico" />
  <link rel="stylesheet"  href="/css/common.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>마이페이지 - 이력서 목록</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9; /* 배경 색상 설정 */
    }
    #container {
      display: flex; /* 플렉스박스 사용 */
      width: 90%;
      margin: 20px auto;
      padding: 20px;
    }
    /* 왼쪽: 테이블 영역 */
    .table-container {
      flex: 3; /* 테이블 영역 비율 */
    }
    /* 오른쪽: 프로필 영역 */
    .profile {
      flex: 1; /* 프로필 영역 비율 */
      text-align: center;
      padding: 20px;
      margin-left: 20px; /* 테이블과의 간격 */
      border-radius: 8px;
      border: 1px solid #ccc;
      background-color: #f1f1f1; /* 프로필 배경 색상 */
    }
    /* 라디오 메뉴바 스타일 */
    .radio-menu {
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
    }
    .radio-menu label {
      padding: 10px 20px;
      margin: 0 10px;
      background-color: #f2f2f2;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
    }
    .radio-menu input[type="radio"] {
      display: none;
    }
    .radio-menu input[type="radio"]:checked + label {
      background-color: #4CAF50;
      color: white;
    }
    /* 테이블 스타일 */
    .listtable {
      display: none;
      width: 100%;
      margin-top: 20px;
    }
    .listtable table {
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
    tbody tr:hover {
      background-color: #f1f1f1;
    }
    a {
      text-decoration: none;
      color: #333;
    }
    a:hover {
      text-decoration: underline;
    }
    /* 프로필 이미지 스타일 */
    .profile img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 10px; /* 이미지와 텍스트 간격 */
    }
    .profile div {
      margin: 10px 0;
    }
    .abutton {
      display: block;
      padding: 10px;
      margin: 10px auto;
      background-color: #4CAF50;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      text-align: center;
      width: 150px;
    }
    .abutton:hover {
      background-color: #45a049;
    }
    /* 상태에 따른 색상 */
    .status-review {
      color: orange;
    }
    .status-pass {
      color: green;
    }
    .status-fail {
      color: red;
    }
  </style>
  <script>
    // 자바스크립트를 사용하여 선택된 메뉴에 따라 테이블을 보여주는 함수
    function switchTable(menu) {
      // 모든 테이블 숨기기
      document.getElementById('resumeTable').style.display = 'none';
      document.getElementById('bookmarkTable').style.display = 'none';
      document.getElementById('scrapTable').style.display = 'none';

      // 선택한 메뉴에 맞는 테이블만 보이기
      document.getElementById(menu + 'Table').style.display = 'table';
    }

    // 페이지 로드 시 기본 선택된 테이블 보여주기
    window.onload = function() {
      switchTable('resume');
    }
  </script>
</head>
<body>
<%@include file = "/WEB-INF/include/head.jsp" %>
<main>

  <div id="container">
    <!-- 왼쪽: 테이블 영역 -->
    <div class="table-container">
      <!-- 라디오 메뉴바 -->
      <div class="radio-menu">
        <!-- 라디오 버튼 클릭 시 switchTable 함수 호출 -->
        <input type="radio" name="menu" value="resume" id="resume" checked onclick="switchTable('resume')">
        <label for="resume">제출된 이력서</label>

        <input type="radio" name="menu" value="bookmark" id="bookmark" onclick="switchTable('bookmark')">
        <label for="bookmark">북마크</label>

      </div>

      <!-- 제출한 이력서 목록 테이블 -->
      <div id="resumeTable" class="listtable">
        <table>
          <thead>
          <tr>
            <td>제목</td>
            <td>날짜</td>
            <td>상태</td>
          </tr>
          </thead>
          <tbody>
          <!-- 제출한 이력서 데이터 출력 -->
          <c:forEach items="${resList}" var="resume">
            <tr>
              <td><a href="/ComMyPage/View?sendnum=${resume.sendnum}"
                     onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">
                  ${resume.restitle}</a></td>
              <td>${resume.reg_date}</td>
              <td>
                <!-- 상태값에 따른 스타일링 -->
                <c:choose>
                  <c:when test="${resume.pass_code == null}">
                    <span class="status-review">심사중</span>
                  </c:when>
                  <c:when test="${resume.pass_code == 1}">
                    <span class="status-pass">합격</span>
                  </c:when>
                  <c:when test="${resume.pass_code == 0}">
                    <span class="status-fail">불합격</span>
                  </c:when>
                  <c:otherwise>
                    <span>상태없음</span>
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

      <!-- 북마크 목록 테이블 -->
      <div id="bookmarkTable" class="listtable">
        <table>
          <thead>
          <tr>
            <td>북마크 제목</td>
            <td>북마크 날짜</td>
          </tr>
          </thead>
          <tbody>
          <!-- 북마크 데이터 출력 -->
          <c:forEach items="${bookmarkList}" var="bookmark">
            <tr>
              <td><a href="/Bookmark/View?id=${bookmark.id}">${bookmark.title}</a></td>
              <td>${bookmark.date}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

      <!-- 스크랩 목록 테이블 -->
      <div id="scrapTable" class="listtable">
        <table>
          <thead>
          <tr>
            <td>스크랩 제목</td>
            <td>스크랩 날짜</td>
          </tr>
          </thead>
          <tbody>
          <!-- 스크랩 데이터 출력 -->
          <c:forEach items="${scrapList}" var="scrap">
            <tr>
              <td><a href="/Scrap/View?id=${scrap.id}">${scrap.title}</a></td>
              <td>${scrap.date}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>

    <!-- 오른쪽: 로그인 프로필 영역 -->
    <div class="profile">
      <div><img src="/img/profile.png" alt="profile"></div>
      <div>${sessionScope.comname}님<br>환영합니다</div>
      <div style="margin-top: 10px;">
        <a href="/ComMyPage/UpdateForm" class="abutton">내 정보 수정</a>
        <a href="/ComMyPage/UpdatePassForm" class="abutton">비밀번호 변경</a>
        <a href="/Login/Logout" class="abutton">Logout</a>
      </div>
    </div>
  </div>
</main>
</body>
</html>