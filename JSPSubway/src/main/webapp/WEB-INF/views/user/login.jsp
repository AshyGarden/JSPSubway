<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>Login</title>
    <link href="${pageContext.request.contextPath }/css/user.css" rel="stylesheet">
</head>
<body>
    
<%@ include file="../../include/header.jsp" %>

	<div class="wrapper login">
        
        <div class="title">
            <h1>로그인</h1>
        </div>
        <br>
        <div class="login-form">
	        <form action="#">
	        	<input type="text" name="userId" placeholder="아이디">
	        	<input type="password" name="userPw" placeholder="비밀번호">
	        	<input type="submit" value="로그인">
	        </form>
        </div>
        
    </div>



<%@ include file="../../include/footer.jsp" %>


</body>
</html>