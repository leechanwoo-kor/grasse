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
		<h2 class="py-5 text-center">주문 관리</h2>
		<div class="dropdown-divider mb-3 py-3"></div>

		<div class="table-responsive mx-auto" style="width: 80%;">
			<table class="table table-hover table-sm">
				<thead>
					<tr class="text-center">
						<th style="width: 15%">주문번호</th>
						<th style="width: 25%">수령인 이름</th>
						<th style="width: 30%">총가격</th>
						<th style="width: 30%">주문날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="row">
								<tr class="text-center">
									<td>${row.ORDER_NO }</td>
									<td>${row.RECIPIENT_NAME }</td>
									<td>${row.TOTALPRICE }KRD</td>
									<td>${row.REGDATE }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="ty-5 text-center mx-auto">조회된 결과가
									없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<!-- Pagination -->
		${AdminOrderListPaging.pagingHTML}
		<!-- Pagination -->

	</main>
</body>

</html>