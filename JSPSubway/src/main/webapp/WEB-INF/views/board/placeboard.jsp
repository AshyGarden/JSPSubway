<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- reset.css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- 파비콘 -->
<link rel="icon" href="#">

<!-- custom css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/placeboard.css">

<!-- bootstrap 5.3.2 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>

	<!-- header -->
	<%@ include file="../../include/header.jsp"%>

	<div class="wrapper">

		<div class="titlebox">
			<p>명소 추천 게시판</p>
		</div>
		<hr>


		<table class="table table-bordered table-hover">
			<thead class="text-center">
				<tr>
					<th width=10% class="text-start">글번호</th>
					<th width=15%>역명</th>
					<th width=35%>제목</th>
					<th width=15%>작성자</th>
					<th width=25%>등록일</th>
				</tr>
			</thead>
			<tbody id="board-list">
				<c:forEach var="vo" items="${boardList}">
					<tr>
						<td>${vo.bno}</td>
						<td class="text-center">${vo.sname}</td>
						<td><a class="title" data-bno="${vo.bno}">${vo.title}</a></td>
						<td>${vo.userId}</td>
						<td>
							${vo.parsedDate}
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<hr>

		<!-- 페이지 네이션 -->

		<form action="${pageContext.request.contextPath}/board/placeboard"
			name="pageForm">
			<nav aria-label="Page navigation example">
				<ul id="pagination" class="pagination">
					<c:if test="${pc.prev}">
						<!-- true면 이전버튼 보이고 false면 안보임 -->
						<li class="page-item">
							<!-- 이전 버튼-->
							<a class="page-link" data-pagenum="${pc.beginPage-1}" aria-label="Previous">
							&laquo;
						</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
						<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a
							class="page-link" data-pagenum="${num}" href="">${num}</a></li>
					</c:forEach>
					<c:if test="${pc.next}">
						<li class="page-item">
							<!-- 다음 버튼--> <a class="page-link" data-pagenum="${pc.endPage+1}"
							aria-label="Next">&raquo;
						</a>
						</li>
					</c:if>
				</ul>
				<div class="cbtn">
					<button type="button" class="btn btn-outline-success right"
						onclick="location.href='${pageContext.request.contextPath}/board/write'">글쓰기</button>
				</div>
			</nav>

			<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
			<input type="hidden" name="cpp" value="${pc.paging.cpp}">

		</form>

		<div id="contentDiv"></div>

	</div>

	<!-- 모달 -->
	<div class="modal fade" id="detailModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body row">
					<div class="modal-img col-sm-8 col-xs-6">
						<img src="${pageContext.request.contextPath}/img/img_ready.png"
							id="Img" width="100%">
					</div>
					<div class="modal-con col-sm-4 col-xs-6">
						<div class="modal-inner">
							<div class="profile">
								<img src="${pageContext.request.contextPath}/img/profile.png">
							</div>
							<div class="title">
								<p id="writer">작성자</p>
								<p id="inner-title">제목</p>
								<small id="writedate">21시간전</small><br>
							</div>
							<div class="content">
								<p id="content">Lorem ipsum dolor sit amet, consectetur
									adipiscing elit. Aliquam vulputate elit libero, quis mattis
									enim tincidunt non. Mauris consequat ante vel urna posuere
									consequat.</p>
								<span>관련링크</span><br> <a id="placeurl" href="${vo.placeUrl}"><small>링크가
										나오는 칸이야</small></a>
							</div>
							<div class="inner-address">
								<br> <span>주소</span><br> <span id="addrZipNum"><small>우편번호가
										나오는 칸이야</small></span><br> <span id="addrBasic"><small>기본주소가
										나오는 칸이야</small></span> <span id="addrDetail"><small>상세주소가 나오는
										칸이야</small></span>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../../include/footer.jsp"%>


	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

	<script>

//페이지네이션

window.onload = function() {
	
    document.getElementById('pagination').addEventListener('click', e => {
        if(!e.target.matches('a')) {
            return;
        }
        e.preventDefault(); //a태그 고유기능 중지

        const value = e.target.dataset.pagenum;

        document.pageForm.pageNum.value = value;
        document.pageForm.submit();
    });
	
}


//상세보기 처리(모달창 열어주기)
document.getElementById('board-list').addEventListener('click', e => {
    e.preventDefault(); //a의 고유 기능 중지
    console.log(e.target);
    
	if(e.target.matches('.title') ) {
				console.log('타이틀클릭');
				
			


    //글 번호 얻기
    const bno = e.target.dataset.bno;
	    		console.log('bno: ' + bno);

        fetch('${pageContext.request.contextPath}/board/content/' + bno)
        .then(res => res.json()) //PlaceBoardVO
        .then(data => {
        console.log(data);

        // const src = '${pageContext.request.contextPath}/###/###/' + data.fileLoca + '/' + data.fileName;
        // document.getElementById('Img').setAttribute('src', src);
        document.getElementById('writer').textContent = data.writer;
        document.getElementById('inner-title').textContent = data.title;
        document.getElementById('writedate').textContent = data.writeDate;
        document.getElementById('content').textContent = data.content;
        document.getElementById('placeurl').textContent = data.placeUrl;
        document.getElementById('addrZipNum').textContent = data.addrZipNum;
        document.getElementById('addrBasic').textContent = data.addrBasic;
        document.getElementById('addrDetail').textContent = data.addrDetail;

    });
        
    $('#detailModal').modal('show');
	}
});





//댓글 날짜 변환 함수
function parseTime(writeDate) {
    let year, month, day, hour, minute, second;

    if(writeDate.length === 5) {
    	[year, month, day, hour, minute] = writeDate;
        second = 0;
    } else {
        [year, month, day, hour, minute, second] = writeDate;
    }
    
    
}

</script>
</body>
</html>