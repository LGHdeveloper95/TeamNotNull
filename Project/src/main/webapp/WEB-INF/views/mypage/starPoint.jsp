<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/common.css" />
<title>기업 별점</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4; /* 부드러운 배경색 */
    padding: 20px;
  }

  .rating-container {
    background-color: white;
    padding: 20px;
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    max-width: 400px; /* 최대 너비 설정 */
    margin: 0 auto; /* 중앙 정렬 */
  }

  #stars {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    margin: 15px 0; /* 위아래 여백 */
  }

  #stars img {
    max-width: 30px; /* 별 크기 조정 */
    cursor: pointer; /* 커서 변경 */
    transition: transform 0.2s; /* 애니메이션 효과 */
  }

  #stars img:hover {
    transform: scale(1.2); /* 마우스 오버 시 크기 증가 */
  }

  #starSubmit {
    display: block;
    width: 100%; /* 버튼 가득 채우기 */
    padding: 10px;
    margin-top: 15px;
    background-color: #4CAF50; /* 버튼 색상 */
    color: white;
    border: none; /* 기본 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    font-size: 16px; /* 글자 크기 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
  }

  #starSubmit:hover {
    background-color: #45a049; /* 마우스 오버 시 배경색 변화 */
  }
</style>
</head>
<body>
  <div>기업명 : ${ vo.comname }</div>
  <div id="stars">
    <span><img alt="star" src="/img/blankStar.png" id="star1"></span>
    <span><img alt="star" src="/img/blankStar.png" id="star2"></span>
    <span><img alt="star" src="/img/blankStar.png" id="star3"></span>
    <span><img alt="star" src="/img/blankStar.png" id="star4"></span>
    <span><img alt="star" src="/img/blankStar.png" id="star5"></span>
  </div>
  <button id="starSubmit">제출</button>
  <script>
    const starsEl = document.querySelector('#stars');
    let star_val = 0;
    starsEl.addEventListener('click',function(event){
    	let clickId = event.target.id;
    	let num = clickId.split('star')[1];
    	console.log(num);
    	const max = 5;
    	for(let i = 0; i < num; i++){
    		document.querySelector('#star'+(i+1)).src = "/img/star.png";
    		star_val = i+1;
    		for(let j = 5; j > num; j--){
    		  document.querySelector('#star'+j).src = "/img/blankStar.png";
    		}
    	}
    })
    
    const starSubmit = document.querySelector('#starSubmit');
    
    starSubmit.addEventListener('click',function(){
    	if(star_val != 0){
    	  window.location = '/MyPage/InsertStar?star_val='+star_val+'&comid=${vo.comid}';
    	  window.close();
    	}
    	else{
    		alert('별점을 입력해주세요.');
    	}
    })
    
  </script>
</body>
</html>

