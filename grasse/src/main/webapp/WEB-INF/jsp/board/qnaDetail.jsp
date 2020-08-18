<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

</head>

<body>
	<div class="container">
		<main role="main" class="col-md-12 order-md-1"
			style="width: 60%; margin: 0px auto;">

			<div class="pt-5">
				<h2 class="text-center">QNA</h2>
			</div>

			<div class="dropdown-divider mb-3 py-3"></div>

			<form name="frm" action="/grasse/admin/noticeUpdate.do" method="post"
				onsubmit="return check()">

				<input type="hidden" class="form-control" id="NOTICE_NO"
					name="NOTICE_NO" value="${qnaInfo.NOTICE_NO }">

				<div class="input-group form-group row mx-3">
					<div class="col-sm-8">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control" id="TITLE" name="TITLE"
								style="background-color: transparent;" value="${qnaInfo.TITLE }"
								readonly>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="input-group">
							<c:choose>
								<c:when test="${qnaInfo.CATEGORY==0 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="주문 전화" readonly>
								</c:when>
								<c:when test="${qnaInfo.CATEGORY==1 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="배송관련" readonly>
								</c:when>
								<c:when test="${qnaInfo.CATEGORY==2 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="포인트 제도" readonly>
								</c:when>
								<c:when test="${qnaInfo.CATEGORY==3 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="샘플 안내" readonly>
								</c:when>
								<c:when test="${qnaInfo.CATEGORY==4 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="회원관리" readonly>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="input-group form-group row mx-3">
					<div class="col">
						<div class="input-group bg-light">
							<textarea class="form-control" id="CONTENT" name="CONTENT"
								rows="15" style="background-color: #ffffff;" readonly>${qnaInfo.CONTENT }</textarea>
						</div>
					</div>
				</div>

				<div class="input-group form-group row">
					<div class="col-sm-4 mx-auto">
						<a href="/grasse/qna/qnaList.do"
							class="btn btn-outline-secondary btn-sm btn-block">목록</a>
					</div>
				</div>

			</form>
		</main>
	</div>

</body>

</html>