<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<script type="text/javascript">
	function changePw() {

		var frm = document.frm;

		if (!frm.PASSWD.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!frm.PASSWD2.value) {
			alert("비밀번호 다시 입력하세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form class="form-compact" name="frm" action="changePwComplete.do"
		method="post" onsubmit="return changePw();">
		<div class="row py-5">
			<div class="container col-4">
				<div class="row">
					<h4 class="text-center col-12 mb-0 font-weight-bold">비밀번호 변경</h4>
				</div>

				<div class="dropdown-divider mb-3"></div>

				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<div class="form-group row">
							<label class="col-4 col-form-label-sm text-right">새로운
								비밀번호</label>
							<div class="col-8">
								<input id="PASSWD" name="PASSWD" type="password"
									class="form-control form-control-sm">
								<div class="text-center">
									<div class="han1 alert-positive"></div>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-4 col-form-label-sm text-right">새로운
								비밀번호 확인</label>
							<div class="col-8">
								<input id="PASSWD2" name="PASSWD2" type="password"
									class="form-control form-control-sm">
								<div class="text-center">
									<div class="han2 alert-positive"></div>
								</div>
							</div>
						</div>

						<input id="NAME" name="NAME" type="hidden" value="${NAME }">
						<input id="MEMBER_ID" name="MEMBER_ID" type="hidden"
							value="${MEMBER_ID }">
						<input id="EMAIL" name="EMAIL" type="hidden" value="${EMAIL }">


						<div class="input-group form-group row pt-3">
							<div class="col">
								<button class="btn btn-secondary btn-sm btn-block" type="submit">비밀번호
									변경</button>
							</div>
							<div class="col">
								<a href="/grasse/login/loginForm.do"
									class="btn btn-secondary btn-sm btn-block">취소</a>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="py-5 text-center">조회된 아이디가 없습니다.</div>

						<div class="row py-5">
							<div class="col m-auto">
								<a href="/grasse/login/findId.do"
									class="btn btn-secondary btn-sm btn-block">아이디찾기</a>
							</div>
							<div class="col m-auto">
								<a href="/grasse/join/joinForm.do"
									class="btn btn-secondary btn-sm btn-block">회원가입</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form>
</body>

<script type="text/javascript">
	$("input[name=PASSWD]")
			.blur(
					function() {
						var PASSWD = $(this).val();
						var p = $(".han1").parent();
						var chkNum = PASSWD.search(/[0-9]/g);
						var chkEngA = PASSWD.search(/[A-Z]/g);
						var chkEnga = PASSWD.search(/[a-z]/g);
						var chkEngAa = PASSWD.search(/[A-Za-z]/g);
						var chkSpecial = PASSWD
								.search(/[!@#$%^&*()\-_=+\\\/\[\]{};:\`",.<>\/?]/g); // 특수문자
						var chkCnt = 0;

						if (chkNum >= 0) {
							chkCnt += 1;
						}
						if (chkEngA >= 0) {
							chkCnt += 1;
						}
						if (chkEnga >= 0) {
							chkCnt += 1;
						}
						if (chkEngAa >= 0) {
							chkCnt += 1;
						}
						if (chkSpecial >= 0) {
							chkCnt += 1;
						}

						if (!PASSWD) {
							$(".han1", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<div style='color:red'>필수정보입니다.</div>");
							$("input[name=chkid]").val("");
						} else if (chkCnt < 3) {
							$(".han1", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<div style='color:red'>[비밀번호]는 숫자와 영대소문자 및 특수문자 중 3종류이상 혼용하여야 합니다.</div>");
							$("input[name=chkid]").val("");
						} else if (/(\w)\1\1\1/.test(PASSWD)) {
							$(".han1", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<div style='color:red'>[비밀번호]에 같은 문자를 연속으로 4번이상 사용하실 수 없습니다.</div>");
							$("input[name=chkid]").val("on");
						} else {
							$(".han1", p)
									.removeClass("alert-negative")
									.addClass("alert-positive")
									.html(
											"<div style='color:blue'>사용가능한 비밀번호 입니다.</div>");
						}

					});

	$("input[name=PASSWD2]")
			.blur(
					function() {
						var PASSWD = $("input[name=PASSWD]").val();
						var PASSWD2 = $(this).val();
						var p = $(".han2").parent();

						console.log(PASSWD);
						console.log(PASSWD2);

						if (PASSWD == PASSWD2) {
							$(".han2", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<div style='color:blue'>비밀번호가 일치합니다.</div>");
							$("input[name=chkid]").val("");
						} else {
							$(".han2", p)
									.removeClass("alert-negative")
									.addClass("alert-positive")
									.html(
											"<div style='color:red'>비밀번호가 일치하지 않습니다. 다시작성해주세요.</div>");
							$("input[name=chkid]").val("on");
						}
					});
</script>
</ht
					ml>