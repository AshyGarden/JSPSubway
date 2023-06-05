<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>Main</title>
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<body>

<%@ include file="../../include/header.jsp" %>

    <div class="wrapper main">

		<section class="condition">
			<div class="cross-platform">
				<h4>환승호선 선택</h4>
				<select name="tline" id="cross-select">
					<option value="line1">1호선</option>
					<option value="line3">3호선</option>
					<option value="line4">4호선</option>
					<option value="line5">5호선</option>
					<option value="line6">6호선</option>
					<option value="line7">7호선</option>
					<option value="line8">8호선</option>
					<option value="line9">9호선</option>
					<option value="line10">경의중앙</option>
					<option value="line11">수인분당</option>
					<option value="line12">공항철도</option>
					<option value="line13">신분당</option>
					<option value="line14">우이신설경전철</option>
					<option value="line15">신림선</option>
				</select>
			</div>

			<div class="open-doorside">
				<h4>문 열리는 방향</h4>
				<div>
					<label for="radio-L" class="label-L">
						<input type="radio" name="openDoorside" value="L" id="radio-L">
						<span class="key-button">L</span>
					</label>
					<span>│</span>
					<label for="radio-R" class="label-R">
						<input type="radio" name="openDoorside" value="R" id="radio-R">
						<span class="key-button">R</span>
					</label>
				</div>
			</div>

			<div class="watercloset-inout">
				<h4> . </h4>
				<div>
					<span class="key-button">개찰구 내 화장실 유무</span>
				</div>
			</div>

			<div class="station-search">
				<h4>검색어</h4>
				<form action="#">
					<input type="text" name="stationName" placeholder="역 이름 검색하기">
				</form>
			</div>

			<div class="lookup">
				<div>
					<span class="key-button">조회하기</span>
				</div>
			</div>
		</section>

		<!-- ////////////////////////////////////////// -->

		<section class="metro-maps">
			<div id="map-box">

				<!-- 외부노선 -->
				<div id="map-Kkachisan">

					<div><div class="overflow-box"> <div class="station outline"> </div> </div></div>
					<div id="map-left-out"> 
						<div class="station">
							<p class="st-name">까치산</p>
							<div class="st-circle cross-station" id="2344"></div>
						</div>
					</div>

					<div id="map-bottom-out">
						<div class="station">
							<div class="st-circle" id="2343"></div>
							<p class="st-name">신정<br>네거리</p>
						</div>
						<div class="station">
							<div class="st-circle" id="2342"></div>
							<p class="st-name">양천구청</p>
						</div>
						<div class="station">
							<div class="st-circle" id="2341"></div>
							<p class="st-name">도림천</p>
						</div>
					</div>
					
				</div> <!-- map-Kkachisan END -->

				<div id="map-Sinseoldong">
					<div><div class="overflow-box"> <div class="station outline"></div> </div></div>
					<div id="map-top-out">
						<div class="station">
							<p class="st-name">신설동</p>
							<div class="st-circle cross-station" id="sco2114"></div>
						</div>
						<div class="station">
							<p class="st-name">용두</p>
							<div class="st-circle" id="sco2113"></div>
						</div>
					</div> 
				</div> <!-- map-Sinseoldong END -->


				<div id="map-Sindap">
					<div><div class="overflow-box"> <div class="station outline"></div> </div></div>
					<div id="map-right-out">
						<div class="station">
							<div class="st-circle" id="sco2112"></div>
							<p class="st-name">신답</p>
						</div>
						<div class="station">
							<div class="st-circle" id="sco2111"></div>
							<p class="st-name">용답</p>
						</div>
					</div> 
				</div> <!-- map-Kkachisan END -->



				<div id="map-top">
					<div class="station">
						<p class="st-name">신촌</p>
						<div class="st-circle" id="2400"></div>
					</div>
					<div class="station">
						<p class="st-name">이대</p>
						<div class="st-circle" id="2410"></div>
					</div>
					<div class="station">
						<p class="st-name">아현</p>
						<div class="st-circle" id="2420"></div>
					</div>
					<div class="station">
						<p class="st-name">충정로</p>
						<div class="st-circle cross-station" id="2430"></div>
					</div>
					<div class="station">
						<p class="st-name">시청</p>
						<div class="st-circle cross-station" id="2010"></div>
					</div>
					<div class="station">
						<p class="st-name">을지로<br>입구</p>
						<div class="st-circle" id="2020"></div>
					</div>
					<div class="station">
						<p class="st-name">을지로<br>3가</p>
						<div class="st-circle cross-station" id="2030"></div>
					</div>
					<div class="station">
						<p class="st-name">을지로<br>4가</p>
						<div class="st-circle cross-station" id="2040"></div>
					</div>
					<div class="station">
						<p class="st-name">동대문<br>역사<br>문화공원</p>
						<div class="st-circle cross-station" id="2050"></div>
					</div>
					<div class="station">
						<p class="st-name">신당</p>
						<div class="st-circle cross-station" id="2060"></div>
					</div>
					<div class="station">
						<p class="st-name">상왕십리</p>
						<div class="st-circle" id="2070"></div>
					</div>
					<div class="station">
						<p class="st-name">왕십리</p>
						<div class="st-circle cross-station" id="2080"></div>
					</div>
					<div class="station">
						<p class="st-name">한양대</p>
						<div class="st-circle" id="2090"></div>
					</div>
					<div class="station">
						<p class="st-name">뚝섬</p>
						<div class="st-circle" id="2100"></div>
					</div>
				</div>

				
				<div id="map-right">
					<div class="station">
						<div class="st-circle cross-station" id="2110"></div>
						<p class="st-name">성수</p>
					</div>
					<div class="station">
						<div class="st-circle cross-station" id="2120"></div>
						<p class="st-name">건대입구</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2130"></div>
						<p class="st-name">구의</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2140"></div>
						<p class="st-name">강변</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2050"></div>
						<p class="st-name">잠실나루</p>
					</div>
					<div class="station">
						<div class="st-circle cross-station" id="2160"></div>
						<p class="st-name">잠실</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2170"></div>
						<p class="st-name">잠실새내</p>
					</div>
					<div class="station">
						<div class="st-circle cross-station" id="2180"></div>
						<p class="st-name">종합운동장</p>
					</div>
				</div>


				<div id="map-bottom">
					<div class="station">
						<div class="st-circle" id="2190"></div>
						<p class="st-name">삼성</p>
					</div>
					<div class="station">
						<div class="st-circle cross-station" id="2200"></div>
						<p class="st-name">선릉</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2210"></div>
						<p class="st-name">역삼</p>
					</div>
					<div class="station">
						<div class="st-circle cross-station" id="2220"></div>
						<p class="st-name">강남</p>
					</div>
					<div class="station">
						<div class="st-circle cross-station" id="2230"></div>
						<p class="st-name">교대</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2240"></div>
						<p class="st-name">서초</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2250"></div>
						<p class="st-name">방배</p>
					</div>
					<div class="station">
						<div class="st-circle cross-station" id="2260"></div>
						<p class="st-name">사당</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2270"></div>
						<p class="st-name">낙성대</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2280"></div>
						<p class="st-name">서울대<br>입구</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2290"></div>
						<p class="st-name">봉천</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2300"></div>
						<p class="st-name">신림</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2310"></div>
						<p class="st-name">신대방</p>
					</div>
					<div class="station">
						<div class="st-circle" id="2320"></div>
						<p class="st-name">구로<br>디지털<br>단지</p>
					</div>
				</div>

				<div id="map-left">
					<div class="station">
						<p class="st-name">대림</p>
						<div class="st-circle cross-station" id="2330"></div>
					</div>
					<div class="station">
						<p class="st-name">신도림</p>
						<div class="st-circle cross-station" id="2340"></div>
					</div>
					<div class="station">
						<p class="st-name">문래</p>
						<div class="st-circle" id="2350"></div>
					</div>
					<div class="station">
						<p class="st-name">영등포구청</p>
						<div class="st-circle cross-station" id="2360"></div>
					</div>
					<div class="station">
						<p class="st-name">당산</p>
						<div class="st-circle cross-station" id="2370"></div>
					</div>
					<div class="station">
						<p class="st-name">합정</p>
						<div class="st-circle cross-station" id="2380"></div>
					</div>
					<div class="station">
						<p class="st-name">홍대입구</p>
						<div class="st-circle cross-station" id="2390"></div>
					</div>
				</div>
			</div> <!-- map-box END -->
			
		</section>

	
	</div>
   
   
