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
				<h2 class="text-center">공지사항</h2>
			</div>

			<div class="dropdown-divider mb-3 py-3"></div>

			<form name="frm" action="/grasse/admin/noticeUpdate.do" method="post"
				onsubmit="return check()">

				<input type="hidden" class="form-control" id="NOTICE_NO"
					name="NOTICE_NO" value="${noticeInfo.NOTICE_NO }">

				<div class="input-group form-group row mx-3">
					<div class="col-sm-8">
						<div class="input-group">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control" id="TITLE" name="TITLE"
								style="background-color: transparent;"
								value="${noticeInfo.TITLE }" readonly>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="input-group">
							<c:choose>
								<c:when test="${noticeInfo.CATEGORY==0 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="행사" readonly>
								</c:when>
								<c:when test="${noticeInfo.CATEGORY==1 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="휴가 일정" readonly>
								</c:when>
								<c:when test="${noticeInfo.CATEGORY==2 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="개인정보처리" readonly>
								</c:when>
								<c:when test="${noticeInfo.CATEGORY==3 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="긴급안내(코로나)" readonly>
								</c:when>
								<c:when test="${noticeInfo.CATEGORY==4 }">
									<input type="text" class="form-control" id="CATEGORY"
										name="CATEGORY" style="background-color: transparent;"
										value="결제 오류" readonly>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="input-group form-group row mx-3">
					<div class="col">
						<div class="input-group bg-light">
							<textarea class="form-control" id="CONTENT" name="CONTENT"
								rows="15" style="background-color: #ffffff;" readonly>${noticeInfo.CONTENT }</textarea>
						</div>
					</div>
				</div>

				<div class="input-group form-group row">
					<div class="col-sm-4 mx-auto">
						<a href="/grasse/notice/noticeList.do"
							class="btn btn-outline-secondary btn-sm btn-block">목록</a>
					</div>
				</div>

			</form>
		</main>
	</div>

</body>

</html>