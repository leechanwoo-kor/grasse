<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<head>

<script type="text/javascript">
	function check() {
		if (!document.frm.MEMBER_ID.value) {
			alert("아이디 입력해주세요.");
			return false;
		}
		if (!document.frm.TITLE.value) {
			alert("제목을 입력해주세요.");
			return false;
		}
		if (!document.frm.CONTENT.value) {
			alert("리뷰 내용을 입력해주세요.");
			return false;
		}

	}
</script>
</head>

<body>
	<center>
		<form id="frm" name="frm">
			<table width="100%" align="center" border="0" cellspacing="0"
				cellpadding="1" colspan="1" class="board_top">
				<br />

				<tr>
					<td align="center" class="review">REVIEW</td>
				</tr>

			</table>



			<br /> <br />

			<table border="1" class="board_list2">
				<caption>리뷰 작성하기</caption>

				<tbody>

					<tr class="board_title2">
						<th scope="row" align="center">리뷰 제목</th>
						<td><input type="text" id="TITLE" name="TITLE" class="wdp_25"
							value=""></input></td>
					</tr>
					<tr>
						<th scope="row" align="center">리뷰 내용</th>
						<td class="CONTENT"><textarea rows="20" cols="100"
								id="CONTENT" name="CONTENT">
					</textarea></td>
					</tr>
					<c:if test="${ID != null }">
						<tr>
							<th scope="row">아이디</th>
							<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"
								class="wdp_25" value=""></input></td>
						</tr>
					</c:if>

					<c:if test="${ID == null }">
						<tr>
							<th scope="row" align="center">아이디</th>
							<td><input type="text" id="MEMBER_ID" name="MEMBER_ID"
								class="wdp_25" value=""></input></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<br> <br> <input type="file" name="file"> <br>
			<br>

			<table class="notice_button">
				<tr>
					<td><a href="#this" class="btn btn-default2" id="list">리뷰
							목록으로</a>
					<td><a href="#this" class="btn btn-default" id="write">작성하기
							<input type="hidden" name="ITEM_NO" value="${ITEM_NO}">
					</a></td>
				</tr>
			</table>
		</form>
	</center>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_List();
			});
			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_Write();
			});
		});

		/* 리스트로 이동 */
		function fn_List() {
			var ITEM_NO = "${ITEM_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/itemDetail/item.do'/>");
			comSubmit.addParam("ITEM_NO", ITEM_NO);
			comSubmit.submit();
		}
		/* 작성하기 */
		function fn_Write() {
			var ITEM_NO = "${ITEM_NO}";
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/review/write.do'/>");
			comSubmit.addParam("ITEM_NO", ITEM_NO);
			comSubmit.submit();
		}
	</script>
</body>
</html>