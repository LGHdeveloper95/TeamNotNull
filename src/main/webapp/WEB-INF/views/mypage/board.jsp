<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/common.css" />
<title>GUGUIN : 마이페이지</title>
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
    background-color: black;
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
    /* border-radius: 50%; */
    margin-bottom: 10px; /* 이미지와 텍스트 간격 */
  }
  .profile div {
    margin: 10px 0;
  }
  .abutton {
    display: block;
    padding: 10px;
    margin: 10px auto;
    background-color: #ccc;
    color: black;
    text-decoration: none;
    border-radius: 5px;
    text-align: center;
    width: 150px;
    transition: background-color 0.3s ease, color 0.3s ease, transform 0.3s ease;
  }
  .abutton:hover {
      background-color: white;
      text-decoration: none;
      color: black;
      font-weight: bold;
    }
  /* 회원탈퇴버튼 */
  #leave {
    border: none;
  
  }
  
  
  
  /* 상태에 따른 색상 */
  .status-review {
    color: orange;
  }
  .status-pass {
    color: green;
    font-weight: bold;
    
  }
  .status-fail {
    color: red;
  }
  .starsImg{
    max-width: 25px;
  }
  .starsImg{
    cursor: pointer;
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

  
</script>
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  
  <div id="container">
    <!-- 왼쪽: 테이블 영역 -->
    <div class="table-container">
      <!-- 라디오 메뉴바 -->
      <div class="radio-menu">
        <!-- 라디오 버튼 클릭 시 switchTable 함수 호출 -->
        <input type="radio" name="menu" value="resume" id="resume" checked onclick="switchTable('resume')">
        <label for="resume">제출한 이력서</label>

        <input type="radio" name="menu" value="scrap" id="scrap" onclick="switchTable('scrap')">
        <label for="scrap">스크랩</label>
      </div>
<!-- 삭제 완료 메시지를 alert로 표시 -->
<c:if test="${not empty message}">
    <script>
        alert('${message}');
    </script>
</c:if>
      <!-- 제출한 이력서 목록 테이블 -->
      <div id="resumeTable" class="listtable">
        <table>
          <thead>
            <tr>
              <td>제목</td>
              <td>날짜</td>
              <td>상태</td>
              <td>별점</td>
            </tr>
          </thead>
          <tbody>
            <!-- 제출한 이력서 데이터 출력 -->
            <c:forEach items="${myList}" var="myres">
              <tr>
                <td><a href="/MyPage/View?sendnum=${myres.sendnum}">${myres.restitle}</a></td>
                <td>${myres.reg_date}</td>
                  <!-- 상태값에 따른 스타일링 -->
                  <c:choose>
                    <c:when test="${myres.pass_code == null}">
                      <td>
                      <span class="status-review">심사중</span>
                      </td>
                      <td></td>
                    </c:when>
                    <c:when test="${myres.pass_code == 1}">
                      <td>
                      <span class="status-pass">합격</span>
                      </td>
                      <td>
					    <c:set var="oneStar" value="false"/>
					     <c:forEach items="${ starList }" var="star">
					       <c:choose>
					         <c:when test="${ (myres.comid eq star.comid) and (oneStar eq false) }">
					           <img src="/img/star.png" alt="star" class="starsImg">
					           <c:set var="oneStar" value="true"/>
					         </c:when>
					       </c:choose>
					     </c:forEach>
					    <c:if test="${ oneStar eq false }">
					      <a class="stars" onclick="openStarPopup('${myres.comid}')">
					        <img src="/img/blankStar.png" alt="star" class="starsImg">
					      </a>
					    </c:if>
					  </td>
					</c:when>
					<c:when test="${myres.pass_code == 0}">
					  <td>
					  <span class="status-fail">불합격</span>
					  </td>
					  <td>
					    <c:set var="oneStar" value="false"/>
					     <c:forEach items="${ starList }" var="star">
					       <c:choose>
					         <c:when test="${ (myres.comid eq star.comid) and (oneStar eq false) }">
					           <img src="/img/star.png" alt="star" class="starsImg">
					           <c:set var="oneStar" value="true"/>
					         </c:when>
					       </c:choose>
					     </c:forEach>
					    <c:if test="${ oneStar eq false }">
					      <a class="stars" onclick="openStarPopup('${myres.comid}')">
					        <img src="/img/blankStar.png" alt="star" class="starsImg">
					      </a>
					    </c:if>
					  </td>
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

            <!-- 스크랩 목록 테이블 -->
      <div id="scrapTable" class="listtable" style="display:none;">
  <table>
    <thead>
      <tr>
        <td>회사명</td>
        <td>공고 제목</td>
        <td>스크랩 날짜</td>
        <td>삭제</td>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${scList}" var="sc">
        <tr id="scrap-${sc.bmid}">
            <td>${sc.comname}</td>
            <td><a href="/Guin/View?recnum=${sc.recnum}">${sc.rectitle}</a></td>
            <td>${sc.scrap_date}</td>
            <td>
                <a href="/MyPage/DeleteScrap?bmid=${sc.bmid}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
            </td>
        </tr>
    </c:forEach>
</tbody>
  </table>
</div>

    <!-- 오른쪽: 로그인 프로필 영역 -->
    </div>
    <div class="profile">
      <div><img src="/img/profile.png" alt="profile"></div>
      <div>사용자 이름: ${user.username}</div>
      <div>
        <a href="/MyPage/UpdateForm" class="abutton">내 정보 수정</a>
        <a href="/MyPage/UpdatePassForm" class="abutton">비밀번호 변경</a>
        <a class="abutton" href="/Login/Logout">로그아웃</a></div>
        <button id="leave">회원탈퇴</button>
    </div>
  </div>
  <%@include file="/WEB-INF/include/footer.jsp"%>
 <script>
	//자바스크립트를 사용하여 선택된 메뉴에 따라 테이블을 보여주는 함수
	 function switchTable(menu) {
	 // 모든 테이블 숨기기
	 document.getElementById('resumeTable').style.display = 'none';
	 document.getElementById('scrapTable').style.display = 'none';
	
	 // 선택한 메뉴에 맞는 테이블만 보이기
	 document.getElementById(menu + 'Table').style.display = 'table';
	}
	 switchTable('resume');
 
  function openStarPopup(comid) {
	    console.log(comid);
	    const starPopup = window.open('/MyPage/StarPoint?comid='+comid, 'starPopup', 'width=600,height=400'); // 경로 수정
	    
	    setInterval(() => {
			if(starPopup.closed){
				window.location.reload();
			}
		}, 500);
	}
  const leaveEl = document.querySelector('#leave');
  const deluserid = userid; //session에서 받아온 userid 들고옴
  console.log(deluserid);
  leaveEl.addEventListener('click', function(){
	  //alert('nooo');
	  const result = confirm('정말로 탈퇴하시겠습니까?');
	  
	  if(result){
		  window.location = '/MyPage/DeleteUser?userid='+deluserid;
	  }
  })
  </script>
</body>
</html>