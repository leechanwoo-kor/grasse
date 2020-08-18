<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<!-- 
	<div style="max-height: 300px; overflow: hidden;">
		<img style="width: 100%; object-fit: contain;"
			src="https://images.unsplash.com/photo-1589204975097-53f274b1655e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" />
	</div>
	 -->
	<!-- https://images.unsplash.com/photo-1589204975097-53f274b1655e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80 -->

	<div class="logo" style="padding-top: 80px;">
		<h1 class="logo text-center display-1">GRASSE</h1>
	</div>

	<div class="hr py-3">
		<hr style="width: 80%; border: solid 1px black; margin: 0 auto">
	</div>

	<div class="menu">
		<div class="container">
			<div class="row">
				<div class="col-lg-1 col-md-1 mx-auto"></div>
				<div class="col-lg-2 col-md-2 mx-auto">
					<a class="col-md-2 text-dark text-center h5" href="#" name="best">BEST</a>
				</div>
				<div class="col-lg-2 col-md-2 mx-auto">
					<a class="col-md-2 text-dark text-center h5" href="#" name="new">NEW</a>
				</div>
				<div class="col-lg-2 col-md-2 mx-auto">
					<a class="col-md-2 text-dark text-center h5" href="#" name="man">MAN</a>
				</div>
				<div class="col-lg-2 col-md-2 mx-auto">
					<a class="col-md-2 text-dark text-center h5" href="#" name="woman">WOMAN</a>
				</div>
				<div class="col-lg-2 col-md-2 mx-auto">
					<a class="col-md-2 text-dark text-center h5" href="#"
						name="container">CONTAINER</a>
				</div>
				<div class="col-lg-1 col-md-1 mx-auto"></div>
			</div>
		</div>
	</div>

	<div class="hr py-3">
		<hr style="width: 80%; border: solid 1px black; margin: 0 auto">
	</div>

</body>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("a[name='best']").on("click", function(e) { // BEST
			e.preventDefault();
			fn_best();
		}).trigger("create");
		$("a[name='new']").on("click", function(e) { // NEW
			e.preventDefault();
			fn_new();
		}).trigger("create");
		$("a[name='man']").on("click", function(e) { // man
			e.preventDefault();
			fn_man();
		}).trigger("create");
		$("a[name='woman']").on("click", function(e) { // woman
			e.preventDefault();
			fn_woman();
		}).trigger("create");
		$("a[name='container']").on("click", function(e) { // container
			e.preventDefault();
			fn_container();
		}).trigger("create");
	});
	function fn_best() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/item/bestList.do' />");
		comSubmit.submit();
	}
	function fn_new() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/item/newList.do' />");
		comSubmit.submit();
	}
	function fn_man() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/item/categoryList.do?CATEGORY=M' />");
		comSubmit.submit();
	}
	function fn_woman() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/item/categoryList.do?CATEGORY=W' />");
		comSubmit.submit();
	}
	function fn_container() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/item/categoryList.do?CATEGORY=C' />");
		comSubmit.submit();
	}
</script>
