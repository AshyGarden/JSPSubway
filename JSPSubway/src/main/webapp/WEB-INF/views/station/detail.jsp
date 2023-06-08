<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.spring.JspSubway.command.SubwayVO" %>

<html>
    <head>
	<title>detail</title>
	<link href="${pageContext.request.contextPath}/css/detail.css" rel="stylesheet">
</head>
<body>
    
    <%@ include file="../../include/header.jsp" %>
    
    
    <c:set var="subway" value="${station.subway}" />
    <article id="popup-img">
        <div id="popup-div"></div>
        <img src="${pageContext.request.contextPath}/img/stations/station_${station.sco}.jpg" alt="역 이미지">
        <!-- <span id="popup-close">X</span> -->
    </article>
    <div class="fixed-gradation fixedR"></div>
    <div class="fixed-gradation fixedL"></div>

    <div class="wrapper">


        <section id="left">
            <div class="left-map serve-map mapL">
                <div id="prevStn" class="station">
                    <h3><%-- ${stnPrev.sco} --%></h3> <!-- station_num-1 -->
                    <h1><%-- ${stnPrev.sname} --%></h1>
                </div>
            </div>
            <div class="arrow" id="arrow-left"><<<</div>
            <div class="left-map">
                <div id="mainStation" class="station">
                    <h3>${station.sco}</h3> <!-- station_num -->
                    <h1>${station.sname}</h1> <!-- station_name -->
                </div>
            </div>
            <div class="arrow" id="arrow-right">>>></div>
            <div class="left-map serve-map mapR">
                <div id="nextStn" class="station">
                    <h3><%-- ${stnNext.sco} --%></h3> <!-- station_num+1 --> 
                    <h1><%-- ${stnNExt.sname} --%></h1>
                </div>
            </div>
        </section> <!-- END Left -->



        <section id="center">
            <div class="center-details">

                <h2>Details</h2>

                <div class="main-station" > 
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-2-circle-fill" viewBox="0 0 16 16">
                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM6.646 6.24c0-.691.493-1.306 1.336-1.306.756 0 1.313.492 1.313 1.236 0 .697-.469 1.23-.902 1.705l-2.971 3.293V12h5.344v-1.107H7.268v-.077l1.974-2.22.096-.107c.688-.763 1.287-1.428 1.287-2.43 0-1.266-1.031-2.215-2.613-2.215-1.758 0-2.637 1.19-2.637 2.402v.065h1.271v-.07Z"/>
                    </svg> 
                    <h3>${station.sname}</h3> <!-- station_name -->
                </div>

                <div class="other-name">
                    <li>영문명: ${subway.snameEng}</li>
                    <li>중문명: ${subway.snameChn}</li>
                    <li>일문명: ${subway.snameJpn}</li>
                </div>
                <p id="show-station-img" ><a href="#">역 이미지 보러가기</a></p>
                
                <hr>

                <div class="details">

                    <div class="transferLine" id="tLine">
                        <h5>환승호선</h5>
                        <div class="transferImg">
                            <!-- 하단 더미데이터 삭제 후, 반복문으로 숫자만 바꿔서
                                아이콘 추가하기.
                                반복 :  <i class="fa-solid fa-?"></i> -->
                                <!-- <i class="fa-solid fa-1"></i>
                                <i class="fa-solid fa-2"></i>
                                <i class="fa-solid fa-3"></i> -->                      
                            <c:if test="${subway.tline1 ne 0}"><i class="fa-solid fa-${subway.tline1}"></i>호선</c:if>
                            <c:if test="${subway.tline2 ne 0}"><i class="fa-solid fa-${subway.tline2}"></i>호선</c:if>
                            <c:if test="${subway.tline3 ne 0}"><i class="fa-solid fa-${subway.tline3}"></i>호선</c:if>                          
                            <c:if test="${subway.tline1 + subway.tline2 + subway.tline3 eq 0}">
                                <p style="color: gray; font-size: 14px;">환승역이 없습니다.</p>
                            </c:if>                                                  
                        </div>
                    </div>

                    <div class="watercloset-inout" id="wcio">
                        <h5>화장실 위치: <strong>${station.wcio eq 'true'?'개찰구 내부':'개찰구 외부'}</strong></h5>
                        <!-- watercloset_inout. 있을 경우 ●. 없을 경우 ○ -->
                        <!-- <strong>●</strong> -->
                    </div>

                    <div class="exit-count" id="ec">
                        <h5>출구 개수: <strong>${station.ec}</strong>개</h5>
                    </div>

                    <div class="exit-LR">
                        <h5>
                            <!-- 선택된 쪽에 .selete class 추가하기 -->
                            <!-- 디자인은 추후 수정될 예정 -->
                            <span class="left select">LEFT</span>  탑승 위치  <span class="right">RIGHT</span> 
                        </h5>
                    </div>

                    <div class="cross-platform">
                        <h5>반대편 승강장으로 출입</h5>
                        <h5>
                            &nbsp;<span class="able (${station.cp}==2)?'select':'' "> 가능 </span> &nbsp;
                            &nbsp;<span class="possible (${station.cp}==1)?'select':'' "> 조건부 가능 </span> &nbsp;
                            &nbsp;<span class="disable (${station.cp}==0)?'select':'' "> 불가능 </span> &nbsp;
                        </h5>
                    </div>

                </div> <!-- detail 끝!!! -->

                <table>
                    <tr>
                        <th>첫차</th>
                        <th>막차</th>
                    </tr>
                    <tr>
                        <td>${station.fs}</td> <!-- first_subway_time -->
                        <td>${station.ls}</td> <!-- last_subway_time -->
                    </tr>
                </table>
                
            </div>
        </section> <!-- END Center -->

        <section id="right">
            <div class="right-board">
                <h2>추천 명소</h2>
                <div class="fir">
                    <a href="fi">
                        <h1>1</h1> 
                        <div class="content">
                            <h4>신도림 최고 맛집</h4>
                            <h3>작성자</h3>
                            <p>신도림역에 이런 장소가 있었다니! ...</p>
                        </div>
                    </a>
                </div>
                <div class="sec">
                    <a href="#">
                        <h1>2</h1>
                        <div class="content">
                            <h4>title 글 제목</h4>
                            <h3>user_name 작성자</h3> <!-- user_id로 join해서 name 가져오기... -->
                            <p>content 글 본문 ...</p>
                            <!-- 그 외 디자인 등 추가사항은 데이터 넣은 뒤 조정 
                                (본문이 얼마나 들어가냐에 따라 바꿔야 해서 디자인 생략해둠.) -->
                        </div>
                    </a>
                </div> 
                <div class="thr">
                    <a href="#">
                        <h1>3</h1>
                        <div class="content">
                            <h4>[충격] 신도림역에 숨겨진 명소 발견하여... 대중 '환호' </h4>
                            <h3>작성자</h3>
                            <p>5월 23일, 산책을 즐기던 A씨(34)는 신도림역에서 특별한 장소가 발견했다고 SNS에 알렸다. 이 장소는...</p>
                        </div>
                    </a>
                </div> 
            </div>
        </section> <!-- END Right -->
    </div>

