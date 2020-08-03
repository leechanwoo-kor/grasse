<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="../resources/ckeditor/ckeditor.js"></script>

</head>

<body>

	<script>
		function check() {

			var form = document.form;

			if (form.TITLE.value == "") {
				alert("제목을 작성해주십시오.");
				form.NAME.focus();
				return false;
			}
			if (form.CONTENT.value == "") {
				alert("내용을 작성해주십시오.");
				form.CONTENT.focus();
				return false;
			}
			if (form.MEMBER_ID.value == "") {
				alert("작성자를 작성해주십시오.");
				form.MEMBER_ID.focus();
				return false;
			}

		}
	</script>

	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<h2 class="py-3">공지사항 작성</h2>

		<form name="form" action="/grasse/admin/noticeWrite.do" method="post"
			onsubmit="return check()">

			<div class="row justify-content-md-center">
				<div class="col-sm-9">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text">제목</label>
						</div>
						<input type="text" class="form-control" id="TITLE" name="TITLE">
					</div>
				</div>
				<div class="col-sm-3">
					<div class="input-group mb-3">
						<select class="custom-select" id="CATEGORY" name="CATEGORY">
							<option selected>분류</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row justify-content-md-center">
				<div class="input-group mx-3 mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">작성자</span>
					</div>
					<input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID">
				</div>
			</div>

			<div class="row justify-content-md-center">
				<div class="col_c" style="margin-bottom: 30px">
					<div class="input-group">
						<textarea class="form-control" id="CONTENT" name="CONTENT"></textarea>
<!-- 
						<script type="text/javascript">
							var editorConfig = {
								filebrowserUploadUrl : "/admin/fileUpload.do", //이미지 업로드
							};

							CKEDITOR.replace('CONTENT', editorConfig, {
								height : 500
							});
						</script>
						 -->
					</div>
				</div>
			</div>

			<div class="row justify-content-md-center">
				<div class="col">
					<a href="/grasse/admin/noticeList.do"
						class="btn btn-outline-secondary"
						style="width: 20%; font-weight: bold">목록으로</a>
				</div>
				<div class="col">
					<button type="submit" class="btn btn-outline-secondary"
						style="width: 20%; font-weight: bold">등록</button>
				</div>
			</div>
		</form>
	</main>
</body>

</html>