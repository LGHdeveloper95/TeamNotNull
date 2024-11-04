<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="profile"><!-- 로그인 프로필 -->
    <div class="pfimg"><img class="pfimg2" src="/img/profile.png" alt="profile"></div>
    <div class="profile-text">
        <c:if test="${not empty sessionScope.userid}"><div class="pfText">${ sessionScope.username }님<br>환영합니다</div></c:if>
        <c:if test="${not empty sessionScope.comid}"><div class="pfText">${ sessionScope.comname }님<br>환영합니다</div></c:if>
        <c:if test="${empty sessionScope.userid && empty sessionScope.comid}">
            <button class="PfLoginBt" id="loginBtn">로그인</button>
        </c:if>
    </div>
    <div class="profile-links">
        <c:if test="${not empty sessionScope.userid}">
            <div class="Abt1" ><a href="/MyPage/Board" class="abutton">Mypage</a></div>
            <div class="Abt2" ><a href="/Login/Logout" class="abutton">Logout</a></div>
        </c:if>
        <c:if test="${not empty sessionScope.comid}">
           <div class="Abt1" ><a href="/ComMyPage/Board" class="abutton">Mypage</a></div>
          <div class="Abt2" ><a href="/Login/Logout" class="abutton">Logout</a></div>
        </c:if>
    </div>
</div>

<style>
   /* profile 요소가 profile-container를 가득 채우도록 */
    .profile {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
        width: 100%; /* 가로 폭 전체 */
        height: 100%; /* 세로 폭 전체 */
        padding: 10px;
        box-sizing: border-box;
        border: none;
        padding-top: 20%;
        margin-bottom: 20px;
    }
    .container{ padding-bottom: 20px; 
        min-height: 300px;}
    /* 프로필 이미지 스타일 */
    .pfimg {
        /* width: 60%; */ /* 적당한 크기로 설정 */
       /*  height: auto; */ /* 원래 비율 유지 */
      /*   margin-top: 10%; */  /* 상단에서 10% 아래에 위치 */
        /* border-radius: 50%; */
       
        /* border: medium; */
       /*  background-color: white; */
    }
    .pfimg2{
       width: 50px; /* 가로 폭 전체 */
        height: 50px;
    	background-color: white;
    }

    /* 로그인 버튼 스타일 */
    .PfLoginBt {
        /* width: 80%; */ /* 버튼 가로 크기 */
        padding: 10px 40px;
        margin-bottom: 10%; /* 하단에서 10% 위에 위치 */
        background-color: #ccc; /* 연한 하늘색 */
        text-align:center;
        color: black;
       /*  font-weight: normal; */
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease, font-weight 0.3s ease,transform 0.3s ease;
    }

    /* 로그인 버튼 호버 효과 */
    .PfLoginBt:hover {
        background-color: black;
        color: white;
        font-weight: bold;
        transform: scale(1.25);
        
    }

    /* 프로필 텍스트와 링크 간격 조정 */
    .profile-text, .profile-links {
    display: flex; /* 수평으로 나란히 배치 */
        gap: 10px; /* 버튼 간격 */
        text-align: center;
        margin-top: 10px;
    }
  /* Hover 효과 추가 */
    .Abt1, .Abt2 {
        transition: transform 0.3s ease;
    }

    .Abt1:hover, .Abt2:hover {
        transform: scale(1.25);
    }
    .abutton:visited {
    color: inherit; /* 방문 후 색상 변경 방지 */
}
    .abutton{ padding: 10px; }
    .pfText {
    font-size: 25px;
    font-weight: bold; /* 볼드체 적용 */
    line-height: 1.5; /* 줄 간격 설정 */
    }
    
</style>




