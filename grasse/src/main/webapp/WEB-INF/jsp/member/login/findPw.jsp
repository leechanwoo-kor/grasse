<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='NAME']").focus();
	});

	function checkIt() {
		if (!document.frm.NAME.value) {
			alert("이름 항목은 필수 입력값입니다.");
			return false;
		}
		if (!document.frm.MEMBER_ID.value) {
			alert("아이디 항목은 필수 입력값입니다.");
			return false;
		}
		if (!document.frm.EMAIL.value) {
			alert("이메일을 입력하지 않았습니다.")
			return false;
		}
		return true;
	}
</script>
</head>

<body>
	<form class="form-compact" name="frm" action="changePw.do"
		method="post" onsubmit="return checkIt()">
		<div class="row py-5">
			<div class="container col-4">
				<div class="row">
					<h4 class="text-center col-12 mb-0 font-weight-bold">비밀번호 찾기</h4>
				</div>
				<div class="dropdown-divider mb-3"></div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">이름</label>
					<div class="col-7">
						<input id="NAME" name="NAME" type="text"
							class="form-control form-control-sm">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">아이디</label>
					<div class="col-7">
						<input id="MEMBER_ID" name="MEMBER_ID" type="text"
							class="form-control form-control-sm">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">이메일</label>
					<div class="col-7">
						<input id="EMAIL" name="EMAIL" type="text"
							class="form-control form-control-sm">
					</div>
				</div>

				<div class="input-group form-group row">
					<div class="col-sm">
						<button class="btn btn-secondary btn-sm btn-block" type="submit">비밀번호
							변경</button>
					</div>
					<div class="col-sm">
						<a href="/grasse/login/loginForm.do"
							class="btn btn-secondary btn-sm btn-block">취소</a>
					</div>
				</div>

			</div>
		</div>
	</form>

</body>

</html>