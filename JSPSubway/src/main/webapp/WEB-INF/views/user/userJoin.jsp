<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
	<title>2호선 개발중: 회원가입</title>
    <link href="${pageContext.request.contextPath }/css/user.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/img/subway-icon.ico">
</head>  
<body>

<%@ include file="../../include/header.jsp" %>
    
	<div class="wrapper user-join">
        
        <div class="title">
            <h1>회원가입</h1>
        </div>

        <section>
            <div class="simbol-line">
                <div class="green-circle"> </div>
                <div class="green-circle"> </div>
                <div class="green-circle"> </div>
                <div class="green-circle"> </div>
                <div class="green-circle"> </div>
                <div class="green-circle last-cirecle"> </div>
            </div>

            <form action="${pageContext.request.contextPath}/user/join" method="post" id="joinForm" name="joinForm">
                <input type="text" name="userId" id="userId" placeholder="아이디">
                <button type="button" class="btn" id="idCheckBtn">중복확인</button>
                <p id="msgId">아이디는 4~12자의 대/소문자, 숫자만 가능합니다.</p>

                <input type="password" name="userPw" id="userPw" placeholder="비밀번호">
                <p id="msgPw">비밀번호는 8~16자의 대/소문자, 숫자만 가능합니다.</p>

                <input type="password" name="pwConfirm" id="pwConfirm" placeholder="비밀번호 확인">        
                <p id="msgPw-c">비밀번호란과 동일한 비밀번호를 입력해주세요.</p>

                <input type="text" name="userName" id="userName" placeholder="이름 (2~12자)">
                <p id="msgName">이름은 2자리 이상, 12자리 이하여야 합니다.</p>

                <input type="text" name="userEmail1" id="userEmail1" placeholder="이메일">
                <select name="userEmail2" id="userEmail2" >
                    <option>@naver.com</option>
                    <option>@gmail.com</option>
                    <option>@daum.net</option>
                </select>
                <button type="button" id="mail-check-btn" class="btn">이메일 인증</button>
                <p id="msgEmail">-</p>
                <input type="text" class="mail-check-input" placeholder="이메일 인증을 진행해주세요."
                            maxlength="6" disabled="disabled">

                <br>
                <input type="button" id="joinBtn" value="회원가입">

            </form>
            <!-- <div class="simbol-line2"></div> -->

        </section>
    </div>

<%@ include file="../../include/footer.jsp" %>