<%@ include file="../../include/footer.jsp" %>


	<script>


		// 문 열리는 방향 L&R의 체크해제 기능 추가
		const $buttons = document.querySelectorAll('input[type="radio"]');
		let lastChecked = null;
		
		$buttons.forEach(($button) => {
			$button.addEventListener('click', function() {
				if(this === lastChecked) {
					this.checked = false;
					lastChecked = null;
				} else {
					lastChecked = this;
				}
			});
		}); //L&R 기능 END


		// ON, OFF 버튼 눌려있는 기능 추가
		const $wcInOut = document.querySelector('.watercloset-inout > div');
		$wcInOut.addEventListener('click', function(){
			$wcInOut.classList.toggle('wc-select');
		}) //ON OFF 기능 END
		


		// 역 호버시 반응
		const $stationList = document.querySelectorAll('#map-box .station');
		const $stCircleList = document.querySelectorAll('#map-box .st-circle');

		$stCircleList.forEach(($selCir) => { 

			/* 마우스 올리면 */
			$selCir.addEventListener('mouseenter', function(){ 
				$selCir.parentNode.classList.add('station-hover');
				$stCircleList.forEach((c) => {
					if(c != $selCir){  c.parentNode.classList.add('station-nothover') }
				})
				document.querySelector('#map-box').style.borderColor = '#45f095';
				document.querySelector('#map-box #map-Kkachisan .outline').style.borderColor = '#45f095';
				document.querySelector('#map-box #map-Sinseoldong .outline').style.borderColor = '#45f095';
				document.querySelector('#map-box #map-Sindap .outline').style.borderColor = '#45f095';
			})

			/* 마우스 떼면 */
			$selCir.addEventListener('mouseleave', function(){
				if($selCir.parentNode.classList.contains('station-hover')){ 
					
					$selCir.parentNode.classList.remove('station-hover');
					$stCircleList.forEach((c) => {
						if(c != $selCir){  c.parentNode.classList.remove('station-nothover'); }
					})
					document.querySelector('#map-box').style.borderColor = '#00A84D';
					document.querySelector('#map-box #map-Kkachisan .outline').style.borderColor = '#00A84D';
					document.querySelector('#map-box #map-Sinseoldong .outline').style.borderColor = '#00A84D';
					document.querySelector('#map-box #map-Sindap .outline').style.borderColor = '#00A84D';
				}
			})
		}); //역 호버시 반응 22

		// 각 방향에서 가장 길이가 긴 역들 안들어오는 문제 수정해주기
		// 그리고 신정네거리를 위해 까치산쪽 길이 줄이기 신정네거리 안됨



		//역 클릭시 이동
		$stCircleList.forEach(($selCir) => { 
			$selCir.addEventListener('click', function(e){
				console.log(e.target+'역 클릭!');
				console.log(e.target.getAttribute('id'));
				location.href = '${pageContext.request.contextPath}/station/detail/'+e.target.getAttribute('id');
			})
		});


	</script>


</body>
</html>