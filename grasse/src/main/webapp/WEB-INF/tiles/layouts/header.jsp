<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</script>
</html>