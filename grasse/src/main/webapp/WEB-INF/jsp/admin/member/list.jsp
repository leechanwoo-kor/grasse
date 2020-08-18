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
		<h2 class="py-5 text-center">회원 관리</h2>

		<div class="table-responsive mx-auto" style="width: 80%;">
			<table class="table table-hover table-sm">
				<thead>
					<tr class="text-center">
						<th style="width: 10%">회원번호</th>
						<th style="width: 25%">회원ID</th>
						<th style="width: 20%">회원이름</th>
						<th style="width: 20%">포인트</th>
						<th style="width: 25%">가입날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="row">
								<tr class="text-center">
									<td>${row.MEMBER_NO }</td>
									<td><a
										href="/grasse/admin/memberDetail.do?MEMBER_ID=${row.MEMBER_ID }"
										class="text-dark">${row.MEMBER_ID }</a></td>
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

		<!-- Pagination -->
		<div align="center" class="container pt-5" id="paging">
			${AdminMemberListPaging.pagingHTML}</div>
		<!-- Pagination -->

	</main>
</body>

</html>