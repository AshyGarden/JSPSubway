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
    <title>Document</title>

    <!-- reset.css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- 파비콘 -->
    <link rel="icon" href="#">

    <!-- bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<!-- write style -->
    <style>
        .wrapper .section-inner {
            margin: 2% auto;
        }

        .wrapper .section-inner .btn {
            float : right;
            margin-left : 10px;
        }

    </style>
</head>
<body>
	<!-- header -->
	<%@ include file="../../include/header.jsp" %>

    <div class="wrapper">

        <div class="col-xs-12 col-8 section-inner">
            <form action="${pageContext.request.contextPath}/board/write" method="post">
                <div class="mb-3">
                    <label class="form-label" disabled>작성자</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="아이디는 로그인정보에서 받아올거에요">
                </div>
                <div class="mb-3">
                    <label class="form-label">제목</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력해주세요.">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" placeholder="내용을 입력해주세요."></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">주소</label>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="addrZipNum" id="addrZipNum" value="" placeholder="우편번호(주소찾기를 클릭하여 검색하세요.)" readonly>
                        <button class="btn btn-outline-secondary" type="button" id="addBtn" onclick="searchAddress()">주소찾기</button>
                    </div>
                </div>
                <div class="mb-2">
                    <input class="form-control input-sm add" name="addrBasic" id="addrBasic" value="" placeholder="기본주소" readonly>
                </div>
                <div class="mb-3">
                    <input class="form-control input-sm add" name="addrDetail" id="addrDetail" value="" placeholder="상세주소">
                </div>
                <div class="mb-3">
                    <label class="form-label">관련 링크</label>
                    <input class="form-control input-sm add" name="placeUrl" id="placeUrl" value="" placeholder="관련 링크를 등록해주세요">
                </div>                                                
                <label class="form-label">사진등록</label><br>
                <div class="input-group mb-4">
                    <input type="file" class="form-control" name="file" id="file">
                    <label class="input-group-text" for="file">Upload</label>
                </div>
                <div>
                    <button type="submit" class="btn btn-outline-success" id="registBtn">등록하기</button>
                    <button type="button" class="btn btn-outline-success" id="listBtn" 
                    onclick="location.href='${pageContext.request.contextPath}/board/placeboard'">목록</button>
                </div>
            </form>
        </div>

    </div>


    <!-- footer -->
    <%@ include file="../../include/footer.jsp" %>

<!-- kakao 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                //data는 사용자가 선택한 주소 정보를 담고 있는 객체이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
    
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
    
                document.getElementById('addrZipNum').value = data.zonecode;
                document.getElementById('addrBasic').value = addr;
                document.getElementById('addrDetail').focus();
            }
        }).open();
    
    }
        
    </script>


</body>
</html>