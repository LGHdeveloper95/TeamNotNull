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
  <style>
    #menu_button {
    td{
      text-align: center;
      background: #333;
      color:white;
      font-weight: bold;
      border: 1px solid silver;
      padding: 0;
    }
    td:hover{
      background: #c0c0c0;
      color:white;
    }
    a{
      text-decoration:none;
      color:white;
      display:block;
      padding:15px 65px;
      width:100%;
    }

    }
    #listtable {
      margin: 20px auto;
      border: 1px solid #ccc;
      border-radius: 8px;
      max-width: 100%; /* 최대 너비 설정 */
      flex: 1; /* Flex-grow로 크기 조정 */
    }
    table { width: 100%; border-collapse: collapse; }
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
    .profile {
      width: 20%;
      height: 40%;
      display: flex;
      flex-direction: column; /* 세로 방향 정렬 */
      align-items: center; /* 중앙 정렬 */
      border: 1px solid #ccc;
      border-radius: 8px;
      margin: 20px 5px;
      padding: 40px 10px;
    }
    .profile>div{ text-align: center; }
    .profile img {
      width: 90%; /* 프로필 이미지 너비를 80px로 설정 */
      height: auto; /* 비율 유지 */
    }
    button{ padding: 3px 10px; }
    #compInformList{
      width: 70%;
      margin: 20px auto;
    }
    #compInformList > div{ display: flex; gap: 6px; margin-bottom: 6px; }
    .compInform{
      width: 25%;
      border: 1px solid #ccc;
      border-radius: 15px;
      padding: 7px;
      text-align: center;
    }
    .compInform a{
      display: flex; /* Flexbox 사용 */
      flex-direction: column; /* 세로 방향으로 정렬 */
      margin: 10px 0; /* 상하 간격 추가 */
    }
    .compInform img{ border-radius: 15px; margin-bottom: 5px; }
    .abutton{
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 2px;
      background-color: #f2f2f2;
    }
    .mypage{
      width:80%;
    }
  </style>
</head>
<body>
<%@include file = "/WEB-INF/include/head.jsp" %>
<main>
  <h2>My Page</h2>
  <div class="mypage">
    <div class="menu">
      <table id="menu_button">
        <tr>
          <td><a href="#" onclick="return false" id="res_search" >지원자 조회</a></td>
          <td><a href="#" onclick="return false" id="book">북마크</a></td>
        </tr>
      </table>
    </div>
    <div id ="listtable" class="pagecontent">
      <table>
        <tr><th colspan="2">지원한 이력서</th></tr>
      <c:choose>
        <c:when test="${resList eq null} ">
          <tr><td>지원한 공고가 없습니다 😢</td></tr>
        </c:when>
        <c:otherwise>
          <c:forEach items="${resList}" var="res">
            <tr>
              <td><a href="/ComMyPage/View?resnum=${res.resnum}"
                     onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">
              ${res.restitle}</a></td>
            </tr>
          </c:forEach>
        </c:otherwise>
      </c:choose>
      </table>
    </div>
  </div>

  <div class="profile"><!-- 로그인 프로필 -->
    <div><img src="/img/profile.png" alt="profile"></div>
    <div>
      <c:if test="${not empty sessionScope.userid}">${ user.username }님<br>환영합니다</c:if>
      <c:if test="${not empty sessionScope.comid}">${ comp.comname }님<br>환영합니다</c:if>
      <c:if test="${ empty sessionScope.userid && empty sessionScope.comid }">
        <button id="loginBtn">로그인</button>
      </c:if>
    </div>
    <div style="margin-top: 10px;">
      <c:if test="${ not empty sessionScope.userid }">
        <a href="/MyPage/Board" class="abutton">Mypage</a>
        <a href="/Login/Logout" class="abutton">logout</a>
      </c:if>
      <c:if test="${ not empty sessionScope.comid}">
        <a href="/ComMyPage/" class="abutton">Mypage</a>
        <a href="/Login/Logout" class="abutton">logout</a>
      </c:if>
    </div>
  </div>
</main>
<script>
  const loginBtnEl = document.querySelector('#loginBtn');
  loginBtnEl.addEventListener('click',function(){
    //alert('ok');
    window.location.href = '/Login/';
  });
</script>
</body>
</html>