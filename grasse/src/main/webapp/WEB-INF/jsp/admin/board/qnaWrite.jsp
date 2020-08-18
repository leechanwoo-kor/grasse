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
		
		if(reg=true){
			alert("QNA가 작성되었습니다.");
		}

	}
</script>

</head>

<body>
	<div class="container">
		<main role="main" class="col-md-12 order-md-1"
			style="width: 60%; margin: 0px auto;">

			<div class="pt-5">
				<h2 class="text-center">QNA 작성</h2>
			</div>

			<div class="dropdown-divider mb-3 py-3"></div>

			<form name="frm" action="/grasse/admin/qnaWrite.do" method="post"
				onsubmit="return check()">

				<div class="input-group form-group row mx-3">
					<div class="col-sm-8">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control" id="TITLE" name="TITLE">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="input-group">
							<select class="custom-select" id="CATEGORY" name="CATEGORY">
								<option selected value="-1">-----분류-----</option>
								<option value="0">주문 전화</option>
								<option value="1">배송관련</option>
								<option value="2">포인트 제도</option>
								<option value="3">샘플 안내</option>
								<option value="4">회원관리</option>
							</select>
						</div>
					</div>
				</div>

				<div class="input-group form-group row mx-3">
					<div class="col">
						<div class="input-group">
							<textarea class="form-control" id="CONTENT" name="CONTENT"
								rows="15"></textarea>
						</div>
					</div>
				</div>

				<div class="input-group form-group row mx-3">
					<div class="col">
						<a href="/grasse/admin/qnaList.do"
							class="btn btn-outline-secondary btn-sm btn-block">뒤로</a>
					</div>
					<div class="col">
						<button type="submit"
							class="btn btn-outline-secondary btn-sm btn-block">작성</button>
					</div>
				</div>

			</form>
		</main>
	</div>
</body>

</html>