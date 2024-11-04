<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/common.css" />
<title>GUGUIN : 이력서목록</title>
<style>
  /* 리스트 테이블 설정 */
  #listtable {
    margin: 0 auto;
    border-radius: 8px;
    width: 100%;
    flex: 1;
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
  
  /* 메인 및 레이아웃 설정 */
  main {
    width: 80%; /* 가로 확장 */
    display: flex;
    align-items: flex-start;
    margin: 20px auto;
  }
  
  /* 버튼 스타일 및 여백 조정 */
  button {
    padding: 3px 10px;
    margin: 10px 0 5px; /* 상단 여백을 좁게 조정 */
  }
  
  /* 큰 박스 및 컨테이너 설정 */
  .bigbox {
    margin-right:-65%;
    display: flex;
    justify-content: center;
    gap: 10px;
  }
  
  #box {
  
   
    width: 600px; /* 가로 크기 확장 */
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 15px 10px 10px; /* 위쪽 여백을 좁게 조정 */
  }
  
  .container {
    width: 250px;
    height: 40%;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }
</style>
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  <main>
    <div class="bigbigbox">
      <div class="bigbox">
        <div id="box">
          <button id="insertBtn">추가</button>
          <div id="listtable">
            <table>
              <thead>
                <tr>
                  <td>제목</td>
                  <td>날짜</td>
                </tr>
              </thead>
              <c:forEach items="${ resumeList }" var="resume">
                <tr>
                  <td><a href="/Resume/View?resnum=${ resume.resnum }">${ resume.restitle }</a></td>
                  <td>${ resume.reg_date }</td>
                </tr>
              </c:forEach>
            </table>
          </div>
        </div>
        <div class="container">
          <%@include file="/WEB-INF/include/profile.jsp"%>
        </div>
      </div>
    </div>
  </main>
  <script>
    const insertBtnEl = document.querySelector('#insertBtn');
    insertBtnEl.addEventListener('click', function() {
      window.location.href = "/Resume/InsertForm";
    });
  </script>
</body>
<%@include file="/WEB-INF/include/footer.jsp"%>
</html>