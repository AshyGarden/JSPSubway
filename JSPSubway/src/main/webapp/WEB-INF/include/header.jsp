<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2호선 알리미</title>
	
	<!-- css 연결 -->
	<link href="${pageContext.request.contextPath}/css/setting.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet">
	
	<!-- <link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet"> -->
	 
	<!-- bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
    	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<!-- 파비콘 -->
	<link rel="icon" href="#">
	
	<!-- 아이콘 사이트 fontawesome css: https://fontawesome.com -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<body>

	<!-- header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid"><img src="./img/Seoul_Metro_Line_2.svg" height="50px" width="50px" /> <a class="navbar-brand name" href="#">&nbsp 2<span class="go">호선</span></a> <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"> <a class="nav-link active" aria-current="page" href="#"><span class="home">Home</span></a> </li>
                    <li class="nav-item"> <a class="nav-link" href="#">로그인</a> </li>
                    <li class="nav-item"> <a class="nav-link" href="#">로그아웃</a> </li>
                </ul>
                <div class="btn btn-dark">회원가입</div>
            </div>
        </div>
    </nav>


</body>
</html>