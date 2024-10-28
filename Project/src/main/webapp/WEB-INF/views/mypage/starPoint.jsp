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
  #stars img{ max-width: 20px; }
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
    	}
    	else{
    		alert('별점을 입력해주세요.');
    	}
    })
    
  </script>
</body>
</html>

