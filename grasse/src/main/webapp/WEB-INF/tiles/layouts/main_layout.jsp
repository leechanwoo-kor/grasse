<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<style>
#header {
	top: 0;
	width: 100%;
	border: 0px red solid;
}

#body {
	width: 100%;
}

#menu{
	width: 100%;
}

#footer {
	width: 100%;
}
</style>
</head>

<body>
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="menu">
		<tiles:insertAttribute name="menu" />
	</div>
	<div id="body">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</body>

</html>
