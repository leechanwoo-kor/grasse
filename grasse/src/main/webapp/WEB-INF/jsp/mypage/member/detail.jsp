<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.	
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("EXTRAADDR").value = extraAddr;
				} else {
					document.getElementById("EXTRAADDR").value = '';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("ZIPCODE").value = '';
				document.getElementById('ZIPCODE').value = data.zonecode;
				document.getElementById("ADDR1").value = '';
				document.getElementById("ADDR1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("ADDR2").value = '';
				document.getElementById("ADDR2").focus();
			}
		}).open();
	}
</script>

<script type="text/javascript">
	function check() {
		var frm = document.frm;

		if (frm.ZIPCODE.value == "") {
			alert("우편번호를 입력해주십시오.");
			frm.ZIPCODE.focus();
			return false;
		}
		if (frm.ADDR1.value == "") {
			alert("기본주소를 입력해주십시오.");
			frm.ADDR1.focus();
			return false;
		}
		if (frm.ADDR2.value == "") {
			alert("상세주소를 입력해주십시오.");
			frm.ADDR2.focus();
			return false;
		}
		if (frm.PHONE.value == "") {
			alert("핸드폰 번호를 입력해주십시오.");
			frm.PHONE.focus();
			return false;
		}
		if (frm.EMAIL.value == "") {
			alert("이메일주소를 입력해주십시오.");
			reg.EMAIL.focus();
			return false;
		}
		if (frm = true) {
			alert("회원정보 수정이 완료되었습니다.");
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-12 order-md-1"
			style="width: 60%; margin: 0px auto;">

			<div class="pt-5 text-center">
				<h2 class="text-center">회원정보 수정</h2>
			</div>

			<div class="dropdown-divider mb-3 py-3"></div>

			<form name="frm" action="/grasse/mypage/memberModify.do"
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
					<div class="col-3">
						<button type="button" class="btn btn-secondary btn-sm"
							onclick="execDaumPostcode()">우편번호</button>
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
							class="form-control form-control-sm" value="${memberInfo.ADDR2 }">
					</div>
					<label class="col-3 col-form-label-sm text-right"></label>
					<div class="col-7 py-1">
						<input id="EXTRAADDR" name="EXTRAADDR" type="text"
							class="form-control form-control-sm"
							value="${memberInfo.EXTRAADDR }">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">휴대전화</label>
					<div class="col-7">
						<input id="PHONE" name="PHONE" type="text"
							class="form-control form-control-sm" value="${memberInfo.PHONE }">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-3 col-form-label-sm text-right">이메일</label>
					<div class="col-7">
						<input id="EMAIL" name="EMAIL" type="text"
							class="form-control form-control-sm" value="${memberInfo.EMAIL }">
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
						<a href="/grasse/mypage/memberList.do"
							class="btn btn-secondary btn-sm btn-block">취소</a>
					</div>
					<div class="col-sm">
						<button class="btn btn-success btn-sm btn-block" type="submit">수정</button>
					</div>
				</div>

				<div class="input-group form-group row pt-5">
					<div class="col-sm-6" style="margin: 0px auto;">
						<button type="button" class="btn btn-danger btn-sm btn-block"
							data-toggle="modal" data-target="#confirmModal">회원 탈퇴</button>
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
					<h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">정말 탈퇴하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						onclick="clickDel(frm)">탈퇴하기</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소하기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		function clickDel(frm) {
			frm.action = "/grasse/mypage/memberDelete.do";
			frm.method = "post";
			frm.submit();
		}
	</script>
</body>


</html>