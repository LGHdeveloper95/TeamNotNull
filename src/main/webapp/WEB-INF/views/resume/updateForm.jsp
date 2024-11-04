<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="/css/common.css" />
<title>GUGUIN : 이력서수정</title>
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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  <main>
    <form action="/Resume/Update" enctype="multipart/form-data" id="resumeForm" method="POST" style="width: 100%;">
      <table style="width: 100%; table-layout: fixed;">
        <thead><tr><td colspan="3">
          이력서 제목 :
          <input type="hidden" name="resnum" value="${ resume.resnum }">
          <input type="text" name="restitle" value="${ resume.restitle }">
        </td></tr></thead>
        <tr>
          <td rowspan="3" style="max-width: 30px; text-align: center;">
            <img id="img" alt="pic" style="width: 80%;"/>
            <input type="file" name="imgfile" id="fileInput" accept="image/*">
          </td>
          <td>이름</td>
          <td>${ user.username }<input type="hidden" name="username" value="${ user.username }"></td>
       </tr>
      <tr>
        <td>성별</td>
        <td>${ user.gender }<input type="hidden" name="gender" value="${ user.gender }"></td>
      </tr>
      <tr>
        <td>휴대전화</td>
        <td>${ user.uphone }<input type="hidden" name="uphone" value="${ user.uphone }"></td>
      </tr>
      <tr>
        <td>주소</td>
        <td colspan="2">${ user.uaddr }
        <input type="hidden" name="uaddr" value="${ user.uaddr }"></td>
      </tr>
       <tr>
         <td>학력</td>
         <td colspan="2">
           <c:forEach var="edu" items="${eduList}">
             <input type="radio" class="radio" name="edu_code" value="${ edu.edu_code }" id="${edu.edu_name}"/>
             <label for="${edu.edu_name}"> ${edu.edu_name}</label>
           </c:forEach>
         </td>
       </tr>
       <tr>
              <td>학력세부사항</td>
              <td colspan="2"><input type="text" name="edu_content" value="${ resume.edu_content }"/></td>
            </tr>
            <tr><td>경력</td><td colspan="2">
                <c:forEach var="career" items="${careerList}">
                    <input type="radio" class="radio" name="career_code" value="${ career.career_code }" id="${career.career_name}"/>
                    <label for="${career.career_name}"> ${career.career_name}</label>
                </c:forEach>
            </td></tr>
            <tr>
              <td>경력세부사항</td>
              <td colspan="2"><input type="text" name="career_content" value="${ resume.career_content }"/></td>
            </tr>
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
           <input type="hidden" name="skill" id="skillSubmit"/>
         </td>
       </tr>
       <tr>
                <td colspan="3">희망근무 지역</td>
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
                        <div class="clicked_region"> </div>
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
        <textarea name="background" class="fullBox">${ resume.background }</textarea>
      </td></tr>
      <tr class="subtitle"><td colspan="3">성격의 장단점</td></tr>
      <tr class="content"><td colspan="3">
        <textarea name="personality" class="fullBox">${ resume.personality }</textarea>
      </td></tr>
      <tr class="subtitle"><td colspan="3">지원동기</td></tr>
      <tr class="content"><td colspan="3">
        <textarea name="motivation" class="fullBox">${ resume.motivation }</textarea>
      </td></tr>
    </table>
    <input type="submit" value="수정">
  </form>
      <%@include file="/WEB-INF/include/profile.jsp"%>
  </main>
  <script>
    
  
    const getEdu_code = '${resume}'.split('edu_code=')[1].split(',')[0];
    const edu_codeEl = document.querySelector('input[name="edu_code"][value="'+getEdu_code+'"]');
    edu_codeEl.checked = true;

    const getCareer_code = '${resume}'.split('career_code=')[1].split(',')[0];
    const career_codeEl = document.querySelector('input[name="career_code"][value="'+getCareer_code+'"]');
    career_codeEl.checked = true;

   //자격증 추가 삭제---------------------------------------------------------
    const licenseListEl = document.querySelector('#licenseList');
    const resumeFormEl = document.querySelector('#resumeForm');
    const licenseSubmitEl = document.querySelector('#licenseSubmit');
    
    
    licenseListEl.addEventListener('click', function(event) {
    	let licenseCheckEl = document.querySelectorAll('.licenseCheck');
	    console.log(licenseCheckEl.length);
	    //alert(event.target.previousElementSibling.value);
	    
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

    const getLicenseList = '${resume.license}'.split('/');
    if(getLicenseList){
    	for(let i = 0; i<getLicenseList.length; i++){
    		let licenseEl = document.getElementsByClassName('license')[i];
    		licenseEl.value = getLicenseList[i];
    		if(getLicenseList[i+1]){
    			let plusBtnEl = document.querySelector('.plusBtn');
    			plusBtnEl.click();
    		}
    	}
    }
    //사진 첨부-----------------------------------------------------------
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
        };
        console.log(profile);
        reader.readAsDataURL(profile);
    });
    
    let getImg = '${resume.picture}'.split('static')[1];
    if(getImg != null){
        imgEl.src = getImg;
    }
    
    //submit시----------------------------------------------------------------
    resumeFormEl.addEventListener('submit',function(event){
    	//event.preventDefault();
    	//자격증처리-------------------------------------------------
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
        
        //스킬처리------------------------------------------------
        let skills = document.querySelectorAll('.clicked_skill');
        let skillList = "";
        for (let i=0;i<skills.length;i++){
            skillList+=skills[i].getAttribute("value") +"/";
        }
        document.getElementById("skillSubmit").value=skillList;

        //지역처리------------------------------------------------
        let region = document.querySelector(".clicked_region").getAttribute("value");
        document.getElementById("regionSubmit").value=region;
        
    })
    
    //스킬처리-----------------------------------------------
    let temp = '<c:out value="${skillList}"/>';
    let temp2 = '<c:out value="${gugunList}"/>';
    let skillList =temp.split(",");
    let gugunList =temp2.split(",");
    let skill_count=0;
    
    let getSkillCodeList = '${ getSkillList }'.replace("[","").replace("]","").split('skill_code=');
    let getSkillList = '${ getSkillList }'.replace("[","").replace("]","").split('skill=');
    let getSkillCode = [];
    let getSkill = [];
    for(let i = 1; i < getSkillCodeList.length; i++){
    	getSkillCode[i-1] = getSkillCodeList[i].split(',')[0];
    	getSkill[i-1] = getSkillList[i].split(',')[0];
    	let span = document.getElementsByTagName("span")
        let html='<div class="clicked_skill" value="'+getSkillCode[i-1]+'">'+getSkill[i-1]+'</div>';
        document.getElementsByClassName("skill_select").item(0).innerHTML+=html;
    	skill_count++;
    }
    $('.clicked_skill').each(function (i,item){
        item.addEventListener('click',()=>{
            item.remove();
            skill_count--;
        })
    });
    console.log(getSkillCode);
    console.log(getSkill);
    
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
                        html+='<div class="clicked_skill" value="'+span.item(j).getAttribute("value")+'">'+span.item(j).innerHTML+'</div>';
                        document.getElementsByClassName("skill_select").item(0).innerHTML+=html;
                        $('.clicked_skill').each(function (i,item){
                            item.addEventListener('click',()=>{
                                item.remove();
                                skill_count--;
                            })
                        });
                        skill_count++;
                    }
                    else{
                        alert('최대 5개까지 추가할 수 있습니다.');
                    }
                }
            }
        }
    }
    //---------------------------
    let temp3 = '<c:out value="${sidoList}"/>';
    let sidoList =temp3.split(",");
    let getSidoCode = "";
    let getSido = "";
    let getGugunCode = '${ resume }'.split('gugun_code=')[1].split(',')[0];
    let getGugun = "";
    for(let i = 0; i<gugunList.length; i+=3){
    	if(getGugunCode == gugunList[i].split('gugun_code=')[1]){
    		getGugun = gugunList[i+1].split('gugun=')[1];
    		getSidoCode = gugunList[i+2].replace(' sido_code=','').replace(')','');
    	}
    }
    for(let i=0; i<sidoList.length;i+=2){
    	if(sidoList[i].split('sido_code=')[1] == getSidoCode){
    		console.log(sidoList[i+1].split('sido=')[1].replace(')',''));
    		getSido = sidoList[i+1].split('sido=')[1].replace(')','');
    	}
    	//console.log(getSido + getGugun);
    }
    
    let html='<input type="hidden" class="find_region" value=""/>';
    html+='<div class="clicked_region" value="'+getGugunCode+'">'+getSido+" "+getGugun+'</div>';
    document.getElementsByClassName("region_select").item(0).innerHTML=html;
    
    
    for(let i=0;i<17;i++){
        let sido="sido";
        sido+=i;
        let sido_idx=document.getElementById(sido).getAttribute("value");
        //console.log(sido_idx);

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

    document.getElementsByTagName('form').item(0).onsubmit=()=>{
        if($('input[name=restitle]').val()==null||$('input[name=restitle]').val()==""){
            alert("제목을 입력해주세요.");
            return false;
        }
        if($('input[name=gugun_code]').val()==null||$('input[name=gugun_code]').val()==""){
            alert("근무 지역을 선택해주세요.");
            return false;
        }
        return true;
    }

  </script>
</body>
<%@include file="/WEB-INF/include/footer.jsp"%>
</html>