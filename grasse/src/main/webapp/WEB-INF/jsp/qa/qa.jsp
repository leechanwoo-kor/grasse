<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	//qa
	$(document).ready(function() {

		$("#qaWrite").click(function() {
			location.href = "/grasse/itemDetail/qaWriteForm.do";
		});
		$("a[name='qaTitle']").on("click", function(e) { //제목 
			e.preventDefault();
			fn_openQADetail($(this));
		});

	});

	function fn_openQADetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/itemDetail/qaDetail.do'/>");
		comSubmit.addParam("QA_NO", obj.parent().find("#QA_NO").val());
		comSubmit.submit();
	}
</script>


</head>

<body class="qa">
	<div class="container py-5">
		<div class="it-dt-qa">
			<h4 class="text-center py-3">Q&A</h4>

			<div class="table-responsive pt-3">
				<table class="table table-hover table-sm">
					<thead>
						<tr class="text-center">
							<th style="width: 10%">글번호</th>
							<th style="width: 50%">제목</th>
							<th style="width: 20%">작성자</th>
							<th style="width: 20%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(qaList)>0}">
								<c:forEach items="${qaList}" var="row">
									<tr class="text-center">
										<td>${row.QA_NO }</td>
										<td class="title"><a href="#this" name="qaTitle">${row.TITLE }</a>
											<input type="hidden" id="QA_NO" value="${row.QA_NO}"></td>
										<td>${row.MEMBER_ID }</td>
										<td>${row.REGDATE}</td>
									</tr>
									<input type="hidden" id="ITEM_NO" value="${row.ITEM_NO }">
									</td>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="text-center py-5">상품 문의가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<div class="row pt-3">
				<div class="col col-lg-3"></div>
				<div class="col col-lg-6">
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
				<div class="col col-lg-3">
					<button id="writeBtn" type="button"
						class="btn btn-outline-dark my-2 my-sm-0" style="float: right;"
						data-toggle="modal" data-target="#reviewModal">글 작성</button>
					<input type="hidden" name="ITEM_NO" value="${map.ITEM_NO}">
				</div>
			</div>

		</div>
	</div>
</body>
</html>