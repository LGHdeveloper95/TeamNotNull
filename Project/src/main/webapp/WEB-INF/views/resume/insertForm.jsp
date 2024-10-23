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
.subtitle{ background-color: skyblue; }
.content{
  height: 300px;
  vertical-align: top;	
}
</style>
</head>
<body>
  <%@include file="/WEB-INF/include/head.jsp"%>
  <main>
    <form action="/Resume/Insert" id="resumeForm" style="width: 100%;">
      <table style="width: 100%; table-layout: fixed;">
        <thead><tr><td colspan="3">
          이력서 제목 :
          <input type="text" name="restitle">
        </td></tr></thead>
        <tr>
          <td rowspan="3" style="max-width: 30px; text-align: center;">
            <img src="/img/sinchanprofile.jpg" alt="pic" style="width: 80%;"/>
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
          <input type="text" class="license"/>
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
        <input type="text" name="background"/>
      </td></tr>
      <tr class="subtitle"><td colspan="3">성격의 장단점</td></tr>
      <tr class="content"><td colspan="3">
        <input type="text" name="personality"/>
      </td></tr>
      <tr class="subtitle"><td colspan="3">지원동기</td></tr>
      <tr class="content"><td colspan="3">
        <input type="text" name="motivation"/>
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

    resumeFormEl.addEventListener('submit',function(event){
    	//event.preventDefault();
        let licenses = document.querySelectorAll('.license');
    	//alert(licenses[0].value);
    	let licenseList = "";
        for(let i = 0; i < licenses.length; i++){
    		//alert(licenses[i].value);
    		licenseList += licenses[i].value + "/";
        }
        licenseSubmitEl.value = licenseList;
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
                   html+="<span value='"+skill_code+"'>"+skillname+"</span> / ";
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


  </script>
</body>
</html>