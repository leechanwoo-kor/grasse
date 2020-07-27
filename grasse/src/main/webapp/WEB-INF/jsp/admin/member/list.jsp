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
		<h2 class="py-3">회원 관리</h2>
		
		<div class="table-responsive pt-3">
			<table class="table table-hover table-sm">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>회원ID</th>
						<th>회원이름</th>
						<th>포인트</th>
						<th>가입날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="row">
								<tr>
									<td>${row.MEMBER_NO }</td>
									<td>${row.MEMBER_ID }</td>
									<td>${row.NAME }</td>
									<td>${row.POINT }</td>
									<td>${row.REGDATE }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div class="text-center py-3">
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
	</main>
</body>

</html>