<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="../resources/ckeditor/ckeditor.js"></script>

</head>

<body>
	<div class="container">
		<main role="main" class="col-md-12 order-md-1"
			style="width: 60%; margin: 0px auto;">

			<div class="pt-5">
				<h2 class="text-center">공지사항</h2>
			</div>

			<div class="dropdown-divider mb-3 py-3"></div>

			<form name="frm" action="/grasse/admin/noticeWrite.do" method="post"
				onsubmit="return check()">

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

				<div class="input-group form-group row mx-3">
					<div class="col-sm-4">
						<a href="/grasse/admin/noticeList.do"
							class="btn btn-outline-secondary btn-sm btn-block">목록</a>
					</div>
					<div class="col-sm-4">
						<a href="/grasse/admin/noticeList.do"
							class="btn btn-outline-success btn-sm btn-block">수정</a>
					</div>
					<div class="col-sm-4">
						<button type="button" class="btn btn-danger btn-sm btn-block"
							data-toggle="modal" data-target="#confirmModal">삭제</button>
					</div>
				</div>

			</form>
		</main>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">공지사항 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						onclick="clickDel(frm)">삭제하기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소하기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		function clickDel(frm) {
			frm.action = "/grasse/admin/noticeDelete.do";
			frm.method = "post";
			frm.submit();
		}
	</script>
</body>

</html>