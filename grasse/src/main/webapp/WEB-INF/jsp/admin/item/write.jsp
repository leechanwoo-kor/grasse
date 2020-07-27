<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="/resources/ckeditor/ckeditor.js"></script>
</head>

<body>

	<script>
		function check() {
			// 태그를 name으로 조회할 경우
			//var product_name=document.form1.product_name.value;
			// 태그를 id로 조회할 경우
			var product_name = $("#product_name").val();
			var price = $("#price").val();
			var description = $("#description").val();
			if (product_name == "") { //빈값이면
				alert("상품이름을 입력하세요");
				$("#product_name").focus(); //입력포커스 이동
				return false; //함수 종료, 폼 데이터를 제출하지 않음
			}
			if (price == "") {
				alert("가격을 입력하세요");
				$("#price").focus();
				return false;
			}
			/*     if(description==""){
			 alert("상품 설명을 입력하세요");
			 $("#description").focus();
			 return;
			 } */
			//폼 데이터를 받을 주소
			document.form1.action = "${path}/shop/product/insert.do";
			//폼 데이터를 서버에 전송
			document.form1.submit();

			return true;
		}
	</script>

	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<h2 class="py-3">상품 등록</h2>

		<form name="form1" method="post" enctype="multipart/form-data"
			onsubmit="return check()">
			<table>
				<tr>
					<td>상품명</td>
					<td><input name="product_name" id="product_name"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input name="price" id="price"></td>
				</tr>
				<tr>
					<td>상품설명</td>
					<td><textarea rows="5" cols="60" name="description"
							id="description"></textarea> <script>
								//위쪽과 마찬가지로 같은페이지에서 스마트에디터를 동시에 2개를 사용할 수 없으므로 주석처리 한다.
								//id가 description인 태그에 ckeditor를 적용시킴
								//CKEDITOR.replace("description"); //이미지 업로드 안됨
								/* CKEDITOR.replace("description",{
								 filebrowserUploadUrl : "${path}/imageUpload.do"
								 }); */
							</script></td>
				</tr>
				<tr>
					<td>상품이미지</td>
					<td><input type="file" name="file1" id="file1"></td>
				</tr>
			</table>

			<div class="row py-5 justify-content-center">
				<div class="col">
					<a href="/grasse/admin/itemList.do"
						class="btn btn-outline-dark my-2 my-sm-0">목록으로</a>
				</div>
				<div class="col">
					<button class="btn btn-outline-dark my-2 my-sm-0" type="submit">작성하기</button>
				</div>
			</div>
		</form>
	</main>
</body>

</html>