<%@ include file="../../include/footer.jsp" %>

    

    <script> 
        //가로 스크롤 자바스크립트
        const wrapper = document.querySelector('.wrapper');
        let offset = 0;

        window.addEventListener('wheel', (e) => {
            offset += Math.sign(e.deltaY) * 60;

            if (offset < 0) {
                offset = 0;
            } else if (offset > 2000 - window.innerWidth) {
                offset = 2000 - window.innerWidth;
            }
            
            wrapper.style.transform = 'translateX(-'+offset+'px';
        });

        

        //역 이용 및 비상대피 안내도
        const $popupImg = document.getElementById('popup-img');
        document.getElementById('show-station-img').addEventListener('click', function(){
            $popupImg.style.display = 'block';
        });
        $popupImg.addEventListener('click', function(){
            $popupImg.style.display = 'none';
        });
        
        


    </script>

    <script>
        if(!'${station.ods}'){
            document.querySelector('.exit-LR .right').classList.toggle('select');
            document.querySelector('.exit-LR .left').classList.toggle('select');
        } 


        if('${station.cp}==2'){
            document.querySelector('.cross-platform .able').classList.toggle('select');
            document.querySelector('.exit-LR .left').classList.toggle('select');
        } else if('${station.cp}==1'){
            document.querySelector('.exit-LR .left').classList.toggle('select');
            document.querySelector('.exit-LR .right').classList.toggle('select');
        } else{

        }


    </script>


</body>
</html>