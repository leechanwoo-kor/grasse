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
<body>
<div class="it-dt-qa">
			<br>
			<h4>Q&A</h4>
			<br>
			<table border="1" width="800px" align="center">
				<colgroup>
					<col width="5%" />
					<col width="25%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${fn:length(qaList)>0}">
							<c:forEach items="${qaList }" var="row">
								<tr>
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
								<td colspan="4" align="center">상품문의가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<button type="button" id="qaWrite" style="float: right;">문의하기</button>
		</div>
	</div>

</body>
</html>