<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
	<form id="frm">
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


			<div class="logo">
				<h4 id="logo">GRASSE</h4>
			</div>

			<!-- 
		<div class="hit_menu">
			<ul>
				<li><a href="#">hit4</a></li>
				<li><a href="#">hit3</a></li>
				<li><a href="#">hit2</a></li>
				<li><a href="#">hit1</a></li>
			</ul>
		</div>
 -->

			<div class="lnb">
				<ul>
					<li><a href="#">BEST</a></li>
					<li><a href="#">NEW</a></li>
					<li><a href="#">MAN</a></li>
					<li><a href="#">WOMAN</a></li>
					<li><a href="#">CONTAINER</a></li>
				</ul>
			</div>
		</div>

		<div id="content">
			<div class="section1">
				<div class="slide_banner">slide banner</div>
				<div class="side_banner">side_banner</div>
			</div>

			<div class="section2">
				<div class="hit_product">
					<ul>
						<li><a href="#">hit_product</a></li>
						<li><a href="#">hit_product</a></li>
						<li><a href="#">hit_product</a></li>
						<li><a href="#">hit_product</a></li>
					</ul>
				</div>
				<div class="md_product">
					<ul>
						<li><a href="#">md_product1</a></li>
						<li><a href="#">md_product2</a></li>
						<li><a href="#">md_product3</a></li>
						<li><a href="#">md_product4</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="footer">
			<div>office_logo</div>
			<div>office_address</div>
			<div>shopping_info</div>
			<div>
				<address>
					<strong>GRASSE, Inc.</strong><br> 795 Folsom Ave, Suite 600<br>
					San Francisco, CA 94107<br> <abbr title="Phone">P:</abbr>
					(123) 456-7890
				</address>

				<address>
					<strong>GRASSE</strong><br> <a href="mailto:#">grasse@example.com</a>
				</address>
			</div>
		</div>

	</form>

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
</body>
</html>