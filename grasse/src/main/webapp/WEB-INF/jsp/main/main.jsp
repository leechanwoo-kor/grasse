<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
	<div id="content">

		<!--Carousel Wrapper-->
		<div id="carousel-example-1z"
			class="carousel slide carousel-fade mb-3" data-ride="carousel"
			style="width: 100%;">
			<!--Indicators-->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-1z" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-1z" data-slide-to="1"></li>
				<li data-target="#carousel-example-1z" data-slide-to="2"></li>
			</ol>
			<!--/.Indicators-->
			<!--Slides-->
			<div class="carousel-inner" role="listbox">
				<!--First slide-->
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="https://mdbootstrap.com/img/Photos/Slides/img%20(141).jpg"
						alt="First slide">
				</div>
				<!--/First slide-->
				<!--Second slide-->
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://mdbootstrap.com/img/Photos/Slides/img%20(136).jpg"
						alt="Second slide">
				</div>
				<!--/Second slide-->
				<!--Third slide-->
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://mdbootstrap.com/img/Photos/Slides/img%20(137).jpg"
						alt="Third slide">
				</div>
				<!--/Third slide-->
			</div>
			<!--/.Slides-->
			<!--Controls-->
			<a class="carousel-control-prev" href="#carousel-example-1z"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carousel-example-1z"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
			<!--/.Controls-->
		</div>
		<!--/.Carousel Wrapper-->

		<!-- 
		banner
		<div>
			<div class="slide_banner">slide banner</div>
			<div class="side_banner">side_banner</div>
		</div>
 -->

		<!-- New Arrivals -->
		<div>
			<h4 class="text-center py-3">New Arrivals</h4>
			<div class="row">
				<c:forEach items="${newItem }" var="nrow">
					<!-- Grid col -->
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<div class="card">
								<a href="/grasse/itemDetail/item.do?ITEM_NO=${nrow.ITEM_NO }">
									<img class="card-img-top img-thumbnail"
									src="${nrow.THUMBNAIL }" alt="">
								</a>
							</div>
							<div class="card-body">
								<h5 class="card-title text-center" style="height: 30px;">
									<a class="text-dark"
										href="/grasse/itemDetail/item.do?ITEM_NO=${nrow.ITEM_NO }">${nrow.NAME }</a>
								</h5>
								<%-- <p class="card-text text-center">${row.CONTENT }</p> --%>
							</div>
							<div class="card-footer">
								<h6 class="text-center">${nrow.PRICE }KRW</h6>
							</div>
						</div>
					</div>
					<!-- Grid col -->
				</c:forEach>
			</div>
		</div>

		<!-- Best Items -->
		<div>
			<h4 class="text-center py-3">Best Items</h4>
			<div class="row">
				<c:forEach items="${bestItem }" var="brow">
					<!-- Grid col -->
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<a href="/grasse/itemDetail/item.do?ITEM_NO=${brow.ITEM_NO }">
								<img class="card-img-top img-thumbnail" src="${brow.THUMBNAIL }"
								alt="">
							</a>

							<div class="card-body">
								<h5 class="card-title text-center" style="height: 30px;">
									<a class="text-dark"
										href="/grasse/itemDetail/item.do?ITEM_NO=${brow.ITEM_NO }">${brow.NAME }</a>
								</h5>
								<%-- <p class="card-text text-center">${row.CONTENT }</p> --%>
							</div>
							<div class="card-footer">
								<h6 class="text-center">${brow.PRICE }KRW</h6>
							</div>
						</div>
					</div>
					<!-- Grid col -->
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>