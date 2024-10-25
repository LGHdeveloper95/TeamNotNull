<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="/css/common.css" />
<title>Insert title here</title>
<style>
#listtable {
  margin: 0 auto;
  border-radius: 8px;
  width: 100%;
  flex: 1; /* Flex-grow로 크기 조정 */
  border: 1px solid #ccc;
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
button{ padding: 3px 10px; margin: 20px 0 5px; }
#box{ width: 100%; }
</style>
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  <main>
  <div id="box">
  <button id="insertBtn">추가</button>
  <div id="listtable">
    <table>
      <thead><tr>
        <td>제목</td>
        <td>날짜</td>
      </tr></thead>
      <c:forEach items="${ resumeList }" var="resume">
        <tr>
          <td><a href="/Resume/View?resnum=${ resume.resnum }">${ resume.restitle }</a></td>
          <td>${ resume.reg_date }</td>
        </tr>
      </c:forEach>
    </table>
  </div>
  </div>
  <div class="profile"><!-- 로그인 프로필 -->
      <div><img src="/img/profile.png" alt="profile"></div>
      <div>${ user.username }님<br>환영합니다</div>
      <div style="margin-top: 10px;">
          <a href="/MyPage/Board" class="abutton">Mypage</a>
          <a href="/Login/Logout" class="abutton">logout</a>
      </div>
    </div>
  </main>
  <script>
    const insertBtnEl = document.querySelector('#insertBtn');
    insertBtnEl.addEventListener('click',function(){
    	//alert('ok');
    	window.location.href="/Resume/InsertForm";
    });
  </script>
</body>
</html>

</body>
</html> 
