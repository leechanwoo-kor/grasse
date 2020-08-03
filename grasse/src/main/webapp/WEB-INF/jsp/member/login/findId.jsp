<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='NAME']").focus();
	});

	function id_search() { //이름,이메일로 '찾기' 버튼

		var frm = document.idfindscreen;

		if (frm.NAME.value.length < 1) {
			alert("이름을 입력해주세요");
			return false;
		}
		if (frm.EMAIL.value.length < 1 || frm.E_DOMAIN.value.length < 1) {
			alert("이메일을 입력해주세요");
			return false;
		}

		return true;
	}

	function checkid() {
		var frm = document.idfindscreen;
		var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';
		if (!regExp.test(frm.EMAIL.value)) {
			alert('올바른 email을 입력해주세요.');
			frm.EMAIL.focus();
		}
	}

	function domainCheck() {
		var frm = document.idfindscreen;

		if (frm.DOAMIN.value == 0) {
			frm.E_DOMAIN.value = "";
			frm.E_DOMAIN.disabled = false;
		} else {
			frm.E_DOMAIN.disabled = true;
			var value = frm.DOAMIN.value;
			frm.E_DOMAIN.value = frm.DOAMIN.value;
			frm.E_DOMAIN.val(value);

		}
	}
</script>
</head>

<body>
	<form class="form-compact" name="idfindscreen" action="findIdResult.do"
		method="post" onsubmit="return id_search()">
		<div class="row py-5">
			<div class="container col-4">
				<div class="row">
					<h4 class="text-center col-12 mb-0 font-weight-bold">아이디 찾기</h4>
				</div>
				<div class="dropdown-divider mb-3"></div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">이름</label>
					<div class="col-6">
						<input id="NAME" name="NAME" type="text"
							class="form-control form-control-sm">
					</div>
				</div>

				<div class="form-group row align-items-center">
					<label class="col-3 col-form-label-sm text-right">email</label>
					<div class="col-3">
						<input id="EMAIL" name="EMAIL" type="text"
							class="form-control form-control-sm">
					</div>
					<p>@</p>
					<div class="col-3">
						<input id="E_DOMAIN" name="E_DOMAIN" type="text"
							class="form-control form-control-sm">
					</div>
				</div>

				<div class="input-group form-group row pt-3">
					<div class="col-sm">
						<button class="btn btn-secondary btn-sm btn-block" type="submit">찾기</button>
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