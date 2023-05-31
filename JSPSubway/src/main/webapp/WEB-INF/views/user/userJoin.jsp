<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
	<title>Join</title>
    <link href="${pageContext.request.contextPath }/css/user.css" rel="stylesheet">
</head>  
<body>

<%@ include file="../../include/header.jsp" %>
    
	<div class="wrapper user-join">
        
        <div class="title">
            <h1>회원가입</h1>
        </div>

        <section>
            <div class="simbol-line">
                <!-- <div class="simbol"> </div> -->
                <div class="green-circle"> </div>
                <div class="green-circle red-background"> </div>
                <div class="green-circle"> </div>
                <div class="green-circle"> </div>
                <div class="green-circle"> </div>
                <div class="green-circle last-cirecle"> </div>
            </div>

            <form action="${pageContext.request.contextPath}/uesr/join" method="post" id="joinForm" name="joinForm">
                <input type="text" name="userId" id="userId" placeholder="아이디 (영문포함 4~12자 이상)">
                <button type="button" class="btn btn-primary" id="idCheckBtn">중복확인</button>
                <span id="msgId"></span>
                <p>중복 확인 되었습니다.</p>

                <input type="password" name="userPw" id="userPw" placeholder="비밀번호 (8~16자의 영문 대/소문자, 숫자)">
                <span id="msgPw"></span>
                <p class="red-typo">(8~16자의 영문 대/소문자, 숫자)</p>

                <input type="password" name="pwConfirm" id="pwConfirm" placeholder="비밀번호 확인">
				<span id="msgPw-c"></span>             
                <p>비밀번호가 다릅니다.</p>

                <input type="text" name="userName" id="userName" placeholder="이름 (2~12자여야 합니다.)">
                <!--<p>이름은 2자리 이상, 12자리 이하여야 합니다.</p>-->

                <input type="text" name="userEmail1" id="userEmail1" placeholder="이메일">
                <select name="userEmail2" id="user-email2" >
                    <option> naver.com</option>
                    <option> gmail.com</option>
                    <option> daum.net</option>
                </select>
                <button type="button" id="mail-check-btn" class="btn btn-primary">이메일 인증</button>
                <input type="text" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력하세요" maxlength="6" disabled="disabled">
                <span id="mail-check-warn"></span>
                <!--<p>이메일 인증되었습니다.</p>-->

                <br>
                <input type="submit" id="joinBtn" value="회원가입">

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
            alert('아이디를 적으세요,')
            return;
        }
        if(!idFlag) {
            alert('다시 적으시오.');
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
                    document.getElementById('msgId').textContent = '사용 가능한 아이디 입니다.';
                } else {
                    document.getElementById('msgId').textContent = '중복된 아이디 입니다.';
                }
            });
    } //아이디 중복 확인 끝.

    // 인증번호 이메일 전송
    document.getElementById('mail-check-btn').onclick = function() {
        const email = document.getElementById('userEmail1').value + document.getElementById('userEmail2').value;
        console.log('완성된 email : ' + email);
        fetch('${pageContext.request.contextPath}/user/mailCheck?email=' + email)
            .then(res => res.text())
            .then(data => {
                console.log('인증번호 : ' + data);
                document.querySelector('.mail-check-input').disabled = false;
                code = data;
                alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확히 입력하세요!');
            });
    }; //인증번호 이벤트 끝.

    // 인증번호 검증
    document.querySelector('.mail-check-input').onblur = function (e) {
        const inputCode = e.target.value;
        const $resultMsg = document.getElementById('mail-check-warn');
        console.log('사용자가 입력한 값 : ' + inputCode);

        if(inputCode === code) {
            $resultMsg.textContent = '인증번호가 일치합니다,';
            $resultMsg.style.color = 'green';

            document.getElementById('mail-check-btn').disabled = true;
            document.getElementById('userEmail1').setAttribute('readonly',true);
            document.getElementById('userEmail2').setAttribute('readonly', true);
            e.target.style.display = 'none';

            const email2 = document.getElementById('userEmail2');
            
            email2.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex');
            email2.setAttribute('onChange', 'this.selectedIndex = this.initialSelect');
        } else {
            $resultMsg.textContent = '인증번호를 다시 확인해 주세요.';
            $resultMsg.style.color = 'red';
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
                alert('비밀번호 확인란을 확인하세요!');
                return;
            }
            if(document.getElementById('userName').value === '') {
                alert('이름은 필수값입니다.');
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
            alet('입력값을 다시 한번 확인하세요!');
        }
    }

    /* 아이디 형식 검사 스크립트 */
    var id = document.getElementById("userId");
    id.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{4,12}$/;
        if(regex.test(document.getElementById("userId").value)) {
            document.getElementById("userId").style.borderColor = "green";
            document.getElementById("msgId").innerHTML = "아이디 중복 체크는 필수입니다.";
            idFlag = true;
        } else {
            document.getElementById("userId").style.borderColor = "red";
            document.getElementById("msgId").innerHTML = "부적합한 아이디 입니다.";
            idFlag = false;
        }
    }

    /* 비밀번호 형식 검사 스크립트 */
    var pw = document.getElementById("userPw");
    pw.onkeyup = function() {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if(regex.test(document.getElementById("userPw").value)) {
            document.getElementById("userPw").style.borderColor = "green";
            document.getElementById("msgPw").innerHTML = "사용 가능합니다.";
            pwFlag = true;
        } else {
            document.getElementById("userPw").style.borderColor = "red";
            document.getElementById("msgPw").innerHTML = "비밀번호를 제대로 입력하세요.";
            pwFlag = false;
        }
    }

    /* 비밀번호 확인검사 */
    var pwConfirm = document.getElementById("pwConfirm");
    pwConfirm.onkeyup=function() {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if(document.getElementById("pwConfirm").value == document.getElementById("userPw").value) {
            document.getElementById("pwConfirm").style.borderColor = "green";
            document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다.";   
        } else {
            document.getElementById("pwConfirm").style.borderColor = "red";
            document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요.";
        }
    }
</script>

</body>
</html>
