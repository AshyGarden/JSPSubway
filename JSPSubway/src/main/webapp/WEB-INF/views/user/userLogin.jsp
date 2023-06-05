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
        <div class="login-box">
	        <form action="${pageContext.request.contextPath}/user/userLogin" method="post" id="loginForm" name="loginForm">
	        	<div class="answer-box">
                    <input type="text" name="userId" id="id" placeholder="아이디"><br>
	        	    <input type="password" name="userPw" id="pw" placeholder="비밀번호">
                </div>
	        	<button type="button" id="loginBtn" >로그인</button>
	        </form>
            <a href="${pageContext.request.contextPath}/user/userJoin"><p id="join-link">계정이 없으신가요?</p></a>
        </div>

        
    </div>

<%@ include file="../../include/footer.jsp" %>

<script>
    
    const msg = '${msg}';
    if(msg === 'joinSucess') {
        alert('회원 가입 정상 처리되었습니다.');
    } else if(msg === 'loginFail') {
        alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.');
    }

    document.getElementById('loginBtn').onclick = () => {
        if(document.getElementById('id').value === '') {
            alert('아이디를 입력해주세요.');
            return;
        }
        if(document.getElementById('pw').value === '') {
            alert('비밀번호를 입력해주세요.');
            return;
        }
        document.loginForm.submit();
    }
</script>

</body>
</html>