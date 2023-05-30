<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

            <form action="#" id="join-form">
                <input type="text" name="userId" placeholder="아이디">
                <button>중복확인</button>
                <p>아이디는 8자리 이상, 12자리 이하여야 합니다./중복 확인 되었습니다.</p>

                <input type="password" name="userPw" placeholder="비밀번호">
                <p class="red-typo">(8~16자의 영문 대/소문자, 숫자)</p>

                <input type="password" placeholder="비밀번호 확인">
                <p>비밀번호가 다릅니다.</p>

                <input type="text" name="userName" placeholder="이름">
                <p>이름은 2자리 이상, 12자리 이하여야 합니다.</p>

                <input type="text" name="userEmail1" placeholder="이메일"> @
                <select name="userEmail2" id="user-email" >
                    <option> naver.com</option>
                    <option> gmail.com</option>
                    <option> daum.net</option>
                </select>
                <button>이메일 인증</button>
                <p>이메일 인증되었습니다.</p>

                <br>
                <input type="submit" id="joinBtn" value="회원가입">

            </form>
            <!-- <div class="simbol-line2"></div> -->

        </section>
    </div>

<%@ include file="../../include/footer.jsp" %>
