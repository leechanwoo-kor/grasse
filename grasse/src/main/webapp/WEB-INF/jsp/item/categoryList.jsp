<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
</head>

<body>

	<!-- 카테고리 상품 폼 -->

	<div class="container pt-5">

		<!-- Grid row -->
		<div class="row">
			<div class="col lg-8">
				<div class="row">
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<c:forEach items="${list }" var="row">
								<!-- Grid col -->
								<div class="col-lg-3 col-md-6 mb-4">
									<div class="card">
										<a href="/grasse/itemDetail/item.do?ITEM_NO=${row.ITEM_NO }">
											<img class="card-img-top" src="http://placehold.it/200x250"
											alt="">
										</a>
										<div class="card-body">
											<h5 class="card-title text-center">
												<a href="/grasse/itemDetail/item.do?ITEM_NO=${row.ITEM_NO }">${row.NAME }</a>
											</h5>
											<%-- <p class="card-text text-center">${row.CONTENT }</p> --%>
										</div>
										<div class="card-footer"><h6 class="text-center">${row.PRICE }</h6></div>
									</div>
								</div>
								<!-- Grid col -->
							</c:forEach>
						</c:when>

						<c:otherwise>
							<p class="text-center py-5">조회된 결과가 없습니다.</p>
						</c:otherwise>

					</c:choose>
				</div>
			</div>
		</div>
		<!-- Grid row -->

		<!-- Pagination -->
		<div>
			<ul class="pagination justify-content-center py-5">
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
	<!-- container -->

</body>

</html>
