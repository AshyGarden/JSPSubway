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
<title>2호선 개발중: 게시판</title>



<!-- reset.css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath}/img/subway-icon.ico">

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

	<style>
		@font-face {
			font-family: 'GongGothicMedium';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}
		html body{
			overflow: scroll; 
		}
		html body .wrapper{
			font-family: 'GongGothicMedium';
			font-weight: 300;
		}

	</style>

<body>

	<!-- header -->
	<%@ include file="../../include/header.jsp"%>

	<div class="wrapper">

		<div class="titlebox">
			<p>명소 추천 게시판</p>
		</div>
		<hr>


		<table class="table table-bordered table-hover table-striped">
			<thead class="text-center">
				<tr style="color:white;">
					<th width=9%>글번호</th>
					<th width=17%>역명</th>
					<th width=37%>제목</th>
					<th width=15%>작성자</th>
					<th width=22%>등록일</th>
				</tr>
			</thead>
			<tbody id="board-list">
				<c:forEach var="vo" items="${boardList}">
					<tr>
						<td class="text-center">${vo.bno}</td>
						<td class="text-center">${vo.sname}</td>
						<td><a class="title px-2" data-bno="${vo.bno}" style="cursor: pointer;">${vo.title}</a></td>
						<td class="text-center">${vo.userId}</td>
						<td class="text-center">
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
					<button type="button" name="writeBtn" class="btn btn-outline-success right"
						onclick="location.href='${pageContext.request.contextPath}/board/write'">글쓰기</button>
				</div>
			</nav>

			<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
			<input type="hidden" name="cpp" value="${pc.paging.cpp}">
		</form>

	</div>

	<!-- 모달 -->
	<div class="modal fade" id="detailModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
                    <h5 class="modal-title px-3">
                       	글 상세보기
                    </h5>
                </div>
				<div class="modal-body row">
					<%-- <div class="modal-img col-sm-8 col-xs-6">
						<img src="${pageContext.request.contextPath}/img/img_ready.png" id="Img" width="100%">
					</div> --%>
					<div class="modal-con col-sm-12 col-xs-6">
						<div class="modal-inner">
							<div class="modal-body">
								<div class="profile mb-1">
									<img src="${pageContext.request.contextPath}/img/profile.png">
								</div>
								<div class="title">
									<p id="writer">작성자</p><br>
									<small id="writedate">작성시간</small>
									<hr>
									<h2 class="fs-5">제목</h2><br>
									<p id="inner-title">제목</p>
									<hr>
								</div>
								<div class="content">
									<h2 class="fs-5">내용</h2><br>
									<p id="content">Lorem ipsum dolor sit amet, consectetur
										adipiscing elit. Aliquam vulputate elit libero, quis mattis
										enim tincidunt non. Mauris consequat ante vel urna posuere
										consequat.</p>
									<hr>
									<h2 class="fs-5">관련링크</h2><br> <a id="placeurl" href="#"><small>링크가
										나오는 칸이야</small></a>
								</div>
								<hr>
								<div class="inner-address">
									<br><h2 class="fs-5">주소</h2><br> <span id="addrZipNum" class="mb-2"><small>우편번호가
											나오는 칸이야</small></span><br> <span id="addrBasic"><small>기본주소가
											나오는 칸이야</small></span> <span id="addrDetail"><small>상세주소가 나오는
											칸이야</small></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
                    <h5>
                        &nbsp;
                    </h5>
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
        document.getElementById('writer').textContent = data.userId;
        document.getElementById('inner-title').textContent = data.title;
        document.getElementById('writedate').textContent = data.writeDate[0]+"년 "+ data.writeDate[1]+"월 "+ data.writeDate[2]+"일 "+ data.writeDate[3]+"시 "+ data.writeDate[4]+"분";
        console.log(data.writeDate);
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