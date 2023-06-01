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
				<h4>환승역 선택</h4>
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
					<!-- <input type="submit" value="검색"> -->
					<!-- 사실 검색이 아니라 keyup마다 검색되게 하고싶은데...ㅎㅎ -->
				</form>
			</div>
		</section>

		<section class="metro-maps">
			<div>
				<div class="map-contain">

					<!-- 역 이름은 for문으로 넣는거 어떤가요 -->
					<div id="map-top" class="metros map-row" >
						<div class="metros map-empty"></div>
						<div id="map-top-center" class="metros">

							<div class="station">
								<p class="st-name">201</p>
								<div class="st-circle" id="sno1"></div>
							</div>
							<div class="station">
								<p class="st-name">202</p>
								<div class="st-circle" id="sno2"></div>
							</div>
							<div class="station">
								<p class="st-name">203</p>
								<div class="st-circle" id="sno3"></div>
							</div>
							<div class="station">
								<p class="st-name">204</p>
								<div class="st-circle" id="sno4"></div>
							</div>
							<div class="station">
								<p class="st-name">205</p>
								<div class="st-circle" id="sno5"></div>
							</div>
							<div class="station">
								<p class="st-name">206</p>
								<div class="st-circle" id="sno6"></div>
							</div>
							<div class="station">
								<p class="st-name">207</p>
								<div class="st-circle" id="sno7"></div>
							</div>
							<div class="station">
								<p class="st-name">208</p>
								<div class="st-circle" id="sno8"></div>
							</div>
							<div class="station">
								<p class="st-name">209</p>
								<div class="st-circle" id="sno9"></div>
							</div>
							<div class="station">
								<p class="st-name">210</p>
								<div class="st-circle" id="sno10"></div>
							</div>
							<div class="station">
								<p class="st-name">211</p>
								<div class="st-circle" id="sno11"></div>
							</div>
							<div class="station">
								<p class="st-name">212</p>
								<div class="st-circle" id="sno12"></div>
							</div>
							<div class="station">
								<p class="st-name">213</p>
								<div class="st-circle" id="sno13"></div>
							</div>
							<div class="station">
								<p class="st-name">214</p>
								<div class="st-circle" id="sno14"></div>
							</div>
							<div class="station">
								<p class="st-name">215</p>
								<div class="st-circle" id="sno15"></div>
							</div>

						</div>
						<div class="metros map-empty"></div>
					</div>

					<div id="map-middle" class="metros"> 
						<div id="map-left" class="metros map-column">

						</div>
						<div id="map-center" class="metros"></div>
						<div id="map-right" class="metros map-column">

						</div>
					</div>

					<div id="map-bottom" class="metros map-row">
						<div class="metros map-empty"></div>
						<div id="map-bottom-center" class="metros">

						</div>
						<div class="metros map-empty"></div>
					</div>

				</div>
			</div>
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
		







	</script>


</body>
</html>