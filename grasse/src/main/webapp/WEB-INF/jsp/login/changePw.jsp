<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
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

<div id="container">
	<div id="headerwrap"></div>

	<div id="contentwrap">

		<div id="contents">

			<form id="frm" name="frm"
				action="changePwComplete.do" method="post" onsubmit="return changePw();">
				<input type="hidden" name="modulus" id="modulus" value="${Modulus}">
				<input type="hidden" name="exponent" id="exponent"
					value="${Exponent}">

				<div class="member-changePw ">
					<div class="login">
						<h3></h3>
						<fieldset>
							<legend align="center">
								<%="비밀번호 변경"%></legend>
							<p style="text-align: center;">
								<%="새로운 비밀번호를 입력해주세요."%>
							<p>
						</fieldset>

						<fieldset>
							<span></span>
							<p style="text-align: center;">
								<span>새로운 비밀번호</span> <label class="id"> <input
									id="PASSWD" name="PASSWD" type="password">
								</label>
							<p>
							<div class="col-lg-21 col-md-20">
								<span class="han1 alert-positive"><span></span></span>
							</div>
							<p style="text-align: center;">
								<span>새로운 비밀번호 확인</span> <label class="password"> <input
									id="PASSWD2" name="PASSWD2" type="password">
								</label>
							<p>
							<div class="col-lg-21 col-md-20">
								<span class="han2 alert-positive"><span></span></span>
							</div>


							<p style="text-align: center;">

								<span class="loginbtn"> <input id="changePass"
									class="loginbtn" type="submit" value="비밀번호 변경 "></span>
							</p>

						</fieldset>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>

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
											"<span style='color:red'>필수정보입니다.</span>");
							$("input[name=chkid]").val("");
						} else if (chkCnt < 3) {
							$(".han1", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>[비밀번호]는 숫자와 영대소문자 및 특수문자 중 3종류이상 혼용하여야 합니다.</span>");
							$("input[name=chkid]").val("");
						} else if (/(\w)\1\1\1/.test(PASSWD)) {
							$(".han1", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>[비밀번호]에 같은 문자를 연속으로 4번이상 사용하실 수 없습니다.</span>");
							$("input[name=chkid]").val("on");
						} else {
							$(".han1", p)
									.removeClass("alert-negative")
									.addClass("alert-positive")
									.html(
											"<span style='color:blue'>사용가능한 비밀번호 입니다.</span>");
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
											"<span style='color:blue'>비밀번호가 일치합니다.</span>");
							$("input[name=chkid]").val("");
						} else {
							$(".han2", p)
									.removeClass("alert-negative")
									.addClass("alert-positive")
									.html(
											"<span style='color:red'>비밀번호가 일치하지 않습니다. 다시작성해주세요.</span>");
							$("input[name=chkid]").val("on");
						}
					});
</script>
</body>
</html>