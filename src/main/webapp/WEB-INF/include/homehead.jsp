<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .search_menu {
        display: none;
        font-weight: bold;
        position: relative;
    }

    .search_section {
        width: 100%;
        background: #fff;
        left: 0;
        top: 100%;
        z-index: 1;
        font-size: 15px;
        display: none;
        margin-top: 20px;
    }

    .search_result {
        display: none;
    }

.result{
    display: inline-block;
    width: 150px;
}
    li {
        border: 1px silver solid;
        border-radius: 10px;
        display: inline;
        padding: 10px 70px;
    }

    li:hover {
        background: #999999;
    }


    
	    /* 매칭 버튼 스타일 */
	input[type=submit] {
	    background: #575757;
	    color: white;
	    padding: 10px 25px;
	    border-radius: 10px;
	    transition: all 0.3s ease; /* 부드러운 전환 효과 */
	}
	
	/* 매칭 버튼 호버 스타일 */
	input[type=submit]:hover {
	    background: black;
	    transform: scale(1.15); /* 크기 15% 증가 */
	}
    

    .radio {
        opacity: 0;
    }

    .radio + label {
        padding: 5px 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    .radio + label:hover {
        background: #cccccc;
    }

    input[type=radio]:checked + label {
        background: #AAAAAA;
        color: white;
    }
#search_intro {
    background-color: white;
    color: black;
    border: 10px solid; /* 테두리의 두께 설정 */
    border-image: linear-gradient(to top, #575757, #000000); /* 아래에서 위로 그라데이션 */
    border-image-slice: 1; /* 테두리 그라데이션을 적용 */
    border-radius: 50px; /* 모서리를 살짝 둥글게 */
    transition: all 0.3s ease; /* 부드러운 전환 효과 */
    box-sizing: border-box; /* 테두리 두께 포함 */
}

#search_intro:hover {
    font-weight: bold;
    border-width: 2px; /* 호버 시 테두리 얇아짐 */
    transform: scale(1.25); /* 크기 살짝 증가 */
}
    /* 배경 이미지 스타일 */
  #background-image {
    width: 100%;
    height: 150px; /* 이미지 높이 설정 */
    object-fit: cover; /* 비율 유지하며 꽉 채우기 */
    margin-bottom: -5px;
    filter: grayscale(100%) brightness(1); /* 회색 필터와 밝기 조정 */
   }
   
   #search_head {
   
   }
   

</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<header>
    <div>
        <a href="/"><img alt="title" src="/img/banner.png" id="banner"></a>
    </div>

    <div id="search_head">
        <div id="search_intro"
             style="display: inline-block;padding: 20px 40px">SEARCH
        </div>
        <div>
            <ul class="search_menu">
                <li><span>단어</span></li>
                <li><span>스킬</span></li>
                <li><span>지역</span></li>
                <li><span>학력</span></li>
                <li><span>경력</span></li>
            </ul>
        </div>
        <form action="/Search" method="get">
            <div class="search_section" style="height: 100px;  text-align: center">
                <input type="text" name="word" placeholder="검색어"
                       style="margin-top:30px;width: 400px;height: 50px;border-radius: 10px"/>
            </div>
            <div class="search_section">
                <div style="height:100px;width:200px; overflow-y: scroll; display: inline-block">
                    <c:forEach items="${ skillCateList }" var="scate">
                        <div id="skill${scate.scate_code}" class="skillCate"> ${scate.scate}</div>
                    </c:forEach>
                </div>
                <div class="skill" style="height: 100px; width:250px;overflow-y: scroll;display: inline-block">
                </div>

            </div>
            <div class="search_section">
                <div style="max-height :100px;width:200px; overflow-y: scroll;display: inline-block">
                    <c:forEach items="${sidoList}" var="sido" varStatus="status">
                        <div id="sido${status.index}" value="${sido.sido_code}" class="sidoCate">${sido.sido}</div>
                    </c:forEach>
                </div>
                <div class="gugun"
                     style="max-height :100px; height:150px;width:250px; display:inline-block; overflow-y: scroll;"></div>
                <input type="hidden" name="region" id="regionSubmit"/>

            </div>
            <div class="search_section" style="height:100px;">
                <c:forEach var="edu" items="${eduList}">
                    <input type="radio" class="radio" name="edu_code" value="0" style="display: none"/>
                    <input type="radio" class="radio" name="edu_code" value="${ edu.edu_code }" id="${edu.edu_name}"/>
                    <label for="${edu.edu_name}" class="se"> ${edu.edu_name}</label>
                </c:forEach>
            </div>
            <div class="search_section" style="height:100px;">
                <c:forEach var="career" items="${careerList}">
                    <input type="radio" class="radio" name="career_code" value="0" style="display: none"/>
                    <input type="radio" class="radio" name="career_code" value="${ career.career_code }"
                           id="${career.career_name}"/>
                    <label for="${career.career_name}" class="sc"> ${career.career_name}</label>
                </c:forEach>
            </div>
            <div class="search_result">
                <div class="search_word result">
                    <div><h5>검색어</h5></div>
                    <div id="input_search"></div>
                </div>
                <div class="skill_select result">
                    <div><h5>기술</h5></div>
                    <input type="hidden" name="skill" id="skillSubmit"/>
                </div>
                <div class="result">
                    <div style="vertical-align:top;horiz-align: left"><h5>지역</h5></div>
                    <div class="region_select">
                    </div>
                </div>
                <div class=" result">
                    <div><h5>학력</h5></div>
                    <div id="search_edu">무관</div>
                </div>
                <div class=" result">
                    <div><h5>경력</h5></div>
                    <div id="search_career">무관</div>
                </div>
                <input type="submit" value="매칭" class="btn btn-success ra">
            </div>
        </form>
        <br>
    </div>

    <c:if test="${ not empty sessionScope.userid || not empty sessionScope.comid }">
        <div id="session-timer">
            남은 시간: <span id="timer">30:00</span>&nbsp;&nbsp;
            <button id="loginTenstioin" onclick="extendSession()">로그인 연장</button>
        </div>
    </c:if>
