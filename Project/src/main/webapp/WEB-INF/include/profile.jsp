<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!-- Font Awesome 라이브러리 로드 -->
    <div class="profile"><!-- 로그인 프로필 -->
        <div><img src="/img/profile.png" alt="profile"></div>
        <div>
            <c:if test="${not empty sessionScope.userid}">${ sessionScope.username }님<br>환영합니다</c:if>
            <c:if test="${not empty sessionScope.comid}">${ sessionScope.comname }님<br>환영합니다</c:if>
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
                <a href="/ComMyPage/Board" class="abutton">Mypage</a>
                <a href="/Login/Logout" class="abutton">logout</a>
            </c:if>
        </div>
    </div>