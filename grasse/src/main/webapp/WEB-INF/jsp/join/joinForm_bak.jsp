<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
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
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraADDR").value = extraAddr;
							} else {
								document.getElementById("extraADDR").value = '';
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('ZIPCODE').value = data.zonecode;
							document.getElementById("ADDR1").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("ADDR2").focus();
						}
					}).open();
		}
</script>

<script type="text/javascript">

function check() {
		var reg = document.Reg_form;

		if (reg.agree_service_check.checked == false) {
			alert("이용약관에  동의해 주시기 바랍니다.");
			return false;
		}
		if (reg.agree_privacy_check.checked == false) {
			alert("개인정보사용에  동의해 주시기 바랍니다.");
			return false;
		}
		if (reg.MEMBER_ID.value == "") {
			alert("아이디를 입력해주십시오.");
			reg.MEMBER_ID.focus();
			return false;
		}
		if (reg.PASSWD.value == "") {
			alert("비밀번호를 입력해주십시오.");
			reg.PASSWD.focus();
			return false;
		}
		if (reg.PASSWD.value != reg.PASSWD2.value) {
			alert("비밀번호를 다르게 입력하였습니다.");
			reg.PASSWD2.focus();
			return false;
		}
		if (reg.NAME.value == "") {
			alert("이름을 입력해주십시오.");
			reg.NAME.focus();
			return false;
		}
		if (reg.BIRTH.value == "") {
			alert("생년월일을 입력해주십시오.");
			reg.BIRTH.focus();
			return false;
		}
		if (reg.ZIPCODE.value == "") {
			alert("우편번호를 입력해주십시오.");
			reg.ZIPCODE.focus();
			return false;
		}
		if (reg.ADDR1.value == "") {
			alert("기본주소를 입력해주십시오.");
			reg.ADDR1.focus();
			return false;
		}
		if (reg.ADDR2.value == "") {
			alert("상세주소를 입력해주십시오.");
			reg.ADDR2.focus();
			return false;
		}
		if (reg.PHONE.value == "") {
			alert("핸드폰 번호를 입력해주십시오.");
			reg.PHONE.focus();
			return false;
		}
		if (reg.EMAIL.value == "") {
			alert("이메일주소를 입력해주십시오.");
			reg.EMAIL.focus();
			return false;
		}
	}
</script>
</head>

