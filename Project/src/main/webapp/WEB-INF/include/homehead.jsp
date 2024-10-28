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
    .r1{
        position: fixed;
        top:200px;
        left: 1050px;
    }
.r2{
        position: fixed;
        top:200px;
        left: 1200px;
    }
.r3{
        position: fixed;
        top:200px;
        left: 1360px;
    text-align: center;
    }

    li {
        border: 1px silver solid;
        border-radius: 10px;
        display: inline;
        padding: 10px 70px;
    }
    li:hover{
        background: #999999;
    }

    input[type=submit] {
        background: #4CAF50;
        color: black;
        padding: 10px 25px;
        border-radius: 10px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<header>
    <div>
        <a href="/"><img alt="title" src="/img/banner.png" id="banner"></a>
    </div>

    <div id="search_head">
        <div id="search_intro" style="border:1px silver solid;border-radius: 10px; display: inline-block;padding: 20px 40px">검색 하기!</div>
        <div>
            <ul class="search_menu">
                <li><span>단어</span></li>
                <li><span>스킬</span></li>
                <li><span>지역</span></li>
            </ul>
        </div>
        <form action="/Search" method="get">
            <div class="search_section" style="height: 100px;  text-align: center">
                <input type="text" name="word" placeholder="검색어" style="margin-top:30px;width: 400px;height: 50px;border-radius: 10px"/>
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
                <input type="hidden" name="gugun_code" id="regionSubmit"/>

            </div>
            <div class="search_result">
                <div class="search_word r1">
                    <div><h5>검색어</h5></div>
                    <div id="input_search"></div>
                </div>
            <div class="skill_select r2">
                    <div><h5>선택한 기술</h5></div>
                    <input type="hidden" name="skill" id="skillSubmit"/>
                </div>
                <div class="r3">
            <div style="vertical-align:top;horiz-align: left"><h5>선택한 지역</h5></div>
                <div class="region_select">
                    <input type="hidden" class="find_region" value=""/>
                    <div class="clicked_region" value=""></div>
                </div>
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

    <div id="menus">
        <c:if test="${ not empty sessionScope.comid }"><!-- 기업아이디로 로그인 했을경우 -->
        <div><a href="/Gusik/Board">구직정보</a></div>
        <div><a href="/Post/Board">공고관리</a></div>

        </c:if>
        <c:if test="${ empty sessionScope.comid }">
            <div><a href="/Guin/Board">구인정보</a></div>
            <div><a href="/Resume/Board" id="loginCheck">이력서관리</a></div>
        </c:if>
        <div><a href="/Comp/Board">기업정보</a></div>
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
            display: 'inline'
        })
        $("#search_intro").css({
            display: 'none'
        })
        $(".search_result").css({
            display:'block'
        })
        $('.search_menu > li').eq(0).click();
    })

    $('.search_menu > li').click(function () {
        let menu_i = $(this).index();
        if (menu_i < 3) { //하단 바(빨간색) 이동으로 인해 index는 4 이하로 한정시킴
            $('.search_menu > li').css({
                background:'white'
            })
            $(this).css({
                background: '#999999'
            })
            $('.search_section').css({ //모두 display:none 시킨 후
                display: 'none'
            }).eq($(this).index()).css({ // 해당 인덱스 넘버만 보여질 수 있도록 한다.
                display: 'block'
            })
        }
        $("#input_search").html($('input[name="word"]').val())
    });

    let temp = '<c:out value="${skillList}"/>';
    let temp2 = '<c:out value="${gugunList}"/>';
    let skillList = temp.split(",");
    let gugunList = temp2.split(",");
    let skill_count = 0;
    let region_count = 0;

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
                    if(region_count<5){
                        let html = '<div class="clicked_region" value="' + item.getAttribute("value") + '">' + document.getElementById(sido).innerHTML + " " + item.innerHTML + '</div>';
                        document.getElementsByClassName("region_select").item(0).innerHTML += html;
                        $('.clicked_region').each(function (i, item) {
                            item.addEventListener('click', () => {
                                item.remove();
                                region_count--;
                            })
                        });
                        region_count++;
                    }
                    else{
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
        let regionList="";
        for(let i=0;i<regions.length;i++){
            regionList +=regions[i].getAttribute("value")+"/";
        }
        document.getElementById("regionSubmit").value = regionList;
    })

</script>