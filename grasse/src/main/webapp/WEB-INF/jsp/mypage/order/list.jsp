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
		<h2 class="py-5 text-center">주문 조회</h2>
		<div class="dropdown-divider mb-3 py-3"></div>
		
		<div class="table-responsive pt-3 mx-auto" style="width: 80%;">
			<table class="table table-hover table-sm">
				<thead>
					<tr class="text-center">
						<th style="width: 20%">주문번호</th>
						<th style="width: 25%">상품이름</th>
						<th style="width: 30%">가격</th>
						<th style="width: 25%">등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="row">
								<tr class="text-center">
									<td>${row.ORDER_NO }</td>
									<td>상품이름</td>
									<td>${row.TOTALPRICE }</td>
									<td>${row.REGDATE }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center py-5 mx-auto">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

	</main>
</body>

</html>