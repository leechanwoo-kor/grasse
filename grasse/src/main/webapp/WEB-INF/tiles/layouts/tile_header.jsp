<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
		<!-- start nav -->
		<div class="container">
			<a class="navbar-brand text-dark" href="#" name="main">GRASSE</a> <a
				class="nav-link text-dark" href="#" name="notice">NOTICE</a> <a
				class="nav-link text-dark" href="#" name="faq">FAQ</a> <a class="nav-link text-dark"
				href="#" name="qna">QNA</a>

			<button class="navbar-toggler collapsed" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:if test="${sessionScope.member == null }">
						<li><a class="nav-link text-dark" href="#" name="login">LOGIN</a></li>
						<li><a class="nav-link text-dark" href="#" name="join">JOIN</a></li>
					</c:if>
					<c:if test="${sessionScope.member != null }">
						<li><a class="nav-link text-dark" href="#" name="logout">LOGOUT</a></li>
					</c:if>
					<li><a class="nav-link text-dark" href="#" name="mypage">MYPAGE</a></li>
					<li><a class="nav-link text-dark" href="#" name="cart">SHOPPING CART</a></li>
					<li><a class="nav-link text-dark" href="#" name="order">ORDER</a></li>
					<li><a class="nav-link text-dark" href="#" name="wishlist">WISH LIST</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- end nav -->
	
</body>
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

		$("a[name='logout']").on("click", function(e) { //회원가입
			e.preventDefault();
			fn_logout();
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
	function fn_logout() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login/logout.do' />");
		comSubmit.submit();
	}

</script>
</html>