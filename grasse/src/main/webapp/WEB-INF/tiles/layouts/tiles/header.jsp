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
			<a class="navbar-brand text-dark" href="/grasse/main.do" name="main">GRASSE</a>
			<a class="nav-link text-dark" href="/grasse/notice/noticeList.do"
				name="notice">NOTICE</a> <a class="nav-link text-dark"
				href="/grasse/faq/faqList.do" name="faq">FAQ</a> <a
				class="nav-link text-dark" href="/grasse/qna/qnaList.do" name="qna">QNA</a>

			<button class="navbar-toggler collapsed" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<c:if test="${sessionScope.member == null }">
						<li><a class="nav-link text-dark"
							href="/grasse/login/loginForm.do" name="login">LOGIN</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/join/joinForm.do" name="join">JOIN</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/login/loginForm.do" name="mypage">MYPAGE</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/login/loginForm.do" name="order">ORDER</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/login/loginForm.do" name="cart">SHOPPING CART</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/login/loginForm.do" name="wishlist">WISH LIST</a></li>
					</c:if>
					<c:if test="${sessionScope.member != null }">
						<li><a class="nav-link text-dark"
							href="/grasse/login/logout.do" name="logout">LOGOUT</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/mypage/memberList.do" name="mypage">MYPAGE</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/mypage/orderList.do" name="order">ORDER</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/mypage/cartList.do" name="cart">SHOPPING CART</a></li>
						<li><a class="nav-link text-dark"
							href="/grasse/mypage/wishList.do" name="wishlist">WISH LIST</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
	<!-- end nav -->

</body>

</html>