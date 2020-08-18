<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="../resources/ckeditor/ckeditor.js"></script>

<script>
	function check() {

		var form = document.frm;

		if (frm.TITLE.value == "") {
			alert("제목을 작성해주십시오.");
			frm.NAME.focus();
			return false;
		}
		if (frm.CATEGORY.value == "-1") {
			alert("분류를 선택해주십시오.");
			frm.CATEGORY.focus();
			return false;
		}
		if (frm.CONTENT.value == "") {
			alert("내용을 작성해주십시오.");
			frm.CONTENT.focus();
			return false;
		}

		if (reg = true) {
			alert("FAQ가 수정되었습니다.");
		}

	}
</script>

</head>

<body>
	<div class="container">
		<main role="main" class="col-md-12 order-md-1"
			style="width: 60%; margin: 0px auto;">

			<div class="pt-5">
				<h2 class="text-center">FAQ 수정</h2>
			</div>

			<div class="dropdown-divider mb-3 py-3"></div>

			<form name="frm" action="/grasse/admin/faqUpdate.do" method="post"
				onsubmit="return check()">

				<input type="hidden" class="form-control" id="FAQ_NO" name="FAQ_NO"
					value="${faqInfo.FAQ_NO }">

				<div class="input-group form-group row mx-3">
					<div class="col-sm-8">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control" id="TITLE" name="TITLE"
								style="background-color: transparent;" value="${faqInfo.TITLE }">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="input-group"></div>
					</div>
				</div>

				<div class="input-group form-group row mx-3">
					<div class="col">
						<div class="input-group bg-light">
							<textarea class="form-control" id="CONTENT" name="CONTENT"
								rows="15" style="background-color: #ffffff;">${faqInfo.CONTENT }</textarea>
						</div>
					</div>
				</div>

				<div class="input-group form-group row mx-3">
					<div class="col-sm-4">
						<a href="/grasse/admin/faqList.do"
							class="btn btn-outline-secondary btn-sm btn-block">목록</a>
					</div>
					<div class="col-sm-4">
						<button type="submit"
							class="btn btn-outline-secondary btn-sm btn-block">수정</button>
					</div>
					<div class="col-sm-4">
						<button type="button" class="btn btn-danger btn-sm btn-block"
							data-toggle="modal" data-target="#confirmModal">삭제</button>
					</div>
				</div>

			</form>
		</main>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">공지사항 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						onclick="clickDel(frm)">삭제하기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소하기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		function clickDel(frm) {
			frm.action = "/grasse/admin/faqDelete.do";
			frm.method = "post";
			frm.submit();
		}
	</script>
</body>

</html>