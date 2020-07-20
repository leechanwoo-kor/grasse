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
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			if (!frm.PASSWD2.value) {
				alert("��й�ȣ �ٽ� �Է��ϼ���.");
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
								<%="��й�ȣ ����"%></legend>
							<p style="text-align: center;">
								<%="���ο� ��й�ȣ�� �Է����ּ���."%>
							<p>
						</fieldset>

						<fieldset>
							<span></span>
							<p style="text-align: center;">
								<span>���ο� ��й�ȣ</span> <label class="id"> <input
									id="PASSWD" name="PASSWD" type="password">
								</label>
							<p>
							<div class="col-lg-21 col-md-20">
								<span class="han1 alert-positive"><span></span></span>
							</div>
							<p style="text-align: center;">
								<span>���ο� ��й�ȣ Ȯ��</span> <label class="password"> <input
									id="PASSWD2" name="PASSWD2" type="password">
								</label>
							<p>
							<div class="col-lg-21 col-md-20">
								<span class="han2 alert-positive"><span></span></span>
							</div>


							<p style="text-align: center;">

								<span class="loginbtn"> <input id="changePass"
									class="loginbtn" type="submit" value="��й�ȣ ���� "></span>
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
								.search(/[!@#$%^&*()\-_=+\\\/\[\]{};:\`",.<>\/?]/g); // Ư������
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
											"<span style='color:red'>�ʼ������Դϴ�.</span>");
							$("input[name=chkid]").val("");
						} else if (chkCnt < 3) {
							$(".han1", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>[��й�ȣ]�� ���ڿ� ����ҹ��� �� Ư������ �� 3�����̻� ȥ���Ͽ��� �մϴ�.</span>");
							$("input[name=chkid]").val("");
						} else if (/(\w)\1\1\1/.test(PASSWD)) {
							$(".han1", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>[��й�ȣ]�� ���� ���ڸ� �������� 4���̻� ����Ͻ� �� �����ϴ�.</span>");
							$("input[name=chkid]").val("on");
						} else {
							$(".han1", p)
									.removeClass("alert-negative")
									.addClass("alert-positive")
									.html(
											"<span style='color:blue'>��밡���� ��й�ȣ �Դϴ�.</span>");
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
											"<span style='color:blue'>��й�ȣ�� ��ġ�մϴ�.</span>");
							$("input[name=chkid]").val("");
						} else {
							$(".han2", p)
									.removeClass("alert-negative")
									.addClass("alert-positive")
									.html(
											"<span style='color:red'>��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ��ۼ����ּ���.</span>");
							$("input[name=chkid]").val("on");
						}
					});
</script>
</body>
</html>