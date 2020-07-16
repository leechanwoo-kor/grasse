<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<script type="text/javascript">
	$(document).ready(function() {
		if (${errCode == 1}) {
			alert("올바르지 않은 아이디 혹은 올바르지 않은 비밀번호입니다.");
		}
	});

	function checkIt() {
		if (!document.loginForm.id.value) {
			alert("아이디를 입력해주세요.");
			document.loginForm.id.focus();
			return false;
		}
		if (!document.loginForm.passwd.value) {
			alert("비밀번호를 입력해주세요.");
			document.loginForm.passwd.focus();
			return false;
		}
	}
	function clearText(txt) {
		if (txt.defaultValue == txt.value)
			txt.value = "";
	}
</script>
</head>

<body>

	<!-- 로긴폼 -->

	<div class="container" style="padding-top: 50px;">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form name="loginForm" action="login.do" method="post"
					onsubmit="return checkIt()">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="passwd" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">

					<div class="form-group">
						<input type="checkbox" id="idSave" value="T" name="idSave"
							style="font-size: 10px">아이디 저장 <input type="checkbox"
							id="autoLogin" value="T" name="autoLogin" style="font-size: 10px">자동
						로그인
					</div>


					<div class="form-group">!회원이 되시면 다양한 혜택이있습니다. !아직 회원이 아니시라면
						지금 바로 가입하세요.</div>

					<div class="form-group">
						<input type="button" name="join_btn"
							style="width: 160; font-family: 돋움; background-color: #000000; color: #FFFFFF">
						<a href="#this" class="btn" id="findId">아이디 찾기</a>
						<a href="#this" class="btn" id="findPw">비밀번호 찾기</a>
					</div>

					<p class="mt-5 mb-3 text-muted text-center">© 2020. GRASSE. All rights reserved.</p>
				</form>
			</div>
		</div>
	</div>

	<div id="footer">
		<div>office_logo</div>
		<div>office_address</div>
		<div>shopping_info</div>
		<div>copyright</div>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='main']").on("click", function(e) { //메인
				e.preventDefault();
				fn_main();
			}).trigger("create");

			$("a[name='join']").on("click", function(e) { //회원가입
				e.preventDefault();
				fn_join();
			}).trigger("create");

			$("a[name='login']").on("click", function(e) { //회원가입
				e.preventDefault();
				fn_login();
			}).trigger("create");
			$("#findId").on("click", function(e) { //아이디 찾기
				e.preventDefault();
				fn_openFindId();
			}).trigger("create");
			$("#findPw").on("click", function(e) { //비밀번호 찾기
				e.preventDefault();
				fn_openFindPw();
			}).trigger("create");
		});

		function fn_main() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main.do' />");
			comSubmit.submit();
		}
		function fn_join() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/join/joinForm.do' />");
			comSubmit.submit();
		}
		function fn_login() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/loginForm.do' />");
			comSubmit.submit();
		}
		function fn_openFindId() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/findId.do' />");
			comSubmit.submit();
		}
		function fn_openFindPw() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/findPw.do' />");
			comSubmit.submit();
		}
	</script>


</body>

</html>
