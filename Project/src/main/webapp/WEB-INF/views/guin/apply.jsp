<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/common.css" />
<title>사람과 기업을 연결하는 구구인</title>
<style>
    #listtable {
        margin: 20px auto;
        border-radius: 8px;
        max-width: 100%; /* 최대 너비 설정 */
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
    button { padding: 3px 10px; }
</style>
</head>
<body>
<main>
   <div id="listtable">
      <!-- 이력서 선택을 위한 폼 시작 -->
      <form id="resumeForm" method="post">
        <table>
          <thead>
            <tr>
              <td>선택</td> <!-- 선택 열 -->
              <td>제목</td> <!-- 이력서 제목 열 -->
              <td>날짜</td> <!-- 이력서 등록 날짜 열 -->
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${resumeList}" var="resume"> <!-- 이력서 목록을 반복하여 표시 -->
            <tr>
              <td>
                <!-- 라디오 버튼으로 이력서 선택 -->
                <input type="radio" name="selectedResume" value="${resume.resnum}"> 
              </td>
              <td>${resume.restitle}</td> <!-- 이력서 제목 표시 -->
              <td>${resume.reg_date}</td> <!-- 이력서 등록 날짜 표시 -->
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <!-- 클릭 시 submitResume() 함수 호출 -->
        <button type="button" onclick="submitResume()">제출하기</button>
      </form>
      <!-- 이력서 선택 폼 종료 -->
    </div>
</main>

<script>
    // 이력서를 제출하는 함수
    function submitResume() {
        // 선택된 이력서를 가져옵니다.
        const selectedResume = document.querySelector('input[name="selectedResume"]:checked');
        if (selectedResume) {
            // 선택된 이력서가 있으면 AJAX 요청을 보냅니다.
            fetch("/ComMyPage/submitResume", {
                method: "POST", // POST 메소드 사용
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded" // URL 인코딩 형식으로 데이터 전송
                },
                body: "selectedResume=" + encodeURIComponent(selectedResume.value) // 선택된 이력서의 값을 전송
            })
            .then(response => response.json()) // JSON 형식으로 응답 받기
            .then(data => {
                if (data.status === "success") {
                    // 제출 성공 시 알림 및 창 닫기
                    alert("이력서가 제출되었습니다.");
                    window.close(); // 현재 창을 닫습니다.
                } else {
                    // 제출 실패 시 알림
                    alert("제출에 실패했습니다.");
                }
            })
            .catch(error => {
                console.error("Error:", error); // 에러 로그 출력
                alert("서버와의 통신 중 오류가 발생했습니다."); // 통신 오류 알림
            });
        } else {
            // 이력서를 선택하지 않은 경우 알림
            alert("이력서를 선택하세요.");
        }
    }
</script>

</body>
</html>