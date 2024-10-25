<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="/css/common.css" />
<title>Insert title here</title>
<style>
#listtable {
  margin: 20px auto;
  border: 1px solid #ccc;
  border-radius: 8px;
  max-width: 100%; /* 최대 너비 설정 */
  flex: 1; /* Flex-grow로 크기 조정 */
}
table{
  width: 100%;
  border-collapse: collapse;
  margin: 10px auto;
  border: 1px solid #ccc;
  border-radius: 8px;
}
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
#box{width: 100%;}
button{ padding: 3px 10px; margin: 20px 0 0; }
.content{
  height: 100%;
  vertical-align: top;	
}
.red{ color: red; }

.fullBox {
  width: 100%;
  height: 100%; /* Expand to fill the parent height */
  resize: none; /* Prevent resizing */
  box-sizing: border-box; /* Include padding and border in height/width */
  padding: 10px; /* Add padding for better appearance */
}

</style>
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  <main>
    <form action="/Resume/Insert" enctype="multipart/form-data" id="resumeForm" method="POST" style="width: 100%;">
      <table style="width: 100%; table-layout: fixed;">
        <thead><tr><td colspan="3">
          이력서 제목 :
          <input type="text" name="restitle">
        </td></tr></thead>
        <tr>
          <td rowspan="3" style="max-width: 30px; text-align: center;">
            <img id="img" alt="pic" style="width: 80%;"/>
            <input type="file" name="imgfile" id="fileInput" accept="image/*" required>
          </td>
          <td>이름</td>
          <td>${ user.username }</td>
       </tr>
      <tr>
        <td>성별</td>
        <td>${ user.gender }</td>
      </tr>
      <tr>
        <td>휴대전화</td>
        <td>${ user.uphone }</td>
      </tr>
      <tr>
        <td>주소</td>
        <td colspan="2">${ user.uaddr }</td>
      </tr>
       <tr><td>학력</td><td colspan="2">
                <c:forEach var="edu" items="${eduList}">
                    <input type="radio" class="radio" name="edu_code" value="${ edu.edu_code }" id="${edu.edu_name}"/>
                    <label for="${edu.edu_name}"> ${edu.edu_name}</label>
                </c:forEach>
            </td></tr>
            <tr><td>경력</td><td colspan="2">
                <c:forEach var="career" items="${careerList}">
                    <input type="radio" class="radio" name="career_code" value="${ career.career_code }" id="${career.career_name}"/>
                    <label for="${career.career_name}"> ${career.career_name}</label>
                </c:forEach>
            </td></tr>
      <tr>
        <td colspan="3">
          자격증
          <input type="hidden" name="license" id="licenseSubmit">
        </td>
      </tr>
      <tr>
        <td colspan="3" id="licenseList">
          <input type="text" class="license licenseCheck"/>
          <button class="plusBtn">+</button>
        </td>
      </tr>
       <tr>
         <td colspan="3">기술분야</td>
       </tr>
       <tr style="height: 100px;">
         <td style=" height: 130px; overflow-y: scroll;">
           <c:forEach items="${ skillCateList }" var="scate">
             <div id="skill${scate.scate_code}" class="skillCate"> ${scate.scate}</div>
           </c:forEach>
         </td >
         <td class="skill" style="width: 100%; height: 200px; overflow-y: scroll; display: block;">
         
         </td>
         <td class="skill_select"  style="vertical-align: top">
           <div><h5>선택한 기술</h5></div>
         </td>
       </tr>
       <tr>
         <td colspan="3">희망 근무 지역</td>
            </tr>
            <tr>
                <td>
                    <div   style="max-height :150px;width:200px; overflow-y: scroll;">
                    <c:forEach items="${sidoList}" var="sido" varStatus="status">
                        <div id="sido${status.index}" value="${sido.sido_code}" class="sidoCate">${sido.sido}</div>
                    </c:forEach>
                    </div>
                </td>
                <td>
                    <div class="gugun"
                         style="max-height :150px; height:150px;width:250px; display:inline-block; overflow-y: scroll;"></div>
                </td>
                <td>
                    <div style="vertical-align:top;horiz-align: left"><h5>선택한 지역</h5></div>
                    <input type="hidden" name="gugun_code" id="regionSubmit"/>
                    <h4  class="region_select">
                        <div class="clicked_region" value=""> </div>
                    </h4>
                </td>
            </tr>
      </table>
    <!-- 자기소개서--------------------------------------------------- -->
    <table>
      <thead>
        <tr>
          <td colspan="3">자기소개서</td>
        </tr>
      </thead>
      <tr class="subtitle"><td colspan="3">성장배경</td></tr>
      <tr class="content"><td colspan="3">
        <textarea name="background" class="fullBox"></textarea>
      </td></tr>
      <tr class="subtitle"><td colspan="3">성격의 장단점</td></tr>
      <tr class="content"><td colspan="3">
        <textarea name="personality" class="fullBox"></textarea>
      </td></tr>
      <tr class="subtitle"><td colspan="3">지원동기</td></tr>
      <tr class="content"><td colspan="3">
        <textarea name="motivation" class="fullBox"></textarea>
      </td></tr>
    </table>
    <input type="submit" value="추가">
  </form>
   <div class="profile"><!-- 로그인 프로필 -->
      <div><img src="/img/profile.png" alt="profile"></div>
      <div>${ user.username }님<br>환영합니다</div>
      <div style="margin-top: 10px;">
          <a href="/MyPage/Board" class="abutton">Mypage</a>
          <a href="/Login/Logout" class="abutton">logout</a>
      </div>
    </div>
  </main>
  <script>
    const licenseListEl = document.querySelector('#licenseList');
    const resumeFormEl = document.querySelector('#resumeForm');
    const licenseSubmitEl = document.querySelector('#licenseSubmit');
    
    licenseListEl.addEventListener('click', function(event) {
    	let licenseCheckEl = document.querySelectorAll('.licenseCheck');
	    console.log(licenseCheckEl.length);
	    
    	  if (event.target.classList.contains('plusBtn')) {
    	    event.preventDefault(); //button submit 방지
    	    event.target.remove();
    	    
    	    let licenseEl = document.querySelectorAll('.license');
    	    if(licenseEl[licenseCheckEl.length-1].value==""){
    	    	alert('입력 후 추가해주세요');
    	    	
    	    	const newPlusButton = document.createElement('button');
    	    	newPlusButton.className = 'plusBtn';
      	        newPlusButton.type = 'button';
      	        newPlusButton.textContent = '+';
      	        licenseListEl.appendChild(newPlusButton);
    	    }
    	    
    	    else if(licenseCheckEl.length < 9){
    	      const newInput = document.createElement('input');
    	      const newPlusButton = document.createElement('button');
    	      const newminusButton = document.createElement('button');
    	      newInput.className = 'license licenseCheck';
    	      newPlusButton.className = 'plusBtn';
    	      newPlusButton.type = 'button';
    	      newPlusButton.textContent = '+';
    	      newminusButton.className = 'minusBtn';
    	      newminusButton.textContent = '-';
    	      newminusButton.type = 'button';
    	      
    	      licenseListEl.appendChild(document.createElement('br'));
    	      licenseListEl.appendChild(newInput);
    	      licenseListEl.appendChild(newminusButton);
    	      licenseListEl.appendChild(newPlusButton);
    	    }
    	    else if(licenseCheckEl.length == 9){
    	    	const newInput = document.createElement('input');
      	      const newminusButton = document.createElement('button');
      	      newInput.className = 'license';
      	      newInput.className = 'licenseCheck';
      	      newminusButton.className = 'minusBtn';
      	      newminusButton.textContent = '-';
      	      newminusButton.type = 'button';
      	      
      	      
      	      licenseListEl.appendChild(document.createElement('br'));
      	      licenseListEl.appendChild(newInput);
      	      licenseListEl.appendChild(newminusButton);
      	      
      	      const div = document.createElement('div');
      	      div.className = 'red warning';
      	      div.innerHTML = '*&nbsp;최대 10개까지 추가할 수 있습니다.';
      	      licenseListEl.appendChild(div);
  	        }
    	  }
    	  
    	  else if(event.target.classList.contains('minusBtn')){
    		  event.preventDefault();
    		  //console.log(event.target.previousElementSibling);
    		  const removeInput = event.target.previousElementSibling;//이전 형제 요소 찾음
    		  const removeBr = removeInput.previousElementSibling;
    		  
    		  licenseListEl.removeChild(removeInput);
    		  licenseListEl.removeChild(removeBr);
    		  event.target.remove();
    		  
    		  if(licenseCheckEl.length == 10){
    			  const warningEl = document.querySelector('.warning');
    			  //console.log(warningEl);
    			  warningEl.remove();

        	      const newPlusButton = document.createElement('button');
        	      newPlusButton.className = 'plusBtn';
        	      newPlusButton.type = 'button';
        	      newPlusButton.textContent = '+';
        	      
        	      licenseListEl.appendChild(newPlusButton);
      	        }
    	  }
    	});

    //사진 첨부
    let fileInputEl = document.querySelector('#fileInput');
    let imgEl = document.querySelector('#img');
    <% String userid = (String) session.getAttribute("userid"); %>
    //console.log(userid);
    fileInputEl.addEventListener('change', function(){
    	let profile = fileInputEl.files[0];
    	//console.log(profile.name);
    	
    	let reader = new FileReader();
    	reader.onload = function(e) {
            imgEl.src = e.target.result; // 선택한 이미지 미리보기
            //console.log(e.target);
        };
        reader.readAsDataURL(profile);
    });
    
    resumeFormEl.addEventListener('submit',function(event){
    	//event.preventDefault();
        let licenseEl = document.querySelectorAll('.license');
    	//alert(licenseEl[1].value);
    	let licenseList = "";
        for(let i = 0; i < licenseEl.length; i++){
        	if(licenseEl[i].value != "" && i != licenseEl.length-1){
                //alert(licenseEl[i].value);
        		licenseList += licenseEl[i].value;
        		if(licenseEl[i+1].value != ""){
        			licenseList += "/";
        		}
        	}
        	else if(i == licenseEl.length-1 && licenseEl[i].value != ""){
        		licenseList += licenseEl[i].value;
        	}
        }
        //alert(licenseList);
        licenseSubmitEl.value = licenseList;
        
        let skills = document.querySelectorAll('.clicked_skill');
        let skillList = "";
        for (let i=0;i<skills.length;i++){
            skillList+=skills[i].getAttribute("value") +"/";
        }
        document.getElementById("skillSubmit").value=skillList;

        let region = document.querySelector(".clicked_region").getAttribute("value");
        document.getElementById("regionSubmit").value=region;
        
    })
    
    
   let temp = '<c:out value="${skillList}"/>';
    let skillList =temp.split(",");
    let skill_count=0;
    console.log(skillList);
    
    let skill_code=skillList[0].substring(20,23);
    let skillname=skillList[1].substring(7,);
    let scate_code = skillList[2].substring(12,15);
    
    
    console.log(skill_code)
    console.log(skillname)
    console.log(scate_code)
    for(let i=100;i<810;i=i+100){
        let skill="skill";
        skill+=i;
        let skill_idx=""+i;

        document.getElementById(skill).onclick=()=>{
            for(let j=0;j<8;j++){
                document.getElementsByClassName("skillCate").item(j).classList.remove("clicked");
            }
            document.getElementById(skill).classList.add("clicked");
            let html ="";
           for(let j = 0;j<skillList.length;j+=3){
               let skill_code=skillList[j+0].substring(20,23);
               let skillname=skillList[j+1].substring(7,);
               let scate_code = skillList[j+2].substring(12,15);
               if(skill_idx==scate_code){
                   html+="<span value='"+skill_code+"'>"+skillname+"</span><br>";
               }
           }
            document.getElementsByClassName("skill")[0].innerHTML = html;

            for (let j = 0; j < 30; j++) {
               let span = document.getElementsByTagName("span")
                   span.item(j).onclick=()=>
                {
                    for(let k =0;k<30;k++){
                        span.item(k).classList.remove("clicked");
                    }
                    span.item(j).classList.add("clicked");
                    if(skill_count<5){
                        let html='<input type="hidden" name="skill'+skill_count+'" readonly value="'+span.item(j).getAttribute("value")+'"/>';
                        html+='<div>'+span.item(j).innerHTML+'<div>';
                        document.getElementsByClassName("skill_select").item(0).innerHTML+=html;
                        skill_count++;
                    }
                    else{
                        alert('최대 5개까지 추가할 수 있습니다.');
                    }
                }
            }
        }
    }
    
    for(let i=0;i<17;i++){
        let sido="sido";
        sido+=i;
        let sido_idx=document.getElementById(sido).getAttribute("value");

        document.getElementById(sido).onclick=()=>{
            for(let j=0;j<17;j++){
                document.getElementsByClassName("sidoCate").item(j).classList.remove("clicked");
            }
            document.getElementById(sido).classList.add("clicked");
            let html ="";
            for(let j = 0;j<gugunList.length;j+=3){
                let gugun_code=gugunList[j+0].substring(20,);
                let gugunname=gugunList[j+1].substring(7,);
                let sido_code_temp = gugunList[j+2].substring(11,);
                let sido_code = sido_code_temp.slice(0,-1);
                if(sido_idx==sido_code){
                    html+="<span class='guguns' value='"+gugun_code+"'>"+gugunname+"</span><br>";
                }
            }
            document.getElementsByClassName("gugun")[0].innerHTML = html;

            $(".guguns").each(function (index,item){
                item.addEventListener("click",function (){
                    $(".guguns").each(function (i,k){
                        k.classList.remove("clicked");
                    })
                  item.classList.add("clicked");

                    let html='<input type="hidden" class="find_region" value=""/>';
                    html+='<div class="clicked_region" value="'+item.getAttribute("value")+'">'+ document.getElementById(sido).innerHTML+" "+item.innerHTML+'</div>';
                    document.getElementsByClassName("region_select").item(0).innerHTML=html;
                })
            })
        }
    }


    const licenseListEl = document.querySelector('#licenseList');
    const resumeFormEl = document.querySelector('#resumeForm');
    const licenseSubmitEl = document.querySelector('#licenseSubmit');

    licenseListEl.addEventListener('click', function(event) {
        if (event.target.classList.contains('plusBtn')) {
            event.preventDefault();
            event.target.remove();

            const newInput = document.createElement('input');
            const newButton = document.createElement('button');
            newInput.className = 'license';
            newButton.className = 'plusBtn';
            newButton.textContent = '+';

            licenseListEl.appendChild(document.createElement('br'));
            licenseListEl.appendChild(newInput);
            licenseListEl.appendChild(newButton);
        }
    });

    document.getElementsByTagName('form').item(0).onsubmit=()=>{
        if($('input[name=rectitle]').val()==null||$('input[name=rectitle]').val()==""){
            alert("제목을 입력해주세요.");
            return false;
        }
        if($('input[name=subtitle]').val()==null||$('input[name=subtitle]').val()==""){
            alert("부제를 입력해주세요.");
            return false;
        }
        if($('input[name=gugun_code]').val()==null||$('input[name=gugun_code]').val()==""){
            alert("근무 지역을 선택해주세요.");
            return false;
        }
        if($('textarea[name=gcontent]').val()==null||$('textarea[name=gcontent]').val()==""){
            alert("내용을 입력해주세요.");
            return false;
        }
        return true;
    }

  </script>
</body>
</html>