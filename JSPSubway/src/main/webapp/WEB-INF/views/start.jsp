<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2호선 개발중</title>

	<!-- reset.css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- 파비콘 -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/subway-icon.ico">

    <!-- bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<style>
	@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	html body {
		font-family: 'GongGothicMedium';	
	} 
			
	.lc-block div h2 {
    	margin-bottom: 20px;
	}

	hr {
    	width: 50%;
		height : 10px;
		margin : 10px auto;
		border-top : 5px solid;
	}
	</style>
	
</head>
<body>

	<div class="container-fluid overflow-hidden p-0 bg-light">
		<div class="row g-0">
			<div class="col-md-6 order-md-2">
				<div class="card" lc-helper="video-bg">
					<video class="min-vh-100" autoplay preload muted loop playsinline style="object-fit: cover; object-position: 50% 50%;">
						<!-- adjust object-position to tweak cropping on mobile -->
						<source src="${pageContext.request.contextPath}/img/2linevideo_Trim.mp4" type="video/mp4">
					</video>
				</div>
			</div>
			<div class="col-md-6 order-md-1 my-auto text-center" style="padding:8vw">

				<div class="lc-block mb-4">
					<div editable="rich">
						<h2>2호선 개발중</h2>
						<hr class="text-success">
						<p class="lead"> 
							<strong>안전한 도시철도, 편리한 교통 서비스.</strong><br>
							누구나 안전하고 행복하게 이용할 수 있는 서울지하철 2호선의 모든 것을 알립니다.
						</p>
					</div>

				</div>

				<div class="lc-block" id="startbutton">
					<a class="btn btn-outline-success" href="${pageContext.request.contextPath}/station/main" role="button">시작하기</a>
				</div><!-- /lc-block -->

			</div>
		</div>
	</div>
 

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>