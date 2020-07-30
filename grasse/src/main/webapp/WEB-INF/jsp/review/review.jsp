<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	var action = "";
	var url = "";
	var type = "";
	var itemno = 0;

	$(document).ready(function() {
		// 리뷰쓰기 버튼 클릭
		$("#writeBtn").on("click", function() {
			action = "create";
			type = "POST";
			$("#modal-title").text("리뷰쓰기");
			$("#modalSubmit").text("작성하기");
			$("#reviewModal").modal();
		});
	});
</script>

</head>
<body>
	<div class="container">
		<h4 class="text-center py-3">REVIEW</h4>

		<div class="table-responsive pt-3">
			<table class="table table-hover table-sm">
				<thead>
					<tr>
						<th>번호</th>
						<th>리뷰제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(reviewList)>0}">
							<c:forEach items="${reviewList}" var="row">
								<tr>
									<td>${row.REVIEW_NO}</td>
									<td><a data-toggle="modal" href="#reviewModal">${row.TITLE }</a></td>
									<td>${row.MEMBER_ID}</td>
									<td>${row.REGDATE}</td>

								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center py-5">상품 리뷰가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<jsp:include page="../review/write.jsp" />

		<div class="row pt-3">
			<div class="col col-lg-3"></div>
			<div class="col col-lg-6">
				<ul class="pagination justify-content-center">
					<li class="page-item disable"><a class="page-link text-dark"
						href="#">이전 </a></li>
					<li class="page-item active"><a class="page-link text-dark"
						href="#">1</a></li>
					<li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
					<li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
					<li class="page-item"><a class="page-link text-dark" href="#">4</a></li>
					<li class="page-item"><a class="page-link text-dark" href="#">5</a></li>
					<li class="page-item"><a class="page-link text-dark" href="#">다음
					</a></li>
				</ul>
			</div>
			<div class="col col-lg-3">
				<button id="writeBtn" type="button"
					class="btn btn-outline-dark my-2 my-sm-0" style="float: right;"
					data-toggle="modal" data-target="#reviewModal">리뷰쓰기</button>
			</div>
		</div>

	</div>
</body>

</html>