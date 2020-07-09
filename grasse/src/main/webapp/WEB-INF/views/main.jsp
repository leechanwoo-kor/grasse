<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GRASSE</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/content.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/footer.css" type="text/css" />
</head>
<body>
	<div id="header">
		<div class="gnb">
			<ul>
				<li><a href="#">GRASSE</a></li>
				<li><a href="#">NOTICE</a></li>
				<li><a href="#">FAQ</a></li>
				<li><a href="#">Q&A</a></li>
				<li><a href="#">LOGIN</a></li>
				<li><a href="#">JOIN</a></li>
				<li><a href="#">MYPAGE</a></li>
				<li><a href="#">SHOPPING CART</a></li>
				<li><a href="#">ORDER</a></li>
				<li><a href="#">WISH LIST</a></li>
			</ul>
		</div>
		<div class="logo">GRASSE</div>

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
		<div>copyright</div>
	</div>
</body>
</html>