<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/common.css" />
<title>GUGUIN : 이력서상세보기</title>
<style>
  .bigbox {
    width: 100%;
    display: flex;
    justify-content: center;
  }
  
  .inbox {
    width: 80%;
    display: flex;
    gap: 20px; /* 간격 추가 */
    align-items: flex-start; /* 상단 정렬 */
  }

  /* listtable */
  #listtable {
    margin: 20px auto;
    border: 1px solid #ccc;
    border-radius: 8px;
    width: 100%;
    max-width: 100%;
  }

  /* 프로필 컨테이너 */
  .container {
    margin-top: 2%;
    width: 20%; /* 고정 너비 설정 */
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    flex-shrink: 0; /* flex에서 줄어들지 않도록 설정 */
  }

  /* 테이블 스타일 */
  table {
    width: 100%; /* 테이블을 100% 너비로 설정 */
    border-collapse: collapse;
    border: 1px solid #ccc;
    border-radius: 8px;
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

  button {
    padding: 3px 10px;
  }

  .subtitle {
    background-color: skyblue;
  }

  .content {
    height: 300px;
    vertical-align: top;
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
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  <main>
    <div class="bigbox"> 
      <div class="inbox">
        <div id="listtable">
          <table>
            <thead>
              <tr><td colspan="3">이력서 제목 : ${mypage.restitle}</td></tr>
            </thead>
            <tr>
              <td rowspan="4" style="max-width: 130px; text-align: center;"><img src="/img/sinchanprofile.jpg" alt="pic" style="width: 80%;"/></td>
              <td>이름</td>
              <td>${user.username}</td>
            </tr>
            <tr>
              <td>성별</td>
              <td>${user.gender}</td>
            </tr>
            <tr>
              <td>휴대전화</td>
              <td>${user.uphone}</td>
            </tr>
            <tr>
              <td>주소</td>
              <td colspan="2">${user.uaddr}</td>
            </tr>
            <tr>
              <td>학력</td>
              <td>${mypage.edu_name}</td>
              <td>${mypage.edu_content}</td>
            </tr>
            <tr>
              <td>경력</td>
              <td>${mypage.career_name}</td>
              <td>${mypage.career_content}</td>
            </tr>
            <tr>
              <td>자격증</td>
              <c:if test="${licenseList[0] != null}">
                <td colspan="2">
                  <c:forEach items="${licenseList}" var="license" varStatus="status">
                    ${license}<c:if test="${!status.last}"> / </c:if>
                  </c:forEach>
                </td>
              </c:if>
            </tr>
            <tr>
              <td>기술분야</td>
              <td colspan="2">
                <c:forEach items="${skillList}" var="skill" varStatus="status">
                  ${skill.skill}<c:if test="${!status.last}"> / </c:if>
                </c:forEach>
              </td>
            </tr>
            <tr>
              <td>합격여부</td>
              <td>
                <!-- 상태값에 따른 스타일링 -->
                <c:choose>
                  <c:when test="${myres.pass_code == null}">
                    <span class="status-review">심사중</span>
                  </c:when>
                  <c:when test="${myres.pass_code == 1}">
                    <span class="status-pass">합격</span>
                  </c:when>
                  <c:when test="${myres.pass_code == 0}">
                    <span class="status-fail">불합격</span>
                  </c:when>
                  <c:otherwise>
                    <span>상태없음</span>
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </table>

          <!-- 자기소개서 -->
          <table>
            <thead>
              <tr><td colspan="3">자기소개서</td></tr>
            </thead>
            <tr class="subtitle"><td colspan="3">성장배경</td></tr>
            <tr class="content"><td colspan="3">${mypage.background}</td></tr>
            <tr class="subtitle"><td colspan="3">성격의 장단점</td></tr>
            <tr class="content"><td colspan="3">${mypage.personality}</td></tr>
            <tr class="subtitle"><td colspan="3">지원동기</td></tr>
            <tr class="content"><td colspan="3">${mypage.motivation}</td></tr>
          </table>
        </div>
        
        <!-- 프로필 컨테이너 -->
        <div class="container">
          <%@include file="/WEB-INF/include/profile.jsp"%>
        </div>
      </div>
    </div>
  </main>
</body>
</html>