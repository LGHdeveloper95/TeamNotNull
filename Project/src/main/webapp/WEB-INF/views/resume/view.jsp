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
  margin: 20px auto;
  border: 1px solid #ccc;
  border-radius: 8px;
  max-width: 100%; /* 최대 너비 설정 */
  flex: 1; /* Flex-grow로 크기 조정 */
}
table{
  width: 100%;
  border-collapse: collapse;
  margin: 10px auto;
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
#box{width: 100%;}
button{ padding: 3px 10px; margin: 20px 0 0; }
.subtitle{ background-color: skyblue; }
.content{
  height: 300px;
  vertical-align: top;	
}
</style>
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  <main>
  <div id="box">
  <button id="goListBtn">목록</button>
  <button id="updateBtn">수정</button>
  <button id="deleteBtn">삭제</button>
  <table>
    <thead>
    <tr><td colspan="3">이력서 제목 : ${ resume.restitle }</td></tr></thead>
    <tr>
      <td rowspan="4">
        <img id="profile" alt="pic" style="max-width: 200px;"/>
      </td>
    </tr>
    <tr>
    <td>이름</td>
    <td>${ resume.username } </td>
    </tr>
    <tr>
      <td>성별</td>
      <td>${ user.gender }</td>
    </tr>
    <tr>
      <td>휴대전화</td>
      <td>${ user.uphone }</td>
    </tr>
    <tr>
      <td>주소</td>
      <td colspan="2">${ user.uaddr }</td>
    </tr>
    <tr>
      <td>학력</td>
      <td>${ resume.edu_name }</td>
      <td>${ resume.edu_content }</td>
    </tr>
    <tr>
      <td>경력</td>
      <td>${ resume.career_name }</td>
      <td>${ resume.career_content }</td>
    </tr>
    <tr>
      <td>자격증</td>
      <td colspan="2">
      <c:if test="${ licenseList[0] != null }">
        <c:forEach items="${ licenseList }" var="license" varStatus="list">
          ${ license }
          <c:if test="${ !list.last }">/</c:if>
        </c:forEach>
      </c:if>
      </td>
    </tr>
    <tr>
      <td>기술분야</td>
      <td colspan="2">
        <c:forEach items="${ skillList }" var="skill" varStatus="list">
          ${ skill.skill }
          <c:if test="${ !list.last }">/</c:if>
        </c:forEach>
      </td>
    </tr>
  </table>
  <!-- 자기소개서--------------------------------------------------- -->
  <table>
    <thead>
      <tr>
        <td colspan="3">자기소개서</td>
      </tr>
    </thead>
    <tr class="subtitle"><td colspan="3">성장배경</td></tr>
    <tr class="content"><td colspan="3">${ resume.background }</td></tr>
    <tr class="subtitle"><td colspan="3">성격의 장단점</td></tr>
    <tr class="content"><td colspan="3">${ resume.personality } </td></tr>
    <tr class="subtitle"><td colspan="3">지원동기</td></tr>
    <tr class="content"><td colspan="3">${ resume.motivation } </td></tr>
  </table>
  </div>
   <div class="profile"><!-- 로그인 프로필 -->
      <div><img src="/img/profile.png" alt="profile"></div>
      <div>${ resume.username }님<br>환영합니다</div>
      <div style="margin-top: 10px;">
          <a href="/MyPage/Board" class="abutton">Mypage</a>
          <a href="/Login/Logout" class="abutton">logout</a>
      </div>
    </div>
  </main>
  <script>
    const goListBtnEl = document.querySelector('#goListBtn');
    goListBtnEl.addEventListener('click', function(){
    	window.location = '/Resume/Board';
    })
  
    let resnum = '${ resume.resnum }';
    const updateBtnEl = document.querySelector('#updateBtn');
    const deleteBtnEl = document.querySelector('#deleteBtn');
    
    updateBtnEl.addEventListener('click', function(){
    	//alert('ok');
    	window.location.href="/Resume/UpdateForm?resnum="+resnum;
    })
    deleteBtnEl.addEventListener('click', function(){
    	//alert('ok');
    	const result = confirm("정말로 삭제하시겠습니까?");
    	if (result) {
    		window.location.href='/Resume/Delete?resnum='+resnum;
    		}
    })
    
    const profileEl = document.querySelector('#profile');
    const img = "${ resume.picture }";
    console.log(img);
    if(img != ""){
    	const pathList = img.split("/")
    	const imgPath = "/" + pathList[pathList.length-2] + "/" + pathList[pathList.length-1];
    	console.log(imgPath);
    	profile.src = imgPath;
    }
    
  </script>
</body>
</html>