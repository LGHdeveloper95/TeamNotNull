<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<html>
<head>
<meta charset="UTF-8">
<title>GUGUIN : 이력서제출</title>
<link rel="stylesheet" href="/css/common.css" />

</head>
<body>
<script>
</script>

<main>
   
   <div id="listtable">
      <form action="/Guin/Applied" id="resumeForm" method="post">
      		<input type="hidden" name="comid" value="${guinVo.comid}"/>
       		<input type="hidden" name="recnum" value="${guinVo.recnum}"/>
        <table>
          <thead>
            <tr>
              <td>선택</td>
              <td>제목</td>
              <td>날짜</td>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${resumeList}" var="resume">
            <tr>
              <td>
                <input type="radio" name="resnum" value="${resume.resnum}"> 
              </td>
              <td>${resume.restitle}</td>
              <td>${resume.reg_date}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <input type="submit"  value="제출하기">
      </form>
    </div>
</main>
<c:if test="${result == 'No' }">
<script >
alert('이미 제출한 이력서입니다.');
self.close();
</script>
</c:if>
<c:if test="${result == 'Yes' }">
<script >
alert('이력서를 제출했습니다.');
self.close();
</script>
</c:if>
</body>
</html>
