<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!-- Font Awesome 라이브러리 로드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
    /* 푸터가 페이지 하단에 고정되도록 */
    * {
        margin: 0;
        padding: 0;
    }

    html, body {
        height: 100%; /* 화면 전체 높이를 사용 */
        display: flex;
        flex-direction: column;
    }

    main {
        flex: 1;
        padding: 20px;
    }

    /* 푸터 스타일 */
    footer {
        background-color: rgb(217, 216, 232);
        color: #333;
        padding: 1.5rem 0;
        font-size: 0.9rem;
        border-top: 2px solid black;
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 1rem;
    }

    .footer-info div {
        display: flex;
        align-items: center;
        margin: 0.5rem 0;
    }

    .footer-info i {
        color: rgb(208, 110, 10);
        margin-right: 0.5rem;
    }

    .social-icons {
        display: flex;
        gap: 1rem;
    }

    .social-icons a {
        color: rgb(208, 110, 10);
        font-size: 1.2rem;
        transition: color 0.3s;
    }

    .social-icons a:hover {
        color: #6495ED;
    }
</style>

<footer>
    <div class="footer-container">
        <div class="footer-info">
            <div><i class="fas fa-map-marker-alt"></i> 부산시 북구 화명동 어쩌고빌딩 103호</div>
            <div><i class="fas fa-user-tie"></i> 대표자: 이규황</div>
            <div><i class="fas fa-envelope"></i> 이메일: LGHdeveloper95@gmail.com</div>
        </div>
        <div class="footer-logo">
          <img src="/img/favicon.ico" alt="구구인 로고" style="width: 20px; margin-right: 8px; vertical-align: middle;">
            사람과 기업을 연결하는 구구인
        </div>
        <div class="social-icons">
            <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</footer>