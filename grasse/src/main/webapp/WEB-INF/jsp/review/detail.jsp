<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- reviewModal -->
<div class="modal fade" id="reviewModal" role="dialog">
	<div class="modal-dialog modal-lg modal-dialog-center" role="document">

		<!-- Modal Content -->
		<div class="modal-content">
			<form id="frm" name="frm" method="POST" onsubmit="return check()">
			<input type="hidden" name="data" value="">
				<div class="modal-header">
					<h4 id="modal-title" class="modal-title mx-3"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body mx-3">

					<div class="row md-form mb-5">
						<label class="col col-sm-2">작성자</label> <input type="text"
							id="MEMBER_ID" name="MEMBER_ID" value="" class="col col-sm-10 form-control">
						
					</div>

					<div class="row md-form mb-5">
						<label class="col col-sm-2">리뷰 제목</label> <input type="text"
							id="TITLE" name="TITLE" value="" class="col col-sm-10 form-control">
					</div>

					<div class="row md-form mb-5">
						<label class="col col-sm-2">리뷰 내용</label>
						<textarea rows="15" id="CONTENT" name="CONTENT" value=""
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