<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

		alert($("#modalSubmit").text());

		var ITEM_NO = $("#ITEM_NO").val();
				

		var aJson = {
				ITEM_NO : $("#ITEM_NO").val(),
				MEMBER_ID : $("#MEMBER_ID").val(),
				TITLE : $("#TITLE").val(),
				CONTENT : $("#CONTENT").val(),
				action : $("#modalSubmit").text()
		};

		alert(JSON.stringify(aJson));
		
		$("input[type=hidden][name=data]").val(JSON.stringify(aJson));

		document.frm.action = "/grasse/review/write.do";
/* */
	}
</script>

</head>

<!-- reviewModal -->
<div class="modal fade" id="reviewModal" role="dialog">
	<div class="modal-dialog modal-lg modal-dialog-center" role="document">

		<!-- Modal Content -->
		<div class="modal-content">
			<form id="frm" name="frm" method="POST" onsubmit="return check();">
			<input type="hidden" name="data" value="">
				<div class="modal-header">
					<h4 id="modal-title" class="modal-title mx-3"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body mx-3">

					<div class="row md-form mb-5">
						<label class="col col-sm-2">작성자</label> <input type="text"
							id="MEMBER_ID" name="MEMBER_ID" value="${data.MEMBER_ID }" class="col col-sm-10 form-control">
						
					</div>

					<div class="row md-form mb-5">
						<label class="col col-sm-2">리뷰 제목</label> <input type="text"
							id="TITLE" name="TITLE" value="${data.TITLE }" class="col col-sm-10 form-control">
					</div>

					<div class="row md-form mb-5">
						<label class="col col-sm-2">리뷰 내용</label>
						<textarea rows="15" id="CONTENT" name="CONTENT" value="${data.CONTENT }"
							class="col col-sm-10 form-control"></textarea>
					</div>

				</div>
				<div class="modal-footer">
					<button id="modalSubmit" type="submit" class="btn btn-deep-orange"></button>
					<input type="hidden" id="ITEM_NO" name="ITEM_NO" value="${map.ITEM_NO}">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>

	</div>
</div>