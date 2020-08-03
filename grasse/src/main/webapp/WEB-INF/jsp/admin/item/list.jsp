<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.pagination>li>a:active, .pagination>li>a:hover {
	background-color: light;
}
</style>
</head>
<body>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<h2 class="py-5 text-center">상품 관리</h2>
		<div class="table-responsive pt-3">
			<table class="table table-hover table-sm">
				<thead>
					<tr class="text-center">
						<th style="width: 10%">상품번호</th>
						<th style="width: 25%">상품이름</th>
						<th style="width: 20%">가격</th>
						<th style="width: 20%">조회수</th>
						<th style="width: 25%">등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="row">
								<tr class="text-center">
									<td>${row.ITEM_NO }</td>
									<td>${row.NAME }</td>
									<td>${row.PRICE }</td>
									<td>${row.READCOUNT }</td>
									<td>${row.REGDATE }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center py-5">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>


		<div class="row pt-3">
			<div class="col col-lg-3">
				<a href="/grasse/admin/itemWriteForm.do"
					class="btn btn-outline-dark my-2 my-sm-0">글쓰기</a>
			</div>

			<!-- Pagination -->
			<div class="col col-lg-6 py-5">
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
			<!-- Pagination -->
		</div>

		<form class="form-inline justify-content-center my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				aria-label="검색어를 입력하세요.">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
		</form>

	</main>
</body>

</html>