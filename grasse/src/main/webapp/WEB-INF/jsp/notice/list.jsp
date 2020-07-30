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
<body style="padding-top: 100px">

	<div class="table-responsive px-5">

		<h2 class="py-3 text-center">공지사항</h2>
		
		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.NOTICE_NO }</td>
								<td>${row.CATEGORY }</td>
								<td>${row.TITLE }</td>
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



	<div>
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


</body>

</html>