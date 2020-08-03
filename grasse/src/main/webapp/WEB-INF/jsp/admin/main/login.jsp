<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='MEMBER_ID']").focus();
		
		if (${errCode == 1}) {
			alert("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}

		if (${errCode == 2}) {
			alert("관리자 계정이 아닙니다.");
		}
	});

	function checkIt() {
		if (!document.loginForm.MEMBER_ID.value) {
			alert("아이디를 입력해주세요.");
			document.loginForm.MEMBER_ID.focus();
			return false;
		}
		if (!document.loginForm.PASSWD.value) {
			alert("비밀번호를 입력해주세요.");
			document.loginForm.PASSWD.focus();
			return false;
		}
	}
	
	function clearText(txt) {
		if (txt.defaultValue == txt.value)
			txt.value = "";
	}

</script>

<style>
html, body {
	height: 100%;
}

.container {
	height: 100%;
	align-content: center;
}

.card {
	height: 370px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0, 0, 0, 0.5) !important;
}

.card-header h3 {
	color: white;
}

.input-group-prepend span {
	width: 50px;
	background-color: #FFC312;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.login_btn {
	color: black;
	background-color: #FFC312;
	width: 100px;
}

.login_btn:hover {
	color: black;
	background-color: white;
}
</style>


</head>

<body>

	<div class="container">
		<div class="d-flex justify-content-center h-100"
			style="padding-top: 80px;">
			<div class="card">
				<div class="card-header">
					<h3 class="text-center pt-3">관리자 로그인</h3>
				</div>
				<div class="card-body">
					<form name="loginForm" action="login.do" method="post"
						onsubmit="return checkIt()">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input name="MEMBER_ID" type="text" class="form-control"
								placeholder="username">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input name="PASSWD" type="password" class="form-control"
								placeholder="password">
						</div>
						<div class="form-group">
							<input type="submit" value="Login"
								class="btn float-right login_btn">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center text-light">© 2020.
						GRASSE. All rights reserved.</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>