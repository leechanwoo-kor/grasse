<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>reviewDetail</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<!-- 목록으로 돌아가기 기능 + 리뷰삭제 기능-->
<script type="text/javascript">
		function fn_backTo() {
			var ITEM_NO="${map.ITEM_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/itemDetail/item.do'/>");
			comSubmit.addParam("ITEM_NO", ITEM_NO);
			comSubmit.submit();
		}
		function fn_reviewDel() {
			var ITEM_NO="${map.ITEM_NO}";
			var REVIEW_NO="${map.REVIEW_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/review/delete.do'/>");
			comSubmit.addParam("ITEM_NO", ITEM_NO);
			comSubmit.addParam("REVIEW_NO", REVIEW_NO);
			comSubmit.submit();
		}

		$(document).ready(function(){
		     $("#backTo").on("click", function(e){ //목록으로 버튼
				 e.preventDefault(); 
				 fn_backTo(); }); 
			 $("#reviewDel").on("click", function(e){ //삭제하기 버튼
				  e.preventDefault(); 
				  fn_reviewDel(); }); 
			  });
</script>
<!-- 회원 확인 기능 -->
<script type="text/javascript">
	function enroll() {
		var member_id =
<%=session.getAttribute("MEMBER_ID")%>
	if (member_id == null || member_id == "") {
			alert("회원만 사용 가능합니다");
			return false;
		}

	}
</script>

<!-- 댓글달기 -->
<script type="text/javascript">
	$(document).on('click', '#com_write', function() {
		var formData = $("#frm").serialize();
		$.ajax({
			url : '<c:url value="/review/writeComment.do"/>',
			type : 'POST',
			data : formData,
			dataType : "json",
			success : function(data) {
				location.reload();
			},
		});
	});
</script>

</head>
<body>
	<style>
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
}
</style>

	<div class="container">
		<table class="board_view" style="width: 100%;">
			<colgroup>
				<col width="10%" />
				<col width="25%" />
				<col width="10%" />
				<col width="25%" />
				<col width="10%" />
				<col width="20%" />
			</colgroup>

			<tbody>
				<tr>
					<th scope="row">리뷰 번호</th>
					<td>${map.REVIEW_NO}</td>
					<th scope="row">작성자 ID</th>
					<td>${map.MEMBER_ID}</td>
				</tr>
				<tr>
					<th scope="row">작성일</th>
					<td>${map.REGDATE}</td>
					<th scope="row">상품번호</th>
					<td>${map.ITEM_NO}</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="5">${map.TITLE}</td>
				</tr>
				<tr>
					<th scope="row">작성 내용</th>
					<td colspan="6">${map.CONTENT}</td>
				</tr>
			</tbody>
		</table>

		<p style="text-align: left;">
		<form id="frm" name="frm" action="delete.do" method="post"
			align="center">
		
		<a href="#this" class="btn btn-default" id="reviewDel">리뷰 삭제하기</a>
		</form>


		<form id="frm" name="frm" action="updateForm.do" method="post"
			onsubmit="return enroll();" align="left">
			<input type="hidden" name="REVIEW_NO" value="${map.REVIEW_NO}">
			<input id="review_UPDATE" class="reviewbtn" type="submit"
				value="리뷰 수정하기 ">
		</form>
		</p>


		<br>
		<br>

		<table width="50%" align="center" border="1" cellspacing="0"
			cellpadding="1" class="board_review3">

			<thead>
				<tr>
					<th><strong>comment 번호</strong></th>
					<th><strong>댓글 작성내용</strong></th>
					<th><strong>작성 아이디</strong></th>
					<th><strong>작성날짜</strong></th>
					<th><strong></strong></th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${fn:length(list)>0 }">
						<c:forEach items="${list}" var="com">
							<tr>
								<td>${com.REVIEW_COMMENT_NO}</td>
								<td>${com.CONTENT}</td>
								<td>${com.MEMBER_ID}</td>
								<td>${com.REGDATE}</td>
								<td>
									
								</td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<td colspan="5" align="center">작성된 댓글이 없습니다</td>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<form id="frm" action="writeComment.do" method="post" onsubmit="return enroll();">
			<table>
				<tbody>

					<tr>
						<td colspan="2"><textarea rows="5" cols="130"
								name="CO_CONTENT" onsubmit="return enroll();"></textarea>
							<p align="center">
								<input type="submit" id="com_write" class="btn1" value="댓글작성하기">
								<input type="hidden" name="ITEM_NO" value="${map.ITEM_NO}">
							</p></td>
						<th scope="row">댓글 작성 아이디</th>
						<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"
							class="wdp_25" value=""></input> <input type="hidden"
							id="REVIEW_ORIGIN_NO" name="REVIEW_ORIGIN_NO"
							value="${map.REVIEW_NO}"></input> <input type="hidden"
							id="REVIEW_NO" name="REVIEW_NO" value="${map.REVIEW_NO}"></input>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<a href="#this" class="btn" id="backTo">목록으로</a> 
	

</body>

</html>
