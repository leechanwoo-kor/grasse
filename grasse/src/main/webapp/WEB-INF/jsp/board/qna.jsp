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

	<div class="table-responsive px-5">

		<h2 class="py-3 text-center">QNA</h2>

		<table class="table table-bordered table-sm">
			<thead>
				<tr class="text-center">
					<th style="width: 10%">번호</th>
					<th style="width: 50%">분류</th>
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
								<td><a href="/grasse/qna/qnaDetail.do?QNA_NO=${row.QNA_NO}"
									class="text-dark">${row.TITLE }</a></td>
								<td>${row.MEMBER_ID }</td>
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

	<div align="center" class="container pt-5" id="paging">
		${QnaListPaging.pagingHTML}</div>


</body>

</html>