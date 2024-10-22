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
  <style>
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
  </style>
</head>
<body>
<%@include file = "/WEB-INF/include/head.jsp" %>
<main>
  <div class="mypage">
    <div class="menu">
      <a href="#" id="search">지원자 조회</a>
      <a href="#" id="book">북마크</a>
    </div>
    <div class="pagecontent">
      <table>
        <tr><th>지원한 이력서</th></tr>
      <c:choose>
        <c:when test="${resList eq null} ">
          <tr><td>지원한 공고가 없습니다 😢</td></tr>
        </c:when>
        <c:otherwise>
          <c:forEach items="${resList}" var="res">
            <tr>
              <td><a href="/ComMyPage/View?${res.resnum}">${res.restitle}</a></td>
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
        <a href="/CompPage/Board" class="abutton">Mypage</a>
        <a href="/Login/Logout" class="abutton">logout</a>
      </c:if>
    </div>
  </div>
</main>
<div id="compInformList"><!-- 기업정보 -->
  <div>
    <div class="compInform">
      <a href="https://www.samsungcareers.com/"><img src="/img/samsung.png"/>Samsung 채용</a>
    </div>
    <div class="compInform">
      <a href="https://careers.lg.com/main/IndexProxy.rpi"><img src="/img/lg.png"/>LG 채용</a>
    </div>
    <div class="compInform">
      <a href="https://careers.hyundaigroup.com/"><img src="/img/samplelogo.jpeg"/>HYUNDAI 채용</a>
    </div>
    <div class="compInform">
      <a href="https://www.skcareers.com/"><img src="/img/samplelogo.jpeg"/>SK 채용</a>
    </div>
  </div>
  <div>
    <div class="compInform">
      <a href="https://career.nexon.com/user/recruit/member/postList?joinCorp=NX"><img src="/img/samplelogo.jpeg"/>NEXON 채용</a>
    </div>
    <div class="compInform">
      <a href="https://recruit.lotte.co.kr/"><img src="/img/samplelogo.jpeg"/>Lotte 채용</a>
    </div>
    <div class="compInform">
      <a href="https://recruit.navercorp.com/"><img src="/img/samplelogo.jpeg"/>NAVER 채용</a>
    </div>
    <div class="compInform">
      <a href="https://recruit.cj.net/"><img src="/img/samplelogo.jpeg"/>CJ 채용</a>
    </div>
  </div>
</div>
<script>
  const loginBtnEl = document.querySelector('#loginBtn');
  loginBtnEl.addEventListener('click',function(){
    //alert('ok');
    window.location.href = '/Login/';
  });
</script>
</body>
</html>