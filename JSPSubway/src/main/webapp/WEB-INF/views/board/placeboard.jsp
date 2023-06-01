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

    <!-- custom css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/placeboard.css">

    <!-- bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

	<!-- header -->
	<%@ include file="../../include/header.jsp" %>
	
	<div class="wrapper">

        <div class="titlebox">
            <p>명소 추천 게시판</p>
        </div>
        <hr>


        <table class="table">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th>제목[댓글수]</th>
                    <th>역명</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="##">
                    <tr>
                        <td>
                            번호
                        </td>
                        <td>
                            <a href="##" id="title">제목</a>
                        </td>
                        <td>
                            역명
                        </td>
                        <td>
                            작성자
                        </td>
                        <td>
                            등록일<fmt:parseDate value="##" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                            <fmt:formatDate value="##" pattern="yyyy년 MM월 dd일 HH시 mm분" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            
        </table>
        <hr>

        <!-- 페이지 네이션 -->
        
        <form action="${pageContext.request.contextPath}/###/###" name="pageForm">
            <nav aria-label="Page navigation example">
                <ul id="pagination" class="pagination">
                    <c:if test="${pc.prev}"> <!-- true면 이전버튼 보이고 false면 안보임 -->
                        <li class="page-item" data-pagenum="${pc.beginPage-1}"> <!-- 이전 버튼-->
                            <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                        <li class="${pc.paging.pageNum == num ? 'active' : ''}"><a class="page-link" href="#">1</a></li>
                    </c:forEach>
                    <c:if test="${pc.next}">
                        <li class="page-item" data-pagenum="${pc.endPage+1}"> <!-- 다음 버튼-->
                            <a class="page-link" data-pagenum="${num}" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
                <div class="cbtn">
                    <button type="button" class="btn btn-outline-success right" onclick="location.href='${pageContext.request.contextPath}/##/##'">글쓰기</button>
                </div>
            </nav>

            <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
            <input type="hidden" name="cpp" value="${pc.paging.cpp}">
            <input type="hidden" name="keyword" value="${pc.paging.keyword}">
            <input type="hidden" name="condition" value="${pc.paging.condition}">

        </form>
        
        <div id="contentDiv">

        </div>

    </div>
	
	
	<!-- footer -->
	<%@ include file="../../include/footer.jsp" %>
	
	
	<!-- Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>