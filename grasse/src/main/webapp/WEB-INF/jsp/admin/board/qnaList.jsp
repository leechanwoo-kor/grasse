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
		<h2 class="py-5 text-center">QNA 관리</h2>

		<div class="table-responsive pt-3 mx-auto"
			style="width: 80%; margin: 0px auto;">
			<table class="table table-hover table-sm">
				<thead>
					<tr class="text-center">
						<th style="width: 10%">번호</th>
						<th style="width: 50%">제목</th>
						<th style="width: 20%">작성자</th>
						<th style="width: 20%">작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="row">
								<tr class="text-center">
									<td>${row.QNA_NO }</td>
									<td><a
										href="/grasse/admin/qnaDetail.do?QNA_NO=${row.QNA_NO }"
										class="text-dark">${row.TITLE }</a></td>
									<td>${row.MEMBER_ID }</td>
									<td>${row.REGDATE }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="text-center py-5">조회된 결과가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<div class="row pt-3" style="width: 100%;">
				<div class="col col-lg-3"></div>
				<div class="col col-lg-6">
					<!-- Pagination -->
					${AdminQnaListPaging.pagingHTML}
					<!-- Pagination -->
				</div>
			</div>
		</div>



	</main>
</body>

</html>