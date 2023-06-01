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
				<div>
					<label class="label-L">
						<input type="radio" name="openDoorside" value="L">
						<span class="key-button">L</span>
					</label>
					<span>│</span>
					<label class="label-R">
						<input type="radio" name="openDoorside" value="R">
						<span class="key-button">R</span>
					</label>
				</div>
			</div>

			<div class="watercloset-inout">
				<div>
					<span class="key-button">ON</span>
				</div>
			</div>

			<div class="station-search">
				<form action="#">
					<input type="text" name="stationName" placeholder="역 이름 검색하기">
					<input type="submit" value="검색">
					<!-- 사실 검색이 아니라 keyup마다 검색되게 하고싶은데...ㅎㅎ -->
				</form>
			</div>
		</section>

		<section class="metro-maps">
			여기에 맵이 들어감

		</section>
	
	</div>
   
   
<%@ include file="../../include/footer.jsp" %>


	<script>
		// 문 열리는 방향 L/R의 체크해제 기능 추가
		document.querySelector('.condition .open-doorside > div').addEventListener('click', function(e){
			
			if(!e.target.matches('label *') && !e.target.matches('label')){ 
				console.log('클릭이 가능한 범위가 아님!');
				return;
			}

			console.log('클릭한 범위: '+e.target);


		})
	</script>


</body>
</html>