<!-- 배경 이미지 -->
  <img src="/img/city.png" id="background-image" alt="City Background">
    <div id="menus">
        <c:if test="${ not empty sessionScope.comid }"><!-- 기업아이디로 로그인 했을경우 -->
        <div><a href="/Gusik/Board">구직정보</a></div>
        <div><a href="/Post/Board">공고관리</a></div>

        </c:if>
        <c:if test="${ empty sessionScope.comid }">
            <div><a href="/Guin/Board">구인정보</a></div>
            <div><a href="/Resume/Board" id="loginCheck">이력서관리</a></div>
        </c:if>
            <div><a href="/Matching/" class="menu-link">자동매칭</a></div>
        <div><a href="/CompInfo/Grid">기업정보</a></div>
        <div><a href="/Cs/Board">고객센터</a></div>
    </div>
</header>
<script>
    const loginCheckEl = document.querySelector('#loginCheck');
    var userid = '${ sessionScope.userid }';
    var comid = '${ sessionScope.comid }';
    console.log(userid, comid);
    if (userid == '' && comid == '') {
        //alert('ok');
        loginCheckEl.addEventListener('click', function () {
            //alert('ok');
            event.preventDefault();
            alert('로그인이 필요합니다');
            window.location.href = '/Login/';
        })
    }
    // 30분 타이머 설정 (1800초 = 30분)
    var sessionTimeout = 1800;

    function startTimer() {
        var timerElement = document.getElementById('timer');
        if (!timerElement) return; // timer 요소가 없으면 종료

        var timer = setInterval(function () {
            sessionTimeout--;

            // 타이머가 0이 되면 세션 만료 처리
            if (sessionTimeout <= 0) {
                clearInterval(timer);
                alert('세션이 만료되었습니다. 다시 로그인해주세요.');
                window.location.href = '/'; // 홈 화면으로 리다이렉트
            }

            // 시간 형식 변환
            var minutes = Math.floor(sessionTimeout / 60);
            var seconds = sessionTimeout % 60;
            if (seconds < 10) {
                seconds = '0' + seconds;
            }

            // 타이머 표시
            timerElement.innerText = minutes + ':' + seconds;

        }, 1000); // 1초마다 업데이트
    }

    // 세션 시간 연장 함수
    function extendSession() {
        sessionTimeout = 1800; // 타이머를 30분으로 리셋
        alert('로그인 연장 되었습니다.');
    }

    window.onload = function () {
        if (document.getElementById('session-timer')) { // 세션 타이머가 있을 때만 시작
            startTimer(); // 페이지 로드 시 타이머 시작
        }
    };
    $("#search_intro").click(() => {
        $(".search_menu").css({
            'display': 'inline',
            'margin-top': '20px',  // 메뉴를 아래로 이동
            'padding': '0 10px'    // 메뉴 양옆 여백 추가
        });
        $("#search_intro").css({
            'display': 'none'
        });
        $(".search_result").css({
            'display': 'inline-block'
        });
        $('#search_head').css({
            'border': '10px solid',
            'background-color': 'white',
            'border-image': 'linear-gradient(to top, #575757, #000000)',
            'border-image-slice': '1',
            'transition': 'all 0.3s ease',
            'box-sizing': 'border-box',
            'display': 'inline-block',
            'padding': '10px 20px'  // 상자 내부 여백 추가
        });
        $('.search_menu > li').eq(0).click();    })

    $('.search_menu > li').click(function () {
        let menu_i = $(this).index();
        if (menu_i < 5) { //하단 바(빨간색) 이동으로 인해 index는 4 이하로 한정시킴
            $('.search_menu > li').css({
                'background': 'white'
            })
            $(this).css({
                'background': '#999999'
            })
            $('.search_section').css({ //모두 display:none 시킨 후
                'display': 'none'
            }).eq($(this).index()).css({ // 해당 인덱스 넘버만 보여질 수 있도록 한다.
                'display': 'block'
            })
        }
        $("#input_search").html($('input[name="word"]').val())
    });

    $("input[name='edu_code']").click(function (){
        $('#search_edu').html($('.se').eq(($(this).index()-1)/3).html());
    })

    $("input[name='career_code']").click(function (){
        $('#search_career').html($('.sc').eq(($(this).index()-1)/3).html());
    })
    let temp = '<c:out value="${skillList}"/>';
    let temp2 = '<c:out value="${gugunList}"/>';
    let skillList = temp.split(",");
    let gugunList = temp2.split(",");
    let skill_count = 0;
    let region_count = 0;

    $("input[name='edu_code']:input[value='0']").prop('checked', true);
    $("input[name='career_code']:input[value='0']").prop('checked', true);


    for (let i = 100; i < 810; i = i + 100) {
        let skill = "skill";
        skill += i;
        let skill_idx = "" + i;

        document.getElementById(skill).onclick = () => {
            for (let j = 0; j < 8; j++) {
                document.getElementsByClassName("skillCate").item(j).classList.remove("clicked");
            }
            document.getElementById(skill).classList.add("clicked");
            let html = "";
            for (let j = 0; j < skillList.length; j += 3) {
                let skill_code = skillList[j + 0].substring(20, 23);
                let skillname = skillList[j + 1].substring(7,);
                let scate_code = skillList[j + 2].substring(12, 15);
                if (skill_idx == scate_code) {
                    html += "<span class='skills' value='" + skill_code + "'>" + skillname + "</span><br>";
                }
            }
            document.getElementsByClassName("skill")[0].innerHTML = html;

            for (let j = 0; j < 30; j++) {
                let span = document.getElementsByClassName("skills")
                span.item(j).onclick = () => {
                    for (let k = 0; k < 30; k++) {
                        span.item(k).classList.remove("clicked");
                    }
                    span.item(j).classList.add("clicked");
                    if (skill_count < 5) {
                        let html = '<input type="hidden" class="find_skill" value=""/>';
                        html += '<div class="clicked_skill" value="' + span.item(j).getAttribute("value") + '">' + span.item(j).innerHTML + '</div>';
                        document.getElementsByClassName("skill_select").item(0).innerHTML += html;
                        $('.clicked_skill').each(function (i, item) {
                            item.addEventListener('click', () => {
                                item.remove();
                                skill_count--;
                            })
                        });
                        skill_count++;

                    } else {
                        alert('최대 5개까지 추가할 수 있습니다.');
                    }
                }
            }
        }
    }


    for (let i = 0; i < 17; i++) {
        let sido = "sido";
        sido += i;
        let sido_idx = document.getElementById(sido).getAttribute("value");

        document.getElementById(sido).onclick = () => {
            for (let j = 0; j < 17; j++) {
                document.getElementsByClassName("sidoCate").item(j).classList.remove("clicked");
            }
            document.getElementById(sido).classList.add("clicked");
            let html = "";
            for (let j = 0; j < gugunList.length; j += 3) {
                let gugun_code = gugunList[j + 0].substring(20,);
                let gugunname = gugunList[j + 1].substring(7,);
                let sido_code_temp = gugunList[j + 2].substring(11,);
                let sido_code = sido_code_temp.slice(0, -1);
                if (sido_idx == sido_code) {
                    html += "<span class='guguns' value='" + gugun_code + "'>" + gugunname + "</span><br>";
                }
            }
            document.getElementsByClassName("gugun")[0].innerHTML = html;

            $(".guguns").each(function (index, item) {
                item.addEventListener("click", function () {
                    $(".guguns").each(function (i, k) {
                        k.classList.remove("clicked");
                    })
                    item.classList.add("clicked");
                    if (region_count < 5) {
                        let html = '<div class="clicked_region" value="' + item.getAttribute("value") + '">' + document.getElementById(sido).innerHTML + " " + item.innerHTML + '</div>';
                        document.getElementsByClassName("region_select").item(0).innerHTML += html;
                        $('.clicked_region').each(function (i, item) {
                            item.addEventListener('click', () => {
                                item.remove();
                                region_count--;
                            })
                        });
                        region_count++;
                    } else {
                        alert('최대 5개까지 추가할 수 있습니다.');
                    }

                })
            })
        }
    }
    document.getElementsByTagName('form')[0].addEventListener('submit', function (event) {

        let skills = document.querySelectorAll('.clicked_skill');
        let skillList = "";
        for (let i = 0; i < skills.length; i++) {
            skillList += skills[i].getAttribute("value") + "/";
        }
        document.getElementById("skillSubmit").value = skillList;

        let regions = document.querySelectorAll(".clicked_region");
        let regionList = "";
        for (let i = 0; i < regions.length; i++) {
            regionList += regions[i].getAttribute("value") + "/";
        }
        document.getElementById("regionSubmit").value = regionList;
    })

</script>