<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="/css/common.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
            margin: 20px auto;
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
        main>div{width: 100%;}
        button{ padding: 3px 10px; }
        .subtitle{ background-color: skyblue; }
        .content{
            height: 500px;
            vertical-align: top;
        }
        .btn{
            margin-left:20px;
        }
        .radio{
            opacity: 0;
        }
        .radio + label{
            padding: 5px 10px; border: 1px solid #ccc; border-radius: 3px;
        }
        .radio + label:hover{
            background: #cccccc;
        }
        input[type=radio]:checked + label{
            background: #AAAAAA;
            color:white;
        }
        input[name=rectitle],
        input[name=subtitle]{
            width: 400px;
        }
        .clicked{
            background: #AAAAAA;
            color:white;
        }
        span{
            padding:5px 5px;
        }
        span:hover{
            background: pink;
        }
        .clicked_skill:hover{
            background: #cccccc;
            opacity: 0.75;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/include/head.jsp"%>
<main>
    <div>
        <form action="/Post/Update" id="resumeForm" method="POST">
            <input type="hidden" name="recnum" value="${post.recnum}"/>
        <table>
            <thead>
            <tr>
                <td colspan="2">공고 제목  <input type="text" name="rectitle" value="${ post.rectitle }"/> </td>
                <td>
                    <a class = "btn btn-primary" href="/Post/Board">목록</a>
                    <c:if test="${sessionScope.comid eq post.comid}">
                        <input type="submit" class="btn btn-success" value="수정">
                    </c:if>
                </td>
            </tr>
            </thead>
            <tr>
                <td colspan="3"> 부제 <input type="text" name="subtitle" value="${post.subtitle}"/></td>
            </tr>
            <tr>
                <td colspan="2"> 작성일 ${post.reg_date}</td>
                <td> 마감일 <input type="date" name="deadline" value="${post.deadline}"></td>
            </tr>
            <tr>
                <td rowspan="4" style="max-width: 130px; text-align: center;"><img src="/img/samsung.png" alt="pic" style="width: 80%;"/></td>
                <td>기업 이름</td>
                <td>${ com.comname } </td>
            </tr>
            <tr>
                <td>대표자</td>
                <td>${com.boss}</td>
            </tr>
            <tr>
                <td>회사 연락처</td>
                <td>${ com.cphone }</td>
            </tr>
            <tr>
                <td>주소</td>
                <td colspan="2">${ com.caddr }</td>
            </tr>
            <tr><td>우대 학력</td><td colspan="2">
                <c:forEach var="edu" items="${eduList}">
                    <input type="radio" class="radio" name="edu_code" value="${ edu.edu_code }" id="${edu.edu_name}" checked/>
                    <label for="${edu.edu_name}"> ${edu.edu_name}</label>
                </c:forEach>
            </td></tr>
            <tr><td>우대 경력</td><td colspan="2">
                <c:forEach var="career" items="${careerList}">
                    <input type="radio" class="radio" name="career_code" value="${ career.career_code }" id="${career.career_name}" checked/>
                    <label for="${career.career_name}"> ${career.career_name}</label>
                </c:forEach>
            </td></tr>
            <tr>
                <td colspan="3">
                    우대 자격증
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
                <td colspan="3">요구 기술분야</td>
            </tr>
            <tr>
                <td>
                    <div style="height:150px;width:200px; overflow-y: scroll;">
                    <c:forEach items="${ skillCateList }" var="scate">
                        <div id="skill${scate.scate_code}" class="skillCate"> ${scate.scate}</div>
                    </c:forEach>
                    </div>
                </td>
                <td>
                    <div  class="skill" style="height: 150px; width:250px;overflow-y: scroll;display: block">
                    </div>
                </td>
                <td class="skill_select"  style="vertical-align:top;horiz-align: left">
                    <div><h5>선택한 기술</h5></div>
                    <input type="hidden" name="skill" id="skillSubmit"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">근무 지역</td>
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
        <!-- 회사소개--------------------------------------------------- -->
        <table>
            <thead>
            <tr>
                <td colspan="3">회사 소개</td>
            </tr>
            </thead>
            <tr class="content"><td colspan="3">
                <textarea name="gcontent" cols="112" rows="20">${ post.gcontent }</textarea>
            </td></tr>
        </table>
        </form>
    </div>
    <div class="profile">
        <div><img src="/img/profile.png" alt="profile"></div>
        <div>
            <c:if test="${not empty sessionScope.userid}">${ sessionScope.userid }님 환영합니다</c:if>
            <c:if test="${not empty sessionScope.comid}">${ sessionScope.comid }님 환영합니다</c:if>
            <c:if test="${ empty sessionScope.userid && empty sessionScope.comid }">로그인이 필요합니다
                <div><a href="/Login/">로그인</a></div>
            </c:if>
        </div>
        <div>
            <c:if test="${ not empty sessionScope.userid }">
                <a href="/MyPage/Board" class="abutton">Mypage</a>
                <a href="/Login/Logout" class="abutton">logout</a>
            </c:if>
            <c:if test="${ not empty sessionScope.comid}">
                <a href="/ComMyPage/" class="abutton">Mypage</a>
                <a href="/Login/Logout" class="abutton">logout</a>
            </c:if>
        </div>
    </div>
</main>
<script>
    let temp = '<c:out value="${skillList}"/>';
    let temp2 = '<c:out value="${gugunList}"/>';
    let skillList =temp.split(",");
    let gugunList =temp2.split(",");
    let skill_count=0;

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
                   html+="<span class='skills' value='"+skill_code+"'>"+skillname+"</span><br>";
               }
           }
            document.getElementsByClassName("skill")[0].innerHTML = html;

            for (let j = 0; j < 30; j++) {
               let span = document.getElementsByClassName("skills")
                   span.item(j).onclick=()=>
                {
                    for(let k =0;k<30;k++){
                        span.item(k).classList.remove("clicked");
                    }
                    span.item(j).classList.add("clicked");
                    if(skill_count<5){
                        let html='<input type="hidden" class="find_skill" value=""/>';
                        html+='<div class="clicked_skill" value="'+span.item(j).getAttribute("value")+'">'+span.item(j).innerHTML+'</div>';
                        document.getElementsByClassName("skill_select").item(0).innerHTML+=html;
                        $('.clicked_skill').each(function (i,item){
                            console.log(item);
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
        let skills = document.querySelectorAll('.clicked_skill');
        let skillList = "";
        for (let i=0;i<skills.length;i++){
            skillList+=skills[i].getAttribute("value") +"/";
        }
        document.getElementById("skillSubmit").value=skillList;

        let region = document.querySelector(".clicked_region").getAttribute("value");
        document.getElementById("regionSubmit").value=region;
    })

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


