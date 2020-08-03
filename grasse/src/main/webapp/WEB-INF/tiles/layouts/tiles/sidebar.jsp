<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<nav id="sidebarMenu" style="min-height: 720px;"
		class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
		<div class="sidebar-sticky pt-3">

			<h5
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-dark">
				<span>마이페이지</span>
			</h5>

			<div class="dropdown-divider mb-3"></div>

			<ul class="nav flex-column mb-2">
				<li class="nav-item"><a class="nav-link text-dark"
					href="/grasse/mypage/memberList.do">회원정보</a></li>
				<li class="nav-item"><a class="nav-link text-dark"
					href="/grasse/mypage/orderList.do">주문내역</a></li>
				<li class="nav-item"><a class="nav-link text-dark"
					href="/grasse/mypage/cartList.do">장바구니</a></li>
				<li class="nav-item"><a class="nav-link text-dark"
					href="/grasse/mypage/wishList.do">찜목록</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>