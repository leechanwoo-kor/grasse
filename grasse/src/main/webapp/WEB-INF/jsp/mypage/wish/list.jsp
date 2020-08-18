<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<meta charset="UTF-8">
<title>내 위시 리스트</title>
</head>
<style>
.pagination>li>a:active, .pagination>li>a:hover {
	background-color: light;
}
</style>

<body>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<h2 class="py-5 text-center">찜목록</h2>
		<div class="dropdown-divider mb-3 py-3"></div>

		<div class="table-responsive pt-3 mx-auto" style="width: 80%;">
		<form name="form" id="form" method="post">
			<table class="table table-hover table-sm">
				<thead>
					<tr class="text-center">
						<th style="width: 20%">상품 번호</th>
						<th style="width: 30%">상품명</th>
						<th style="width: 30%">이미지</th>
						<th style="width: 20%">삭제</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:choose>
						<c:when test="${fn:length(wishList)>0}">
							<c:forEach items="${wishList}" var="item">
								<tr align="center">
									<td>${item.ITEM_NO}</td>
									<td><a class="text-dark"
										href="<c:url value='/itemDetail/item.do?ITEM_NO=${item.ITEM_NO}'/>">
											<input type="image" src="${item.THUMBNAIL}" width=100px
											height=100px></a></td>
									<td><a
										href="<c:url value='/itemDetail/item.do?ITEM_NO=${item.ITEM_NO}'/>">
											${item.NAME}
									</a></td>
									<td><input type="hidden" name="WISH_NO" value="${item.WISH_NO}"
										id="WISH_NO"> <a href="#this" class="text-danger"
										id="wishDel">삭제</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<td colspan="5" align="center">내 wishList에 상품이 없습니다.</td>
						</c:otherwise>
					</c:choose>
				</tbody>

			</table>
			</form>
		</div>

		<script type="text/javascript">
			$(document).ready(function() {
				$("a.text-danger").on("click", function(e) { //wishlist에서 삭제하기
					var thisIdx = $("a.text-danger").index(this);
					var wishNo = $("input[name=WISH_NO]").eq(thisIdx).val();
					alert(wishNo);
					$("input[name=WISH_NO]").eq(thisIdx).val(wishNo);
					document.form.action="/grasse/myWish/myWishDelete.do";
					document.form.submit();
				});

			});

			function fn_wishDel() {
				var wishNo = $("#WISH_NO").val();
				var comSubmit = new ComSubmit(form);
				alert(wishNo);
				comSubmit.setUrl("/grasse/myWish/myWishDelete.do");
				alert(wishNo);
				comSubmit.addParam("WISH_NO", wishNo);
				alert(wishNo);
				comSubmit.submit();
			}
		</script>
	</main>
</body>
</html>