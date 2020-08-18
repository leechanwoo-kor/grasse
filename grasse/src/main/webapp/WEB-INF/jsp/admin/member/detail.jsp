<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="container">
		<div class="col-md-12 order-md-1"
			style="width: 60%; margin: 0px auto;">

			<div class="pt-5 text-center">
				<h2 class="text-center">회원정보 조회</h2>
			</div>

			<div class="dropdown-divider mb-3 py-3"></div>

			<form name="frm" action="/grasse/admin/memberDelete.do"
				method="post" onsubmit="return check()">

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">아이디</label>
					<div class="col-7">
						<input id="MEMBER_ID" name="MEMBER_ID" type="text"
							class="form-control form-control-sm"
							value="${memberInfo.MEMBER_ID }" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">이름</label>
					<div class="col-7">
						<input id="NAME" name="NAME" type="text"
							class="form-control form-control-sm" value="${memberInfo.NAME }"
							readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">생일</label>
					<div class="col-7">
						<input id="BIRTH" name="BIRTH" type="text"
							class="form-control form-control-sm" value="${memberInfo.BIRTH }"
							readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">주소</label>
					<div class="col-4">
						<input id="ZIPCODE" name="ZIPCODE" type="text"
							class="form-control form-control-sm"
							value="${memberInfo.ZIPCODE }" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right"></label>
					<div class="col-7 py-1">
						<input id="ADDR1" name="ADDR1" type="text"
							class="form-control form-control-sm" value="${memberInfo.ADDR1 }"
							readonly>
					</div>
					<label class="col-3 col-form-label-sm text-right"></label>
					<div class="col-7 py-1">
						<input id="ADDR2" name="ADDR2" type="text"
							class="form-control form-control-sm" value="${memberInfo.ADDR2 }" readonly>
					</div>
					<label class="col-3 col-form-label-sm text-right"></label>
					<div class="col-7 py-1">
						<input id="EXTRAADDR" name="EXTRAADDR" type="text"
							class="form-control form-control-sm"
							value="${memberInfo.EXTRAADDR }" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">휴대전화</label>
					<div class="col-7">
						<input id="PHONE" name="PHONE" type="text"
							class="form-control form-control-sm" value="${memberInfo.PHONE }" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">이메일</label>
					<div class="col-7">
						<input id="EMAIL" name="EMAIL" type="text"
							class="form-control form-control-sm" value="${memberInfo.EMAIL }" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">가입날짜</label>
					<div class="col-7">
						<input id="REGDATE" name="REGDATE" type="text"
							class="form-control form-control-sm"
							value="${memberInfo.REGDATE }" readonly>
					</div>
				</div>

				<div class="input-group form-group row pt-3">
					<div class="col-sm">
						<a href="/grasse/admin/memberList.do"
							class="btn btn-outline-dark btn-sm btn-block">뒤로</a>
					</div>
					<div class="col-sm">
						<button type="button" class="btn btn-danger btn-sm btn-block"
							data-toggle="modal" data-target="#confirmModal">회원정보 삭제</button>
					</div>
				</div>

			</form>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원정보 삭제</h5>
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
			frm.action = "/grasse/admin/memberDelete.do";
			frm.method = "post";
			frm.submit();
		}
	</script>
</body>


</html>