<body class="bg-light">
	<!-- 회원가입 폼 -->
	<div class="container" style="padding-top: 100px;">
		<div class="title py-5 text-center">
			<h2>회원가입</h2>
		</div>

		<div class="hr py-5">
			<hr style="width: 80%; border: solid 1px black; margin: 0 auto">
		</div>
		<div class="row">
			<div class="col-md-2 order-md-1"></div>
			<div class="col-md-8 order-md-1">
				<h4>기본정보</h4>
				<h6>
					<font color="red">*</font>필수입력사항
				</h6>
				<form name="Reg_form" action="/grasse/join/joinComplete.do"
					method="post" onsubmit="return check()">
					<table cellpadding="0" cellspacing="0" align="center">
						<tbody>
							<tr>
								<th>아이디<font color="red">*</font></th>
								<td><input type="text" id="MEMBER_ID" name="MEMBER_ID">(영문소문자/숫자,
									4~16자)
									<p class="alertId alert-positive"></p></td>
							</tr>
							<tr>
								<th>비밀번호<font color="red">*</font></th>
								<td><input type="password" id="PASSWD" name="PASSWD">(영문
									대소문자/숫자/특수문자 중 2가지 이상 조합, 8~16자)
									<p class="alertPass alert-positive"></p></td>
							</tr>
							<tr>
								<th>비밀번호 확인<font color="red">*</font></th>
								<td><input type="password" id="PASSWD2" name="PASSWD2">
									<p class="alertPass2 alert-positive"></p></td>
							</tr>
							<tr>
								<th>이름<font color="red">*</font></th>
								<td><input type="text" id="NAME" name="NAME">
									<p class="alertName alert-positive"></td>
							</tr>
							<tr>
								<th>생년월일<font color="red">*</font></th>
								<td><input type="text" id="BIRTH" name="BIRTH"
									placeholder="ex)19971217">
									<p class="alertBirth alert-positive"></td>
							</tr>
							<tr>
								<th>주소<font color="red">*</font></th>
								<td><input type="text" id="ZIPCODE" name="ZIPCODE"
									placeholder="우편번호"> <input type="button" value="우편번호"
									onclick="execDaumPostcode()"><br> <input
									type="text" id="ADDR1" name="ADDR1" placeholder="기본주소">
									<input type="text" id="ADDR2" name="ADDR2" placeholder="상세주소"><br />
									<input type="text" id="extraADDR" name="extraADDR"
									placeholder="참고항목"></td>
							</tr>
							<tr>
								<th>휴대전화<font color="red">*</font></th>
								<td><input type="text" id="PHONE" name="PHONE"
									placeholder="-없이 번호만 입력해주세요">
									<p class="alertPhone alert-positive"></td>
							</tr>
							<tr>
								<th>이메일<font color="red">*</font></th>
								<td><input type="text" id="EMAIL" name="EMAIL" class="box"
									placeholder="이메일을 입력하세요"><input type="button"
									id="emailBtn" value="인증메일 발송">
									<p class="alertEmail alert-positive"></td>
							</tr>
							<tr>
								<th>이메일 인증<font color="red">*</font></th>
								<td><input type="text" id="emailAuth" placeholder="인증번호입력" />
									<button type="button" id="emailAuthBtn">이메일인증</button></td>
							<tr>
								<td><input type="hidden" id="random" value="${random}" /></td>
								<br />
								<br />
								<br />
								<br />
							</tr>
						</tbody>
					</table>
					<div class="이용약관">
						<h3>[필수] 이용약관 동의</h3>
						<p class="check">
							<span>이용약관에 동의하십니까?</span> <input id="agree_service_check"
								name="agree_service_check[]" value="1" type="checkbox"><label
								for="agree_service_check">동의함</label>
						</p>
					</div>
					<div class="">
						<h3>[필수] 개인정보 수집 및 이용 동의</h3>
						<div class="content">
							■ 수집하는 개인정보 항목<br>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를
							수집하고 있습니다.
							<p>ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 휴대전화번호 , 이메일 ,
								서비스 이용기록 , 접속 로그 , 결제기록</p>
						</div>
						<p class="check">
							<span>개인정보 수집 및 이용에 동의하십니까?</span> <input
								id="agree_privacy_check" name="agree_privacy_check[]" value="1"
								type="checkbox"><label for="agree_privacy_check">동의함</label>
						</p>
					</div>
					<div>
						<h3>[선택] 개인정보 제3자 제공 동의</h3>
						<div class="content">
							아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수
							있습니다.<br> <br> - 제공 받는 자 : Grasse<br> - 제공 항목 :
							~~~~<br> - 제공 목적 : ~~~~<br> - 보유 및 이용기간 : 평생<br>
						</div>
						<p class="check">
							<span>개인정보 제3자 제공에 동의하십니까?</span> <input
								id="agree_information_check" name="agree_information_check[]"
								value="1" type="checkbox"><label
								for="agree_information_check">동의함</label>
						</p>
					</div>
					<div class="row">
						<div class="col">
							<button class="btn btn-secondary btn-lg btn-block"
								onclick="location.href='/grasse/main.do'">회원가입취소</button>
						</div>
						<div class="col">
							<button class="btn btn-secondary btn-lg btn-block" type="submit">회원가입</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-2 order-md-1"></div>
		</div>

	</div>
</body>