<script>

    let code = '';
    let idFlag, pwFlag;

    // 아이디 중복 체크
	document.getElementById('idCheckBtn').onclick = function() {

        const userId = document.getElementById('userId').value;
        if(userId === '') {
            alert('아이디를 입력해주세요.')
            return;
        }
        if(!idFlag) {
            alert('아이디는 4~12자의 대/소문자, 숫자만 가능합니다.');
            return;
        }

        // 요청에 관련된 정보 객체
        const reqObj = {
            method : 'post',
            headers : {
                'Content-Type': 'text/plain'
            },
            body : userId
        };
        // 비동기 요청 보내기
        fetch('${pageContext.request.contextPath}/user/idCheck', reqObj)
            .then(res => res.text())
            .then(data => {
                if(data === 'ok') {
                    document.getElementById('userId').setAttribute('readonly', true);
                    document.getElementById('idCheckBtn').setAttribute('disabled', true);
                    document.getElementById('userId').style.pointerEvents = "none";
                    document.getElementById('userId').style.color = "#a5a5a5";
                    document.getElementById('userId').style.backgroundColor = "#f5f5f5";
                    document.getElementById('msgId').textContent = '사용 가능한 아이디입니다.';
                } else {
                    document.getElementById('msgId').textContent = '이미 사용된 아이디입니다.';
                }
            });
    } //아이디 중복 확인 끝.


    // 인증번호 이메일 전송
    const $msgEmail = document.getElementById('msgEmail'); 

    document.getElementById('mail-check-btn').onclick = function() {
        let regex = /^[A-Za-z0-9+]{1,254}$/;
        if(!regex.test(document.getElementById('userEmail1').value)) {
            $msgEmail.style.opacity = '1';
            $msgEmail.style.color = 'red';
            $msgEmail.textContent = '올바르지 않은 이메일 형식입니다.';
            return;
        }

        const email = document.getElementById('userEmail1').value + document.getElementById('userEmail2').value;
        console.log('완성된 email : ' + email);
        fetch('${pageContext.request.contextPath}/user/mailCheck?email=' + email)
            .then(res => res.text())
            .then(data => {
                console.log('인증번호 : ' + data);
                document.querySelector('.mail-check-input').disabled = false;
                code = data;
                $msgEmail.style.opacity = '1';
                $msgEmail.style.color = 'gray';
                $msgEmail.textContent = '인증번호가 전송되었습니다. 확인 후 입력란에 정확히 입력해주십시오.';
                document.querySelector('.user-join .mail-check-input').placeholder = '인증번호 6자리를 입력하세요';
            });
    }; //인증번호 이벤트 끝.

    // 인증번호 검증
    document.querySelector('.mail-check-input').onblur = function (e) {
        const inputCode = e.target.value;
        const $userEmail1 = document.getElementById('userEmail1');
        const $userEmail2 = document.getElementById('userEmail2');
        console.log('사용자가 입력한 값 : ' + inputCode);

        if(inputCode === code) {
            $msgEmail.color = '#00A84D';
            $msgEmail.textContent = '인증번호가 일치합니다.';

            document.getElementById('mail-check-btn').disabled = true;
            $userEmail1.setAttribute('readonly',true);  $userEmail2.setAttribute('readonly', true);
            e.target.style.display = 'none';
            // 읽음처리하기
            $userEmail1.style.color = "#a5a5a5";  $userEmail2.style.color = "#a5a5a5";
            $userEmail1.style.backgroundColor = "#f5f5f5";  $userEmail2.style.backgroundColor = "#f5f5f5";
            $userEmail2.style.borderRightColor = "#f5f5f5"
            $userEmail1.style.pointerEvents = "none";  $userEmail2.style.pointerEvents = "none";

            const email2 = document.getElementById('userEmail2');
            
            email2.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex');
            email2.setAttribute('onChange', 'this.selectedIndex = this.initialSelect');
        } else {
            $msgEmail.style.opacity = '1';
            $msgEmail.color = 'red';
            $msgEmail.textContent = '인증번호를 다시 확인해 주세요.';
            e.target.focus();
        }
    } //인증번호 검증 끝


    // 폼 데이터 검증 (회원 가입 버튼 눌렀을 시)
    document.getElementById('joinBtn').onclick = function() {
    	
        if(idFlag && pwFlag) {
            if(!document.getElementById('userId').getAttribute('readonly')) {
                alert('아이디 중복체크는 필수입니다.');
                return;
            }
            if(document.getElementById('userPw').value !== document.getElementById('pwConfirm').value) {
                alert('비밀번호 확인란의 비밀번호가 일치하지 않습니다.');
                return;
            }
            if(document.getElementById('userName').value === '') {
                alert('이름을 입력해주세요.');
                return;
            }
            if(!document.getElementById('mail-check-btn').disabled) {
                alert('이메일 인증을 완료해 주세요.');
                return;
            }
            if(confirm('회원가입을 진행합니다.')) {
                document.joinForm.submit();
            } else return;
        } else {
            alert('입력한 정보가 맞는지 다시 한번 확인해주세요!');
        }
    }

    /* 아이디 형식 검사 스크립트 */
    const $id = document.getElementById("userId");
    const $idCircle = document.querySelector('.simbol-line > .green-circle:nth-child(1)');
    $id.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{4,12}$/;
        if(regex.test($id.value)) {
            $id.style.borderColor = "#00A84D";
            document.getElementById("msgId").innerHTML = "사용 가능한 아이디입니다.";
            if(document.getElementById("msgId").classList.contains('red-typo')) document.getElementById("msgId").classList.remove('red-typo');
            if($idCircle.classList.contains('red-background')) $idCircle.classList.remove('red-background');
            idFlag = true;
        } else {
            $id.style.borderColor = "red";
            document.getElementById("msgId").innerHTML = "아이디는 4~12자의 대/소문자, 숫자만 가능합니다.";
            if(!document.getElementById("msgId").classList.contains('red-typo')) document.getElementById("msgId").classList.add('red-typo');
            if(!$idCircle.classList.contains('red-background')) $idCircle.classList.add('red-background');
            idFlag = false;
        }
    }

    /* 비밀번호 형식 검사 스크립트 */
    const $pw = document.getElementById("userPw");
    const $pwCircle = document.querySelector('.simbol-line > .green-circle:nth-child(2)');
    $pw.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if(regex.test($pw.value)) {
            $pw.style.borderColor = "#00A84D";
            document.getElementById("msgPw").innerHTML = "사용 가능한 비밀번호입니다.";
            if(document.getElementById("msgPw").classList.contains('red-typo')) document.getElementById("msgPw").classList.remove('red-typo');
            if($pwCircle.classList.contains('red-background')) $pwCircle.classList.remove('red-background');
            pwFlag = true;
        } else {
            document.getElementById("userPw").style.borderColor = "red";
            document.getElementById("msgPw").innerHTML = "비밀번호는 8~16자의 대/소문자, 숫자만 가능합니다.";
            if(!document.getElementById("msgPw").classList.contains('red-typo')) document.getElementById("msgPw").classList.add('red-typo');
            if(!$pwCircle.classList.contains('red-background')) $pwCircle.classList.add('red-background');
            pwFlag = false;
        }
    }

    /* 비밀번호 확인검사 */
    const $pwConfirm = document.getElementById("pwConfirm");
    const $pwCCircle = document.querySelector('.simbol-line > .green-circle:nth-child(3)');
    $pwConfirm.onblur = function() {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if($pwConfirm.value == $pw.value) {
            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다.";   
            if(document.getElementById("msgPw-c").classList.contains('red-typo')) document.getElementById("msgPw-c").classList.remove('red-typo');
            if($pwCCircle.classList.contains('red-background')) $pwCCircle.classList.remove('red-background');
            document.getElementById("msgPw-c").style.color = '#00A84D';
            $pwConfirm.setAttribute('background-color', '#00A84D'); 
        } else {
            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치하지 않습니다.";
            if(!document.getElementById("msgPw-c").classList.contains('red-typo')) document.getElementById("msgPw-c").classList.add('red-typo');
            if(!$pwCCircle.classList.contains('red-background')) $pwCCircle.classList.add('red-background');
            $pwConfirm.setAttribute('background-color', 'red');
        }
    }

    /* 이름 형식 검사 스크립트 */
    const $userName = document.getElementById("userName");
    const $nameCircle = document.querySelector('.simbol-line > .green-circle:nth-child(4)');
    $userName.onkeyup = function() {
        var regex = /^[ㄱ-ㅎ가-힣A-Za-z0-9+]{2,12}$/;
        if(regex.test($userName.value)) {
            $userName.style.borderColor = "#00A84D";
            document.getElementById("msgName").innerHTML = "사용 가능한 이름입니다.";
            if(document.getElementById("msgName").classList.contains('red-typo')) document.getElementById("msgName").classList.remove('red-typo');
            if($nameCircle .classList.contains('red-background')) $nameCircle .classList.remove('red-background');
            idFlag = true;
        } else {
            $userName.style.borderColor = "red";
            document.getElementById("msgName").innerHTML = "이름은 2~12자의 한글, 영어, 숫자만 가능합니다.";
            if(!document.getElementById("msgName").classList.contains('red-typo')) document.getElementById("msgName").classList.add('red-typo');
            if(!$nameCircle .classList.contains('red-background')) $nameCircle .classList.add('red-background');
            idFlag = false;
        }
    }


</script>

</body>
</html>
