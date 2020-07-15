<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		var errCode = $
		{
			errCode
		}
		;
		if (errCode == 1) {
			alert("아이디와 비밀번호를 확인해주세요.");
			history.go(-1);
		}

		/* 
		var userInputId = getCookie("userInputId");

		if ($("#id").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			$("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}
		$("#idSave").change(function() { // 체크박스에 변화가 있다면,
			if ($("#idSave").is(":checked")) { // ID 저장하기 체크했을 때,
				var userInputId = $("#id").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId");
			}
		});
		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("#id").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#idSave").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				var userInputId = $("#id").val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}
		});
		 */

	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "=" + "; expires="
				+ expireDate.toGMTString();
	}
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookievalue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	function checkIt() {
		if (!document.loginForm.id.value) {
			alert("아이디를 입력해주세요.");
			document.myform.id.focus();
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

	<div id="header">
		<div class="gnb">
			<ul>
				<li id="home"><a href="#this" name="main">GRASSE</a></li>
				<li id="left"><a href="#">NOTICE</a></li>
				<li id="left"><a href="#">FAQ</a></li>
				<li id="left"><a href="#">Q&A</a></li>

				<li id="right"><a href="#">WISH LIST</a></li>
				<li id="right"><a href="#">ORDER</a></li>
				<li id="right"><a href="#">SHOPPING CART</a></li>
				<li id="right"><a href="#">MYPAGE</a></li>
				<li id="right"><a href="#this" name="join">JOIN</a></li>
				<li id="right"><a href="#this" name="login">LOGIN</a></li>
			</ul>
		</div>
	</div>

	<!-- 로긴폼 -->

	<div class="container">
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
						<input type="button" name="findId_btn" value="아이디찾기 "
							style="width: 170; font-family: 돋움; background-color: #FFFFFF">
						<a href="#this" class="btn" id="findPw">비밀번호 찾기</a>
					</div>
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
		function fn_openFindPw() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/login/findPw.do' />");
			comSubmit.submit();
		}
	</script>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>

</html>
