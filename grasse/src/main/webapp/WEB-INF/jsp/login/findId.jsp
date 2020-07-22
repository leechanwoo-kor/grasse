<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='name']").focus();
	});

	function id_search() { //이름,이메일로 '찾기' 버튼

		var frm = document.idfindscreen;

		if (frm.name.value.length < 1) {
			alert("이름을 입력해주세요");
			return false;
		}
		if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
			alert("이메일을 입력해주세요");
			return false;
		}

		return true;
	}

	function checkid() {
		var frm = document.idfindscreen;
		var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';
		if (!regExp.test(frm.email.value)) {
			alert('올바른 email을 입력해주세요.');
			frm.email.focus();
		}
	}

	function domainCheck() {
		var frm = document.idfindscreen;

		if (frm.domain.value == 0) {
			frm.e_domain.value = "";
			frm.e_domain.disabled = false;
		} else {
			frm.e_domain.disabled = true;
			var value = frm.domain.value;
			frm.e_domain.value = frm.domain.value;
			frm.e_domain.val(value);

		}
	}
</script>
</head>

<body>
	<form name="idfindscreen" action="findIdResult.do" method="post"
		onsubmit="return id_search()">
		<div class="jumbotron col-lg-6 col-md-6 mx-auto">
			<h4 class="text-center py-5 font-weight-bold">아이디 찾기</h4>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-2 col-form-label text-center">이름</div>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="name">
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
			</div>

			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-2 col-form-label text-center">e-mail</div>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="email"
						onblur="checkid()">
				</div>
				<p>@</p>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="e_domain">
				</div>
				<div class="col-sm-2"></div>
			</div>

			<div class="row pt-3">
				<div class="col m-5">
					<button class="btn btn-secondary btn-lg btn-block" type="submit">찾기</button>
				</div>
				<div class="col m-5">
					<a href="/grasse/main.do"
						class="btn btn-secondary btn-lg btn-block">취소</a>
				</div>
			</div>

		</div>
	</form>
</body>
</html>