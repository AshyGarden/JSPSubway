<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

	<%@ include file="../include/header.jsp" %>
	
	<div class="home">
		<br>
		<h1>
			Hello world! <br>
			임시 HOME  <br>
			헤더의 로고를 클릭하면 Home으로 돌아옵니다.  <br>
		</h1>
		<br>
		<hr>
		
		회원가입 : 
		<a href="${pageContext.request.contextPath}/user/userJoin">
			<button type="button"> userJoin </button>
		</a> <br>
		로그인 : 
		<a href="${pageContext.request.contextPath}/user/login">
			<button type="button"> login </button>
		</a> <br>
		<hr>
		상세보기 페이지 : 
		<a href="${pageContext.request.contextPath}/station/detail">
			<button type="button"> detail </button>
		</a> <br>
		메인 페이지(진짜 홈) : 
		<a href="${pageContext.request.contextPath}/station/main">
			<button type="button"> Main </button>
		</a> 
	</div>
	<%@ include file="../include/footer.jsp" %>

</body>
</html>
