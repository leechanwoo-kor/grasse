<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="UTF-8">
<title>GRASSE :: Admin Page</title>
</head>
<body>
	<nav
		class="navbar navbar-light sticky-top bg-light flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3"
			href="/grasse/admin.do">GRASSE :: Admin Page</a>
		<!-- 
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
   -->
		<!-- 
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		 -->
		<ul class="navbar-nav px-3">
			<c:if test="${sessionScope.member == null }">
				<li class="nav-item text-nowrap mx-3"><a class="nav-link" href="/grasse/admin/loginForm.do">Log
						in</a></li>
			</c:if>
			<c:if test="${sessionScope.member != null }">
				<li class="nav-item text-nowrap mx-3"><a class="nav-link" href="/grasse/admin/logout.do">Log
						out</a></li>
			</c:if>
		</ul>
	</nav>
</body>
</html>