<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>사람과 기업을 연결하는 구구인</title>
  <link rel="icon" type="image/png" href="/img/favicon.ico" />
  <link rel="stylesheet" href="/css/common.css" />
  <style>
    /* 전체 테두리 박스 */
    .container-box {
      max-width: 1200px;
      margin: 20px auto;
      padding: 20px;
      background-color: #f9f9f9;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    /* 리스트 테이블과 프로필을 3:1 비율로 정렬하는 flexbox */
    .content-wrapper {
      display: flex;
      width: 100%;
      gap: 20px; /* 리스트 테이블과 프로필 간의 간격 */
    }

    /* 리스트 테이블 스타일 */
    #listtable {
      flex: 3; /* 넓이 비율: 그리드 3칸 */
      border: 3px solid #ccc;
      border-radius: 8px;
      background-color: #fff; /* 테이블 배경색 */
    }
	    /* 첫 번째 데이터 행 위에 선 추가 */
	tbody tr:first-child td {
	  border-top: 2px solid #ccc; /* 두께와 색상 설정 */
	}
    tr>td:nth-of-type(2) {
    /*  font-weight: bold; */
     border-left: 2px solid #ccc;
    }
	    /* 리스트 테이블의 링크 스타일 */
	#listtable a {
	  color: black; /* 검정색 고정 */
	  /* font-weight: bold;  *//* 볼드체 */
	}
	
	#listtable a:visited {
	  color: black; /* 방문 후에도 검정색 유지 */
	}
	
	#listtable a:hover {
	
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

    /* 프로필 스타일 */
    .profile-container {
      flex: 1; /* 넓이 비율: 그리드 1칸 */
      border: 3px solid #ccc;
      border-radius: 8px;
      background-color: white;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .profile {
      text-align: center;
    }

    .profile img {
      width: 100px;
      height: 100px;
      border-radius: 5%;
      margin-bottom: 10px;
    }

    .profile div {
      margin-top: 10px;
    }

    /* 기업 정보 그리드 스타일 */
    #compInformList {
      width: 100%;
      margin-top: 20px;
    }


    #compInformList > div {
      display: flex;
      gap: 6px;
      margin-bottom: 6px;
      
    }
    
 .co-op {
    text-align: center;
    margin-top: 10px;
    margin-bottom: -10px;
}

 .compInform {
    width: 25%;
    border: 1px solid #ccc;
    border-radius: 15px;
    padding: 7px;
    text-align: center;
    transition: transform 0.3s ease; /* 호버 시 크기 전환 효과 */
    position: relative;
}

.compInform:hover .overlay {
   opacity: 1; 
   /*  transform: scale(1.05);  *//* 호버 시 살짝 확대 */
}

    .compInform a {
      display: flex;
      flex-direction: column;
      margin: 10px 0;
    }

    .compInform img {
      border-radius: 15px;
      margin-bottom: 5px;
      max-width: 100%;
    }
  
  p {
  width: 100%;
  height: 100%;
   
  
  }
  </style>
</head>
<body>
<%@include file="/WEB-INF/include/homehead.jsp" %>

<div class="container-box">
  <!-- 리스트 테이블과 프로필을 포함한 콘텐츠 영역 -->
  <div class="content-wrapper">
    <div id="listtable">
      <table>
        <!-- 조건에 따른 리스트 테이블 구성 -->
        <c:if test="${not empty sessionScope.comid && not empty resList}">
          <thead><tr><td style="text-align: center;">입사지원서</td></tr></thead>
          <c:forEach items="${resList}" var="res">
            <tr>
              <td><a href="/Gusik/View?sendnum=${res.sendnum}">${res.restitle}</a></td>
            </tr>
          </c:forEach>
        </c:if>
        
        <c:if test="${not empty sessionScope.comid && empty resList}">
          <thead><tr>
            <td style="text-align: center;">입사지원서</td>
            <td style="text-align: center; width: 200px;">지원날짜</td>
          </tr></thead>
        </c:if>

        <c:if test="${empty resList && not empty recList && empty sessionScope.comid}">
          <thead><tr>
            <td style="text-align: center;">구인공고</td>
            <td style="text-align: center; width: 200px;">회사명</td>
          </tr></thead>
          <c:forEach items="${recList}" var="rec">
            <tr>
              <td><a href="/Guin/View?recnum=${rec.recnum}">${rec.rectitle}</a></td>
              <td>${rec.comname}</td>
            </tr>
          </c:forEach>
        </c:if>
        
        <c:if test="${empty sessionScope.comid && empty recList}">
          <thead><tr>
            <td style="text-align: center;">구인공고</td>
            <td style="text-align: center; width: 200px;">회사명</td>
          </tr></thead>
          <tr><td colspan="2">모집중인 공고가 없습니다 😢</td></tr>
        </c:if>
      </table>
    </div>

    <div class="profile-container">
      <%@include file="/WEB-INF/include/profile.jsp"%>
    </div>
  </div>

      <div class="co-op" ><h3>제휴회사 직접채용</h3></div>
  <div id="compInformList">
  
    <div>
      <div class="compInform"><a href="https://www.samsungcareers.com/"><img src="/img/samsung.png"/></a></div>
      <div class="compInform"><a href="https://careers.lg.com/main/IndexProxy.rpi"><img src="/img/lg.png"/></a></div>
      <div class="compInform"><a href="https://careers.hyundaigroup.com/"><img src="/img/hyundai.png"/></a></div>
      <div class="compInform"><a href="https://www.skcareers.com/"><img src="/img/sk.png"/></a></div>
    </div>
    <div>
      <div class="compInform"><a href="https://career.nexon.com/user/recruit/member/postList?joinCorp=NX"><img src="/img/nexon.png"/></a></div>
      <div class="compInform"><a href="https://recruit.lotte.co.kr/"><img src="/img/lotte.png"/></a></div>
      <div class="compInform"><a href="https://recruit.navercorp.com/"><img src="/img/naver.png"/></a></div>
      <div class="compInform"><a href="https://recruit.cj.net/"><img src="/img/cj.png"/></a></div>
    </div>
  </div>
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
<script>
  const loginBtnEl = document.querySelector('#loginBtn');
  if (loginBtnEl != null) {
    loginBtnEl.addEventListener('click', function() {
      window.location.href = '/Login/';
    });
  }
</script>
</body>
</html>