<script type="text/javascript">
	$("input[name=MEMBER_ID]")
			.blur(
					function() {
						var MEMBER_ID = $(this).val();
						var p = $(this).parent();
						var chkNum = MEMBER_ID.search(/[0-9]/g);
						var chkEnga = MEMBER_ID.search(/[a-z]/g);
						var chkCnt = 0;
						if (chkNum >= 0) {
							chkCnt += 1;
						}
						if (chkEnga >= 0) {
							chkCnt += 1;
						}
						$
								.post(
										"/grasse/checkId.do",
										{
											MEMBER_ID : MEMBER_ID
										},
										function(data) {
											if (!MEMBER_ID) {
												$(".alertId", p)
														.removeClass(
																"alert-positive")
														.addClass(
																"alert-negative")
														.html(
																"<span style='color:red'>필수정보입니다.</span>");
												//$("input[name=chkid]").val("");
											} else if (data == 1) {
												$(".alertId", p)
														.removeClass(
																"alert-positive")
														.addClass(
																"alert-negative")
														.html(
																"<span style='color:red'>누군가 쓰고있네요..</span>");
												//$("input[name=chkid]").val("");
											}else if (chkCnt < 2) {
												$(".alertId", p)
												.removeClass("alert-positive")
												.addClass("alert-negative")
												.html(
														"<span style='color:red'>[아이디]는 숫자와 영문소문자를 혼용하여야 합니다.</span>");
												//$("input[name=chkid]").val(""); 
											} else if (MEMBER_ID.length < 4 || MEMBER_ID.length > 16){
												$(".alertId", p)
													.removeClass(
												"alert-positive")
													.addClass(
												"alert-negative")
													.html(
												"<span style='color:red'>길이가 맞지 않습니다.</span>");
											} else {
												$(".alertId", p)
														.removeClass(
																"alert-negative")
														.addClass(
																"alert-positive")
														.html(
																"<span style='color:blue'>사용 가능한 아이디입니다.</span>");
												//$("input[name=chkid]").val("on");
											}
										});
					});

	$("input[name=PASSWD]")
			.blur(
					function() {
						var PASSWD = $(this).val();
						var ID = $("input[name=MEMBER_ID]").val();
						var p = $(this).parent();
						var chkNum = PASSWD.search(/[0-9]/g); // 숫자
						//  var chkEngA = PASSWD.search(/[A-Z]/g);  // 영문 대문자
						//  var chkEnga = PASSWD.search(/[a-z]/g);  // 영문 소문자
						var chkEngAa = PASSWD.search(/[A-Za-z]/g); // 영문 대소문자
						var chkSpecial = PASSWD
								.search(/[!@#$%^&*()\-_=+\\\/\[\]{};:\`,.<>\/?]/g); // 특수문자
						var chkCnt = 0;

						if (chkNum >= 0) {
							chkCnt += 1;
						}
						//  if(chkEngA >= 0) { chkCnt += 1; }
						//  if(chkEnga >= 0) { chkCnt += 1; }
						if (chkEngAa >= 0) {
							chkCnt += 1;
						}
						if (chkSpecial >= 0) {
							chkCnt += 1;
						}
						if (!PASSWD) {
							$(".alertPass", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>필수정보입니다.</span>");
							//$("input[name=chkid]").val("");
						} else if (chkCnt < 3) {
							$(".alertPass", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>[비밀번호]는 숫자와 영대소문자 및 특수문자 중 3종류이상 혼용하여야 합니다.</span>");
							//$("input[name=chkid]").val(""); 
						} else if (/(\w)\1\1\1/.test(PASSWD)) {
							$(".alertPass", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>[비밀번호]에 같은 문자를 연속으로 4번이상 사용하실 수 없습니다.</span>");
							//$("input[name=chkid]").val("on"); 
						} else if (PASSWD.indexOf(ID) > -1) {
							$(".alertPass", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:red'>[비밀번호]는 사용자ID와 동일하거나 이를 포함한 비밀번호를 사용하실 수 없습니다.</span>");

							if (!ID) {
								$(".alertPass", p)
										.removeClass("alert-positive")
										.addClass("alert-negative")
										.html(
												"<span style='color:red'>사용자 ID를 입력해주세요.</span>");
							}
						}else if (PASSWD.length < 8 || PASSWD.length > 16){
								$(".alertPass", p)
								.removeClass(
							"alert-positive")
								.addClass(
							"alert-negative")
									.html(
							"<span style='color:red'>길이가 맞지 않습니다.</span>");
					}	 else {
							$(".alertPass", p)
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
						var p = $(this).parent();
						if(!PASSWD){
							$(".alertPass2", p)
							.removeClass("alert-positive")
							.addClass("alert-negative")
							.html(
									"<span style='color:red'>비밀번호를 먼저 입력해주세요.</span>");
						} else if (PASSWD == PASSWD2) {
							$(".alertPass2", p)
									.removeClass("alert-positive")
									.addClass("alert-negative")
									.html(
											"<span style='color:blue'>비밀번호가 일치합니다.</span>");
							//$("input[name=chkid]").val(""); 
						}  else {
							$(".alertPass2", p)
									.removeClass("alert-negative")
									.addClass("alert-positive")
									.html(
											"<span style='color:red'>비밀번호가 일치하지 않습니다. 다시작성해주세요.</span>");
							//$("input[name=chkid]").val("on"); 
						}
					});

	$("input[name=NAME]").blur(
			function(){
				var NAME = $("input[name=NAME]").val();
				var p = $(this).parent();
				if (!NAME){
					$(".alertName",p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>필수정보입니다.</span>");
				} else{
					$(".alertName",p).removeClass("alert-positive").addClass("alert-negative").html(" ")};
		});
	$("input[name=BIRTH]").blur(
			function(){
				var BIRTH = $("input[name=BIRTH]").val();
				var p = $(this).parent();
				var chkNum = BIRTH.search(/[0-9]/g);
				if (!BIRTH){
					$(".alertBirth",p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>필수정보입니다.</span>");
				} else if(chkNum){
					$(".alertBirth", p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>형식을 확인해주십시오.</span>");
				} else if(BIRTH.length > 8 || BIRTH.length <8){
					$(".alertBirth", p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>8자리를 입력해주십시오.</span>");
				} else {
					$(".alertBirth",p).removeClass("alert-positive").addClass("alert-negative").html(" ")};
		});
	$("input[name=PHONE]").blur(
			function(){
				var PHONE = $("input[name=PHONE]").val();
				var p = $(this).parent();
				var chkNum = PHONE.search(/[0-9]/g);
				if (!PHONE){
					$(".alertPhone",p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>필수정보입니다.</span>");
				} else if(chkNum){
					$(".alertPhone", p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>숫자만 입력해주세요</span>");
				} else if(PHONE.length < 10 || PHONE.length > 11){
					$(".alertPhone", p).removeClass("alert-positive").addClass("alert-negative")
					.html("<span style='color:red'>길이가 맞지않습니다.</span>");
				} else {
					$(".alertPhone",p).removeClass("alert-positive").addClass("alert-negative").html(" ")};
		});

	
$(document).ready(function() {
		/*
		이메일 인증 버튼 클릭시 발생하는 이벤트
		 */
		$("#emailBtn").on("click",function() {
			var EMAIL = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var p = $(this).parent();
				if(!EMAIL){
					$(".alertEmail", p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>필수정보입니다.</span>");
				} else if (!EMAIL.test($('#EMAIL').val())) {
					$(".alertEmail", p).removeClass("alert-positive").addClass("alert-negative").html("<span style='color:red'>잘못된 이메일 입니다.</span>");
				}
/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
				$.ajax({
						type : "get",
						url : "<c:url value='/join/joinEmailCheck.do'/>",
						data : "userEmail="	+ $("#EMAIL").val()	+ "&random="+ $("#random").val(),
						//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
						/* encodeURIComponent
						예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
						중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
						그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
						success : function(data) {
							EMAIL = $('#EMAIL').val();
								alert("이메일을 보냈습니다. 인증번호를 입력해주세요.");
						},
						error : function(data) {
							alert("에러가 발생했습니다.");
							console.log(random);
							return false;
						}
					});
				});
/*
이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
*/
		$("#emailAuthBtn").on("click",function() {
			$.ajax({
			type : "get",
			url : "<c:url value='/join/emailAuth.do'/>",
			data : "authCode="+ $('#emailAuth').val()	+ "&random=" + $("#random").val(),
			success : function(data) {
				if (data == "complete") {
					alert("인증이 완료되었습니다.");
				} else if (data == "false") {
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			error : function(data) {
				alert("에러가 발생했습니다.");
			}
			});
		});
	});

</script>
< / html>