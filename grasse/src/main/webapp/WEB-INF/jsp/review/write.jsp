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

		if (action == "create") {
			ITEM_NO = $
			{
				ITEM_NO
			}
			;
			url = "/review.do";
		} else if (action == "modify") {
			url = "/review.do";
		}

		var data = {
			"ITEM_NO" : ITEM_NO,
			"MEMBER_ID" : $('#MEMBER_ID').val(),
			"TITLE" : $('#TITLE').val(),
			"CONTENT" : $('#CONTENT').val()
		};

		$.ajax({
			url : url,
			type : type,
			data : data,
			success : function(data) {
				$('reviewModal').modal('toggle');
			},
			complete : function(data) {
				location.reload();
			}
		});
	}
</script>

</head>

<!-- reviewModal -->
<div class="modal fade" id="reviewModal" role="dialog">
	<div class="modal-dialog modal-lg modal-dialog-center" role="document">

		<!-- Modal Content -->
		<div class="modal-content">
			<form id="frm" name="frm" onsubmit="return check()">
				<div class="modal-header">
					<h4 id="modal-title" class="modal-title mx-3"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body mx-3">

					<div class="row md-form mb-5">
						<label class="col col-sm-2">작성자</label> <input type="text"
							id="MEMBER_ID" class="col col-sm-10 form-control">
					</div>

					<div class="row md-form mb-5">
						<label class="col col-sm-2">리뷰 제목</label> <input type="text"
							id="TITLE" class="col col-sm-10 form-control">
					</div>

					<div class="row md-form mb-5">
						<label class="col col-sm-2">리뷰 내용</label>
						<textarea rows="15" id="CONTENT"
							class="col col-sm-10 form-control"></textarea>
					</div>

				</div>
				<div class="modal-footer">
					<button id="modalSubmit" type="submit" class="btn btn-deep-orange"></button>
					<input type="hidden" name="ITEM_NO" value="${ITEM_NO}">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>

	</div>
</div>