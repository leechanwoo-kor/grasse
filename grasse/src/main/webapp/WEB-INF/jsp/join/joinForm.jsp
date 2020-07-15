<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
		<div id="header">
			<div class="gnb">
				<ul>
					<li id="home"><a href="#this" name="main">GRASSE</a></li>
					<li id="left"><a href="#">NOTICE</a></li>
					<li id="left"><a href="#">FAQ</a></li>
					<li id="left"><a href="#">Q&A</a></li>

					<li id="right"><a href="#">WISH LIST</a></li>
					<li id="right"><a href="#">ORDER</a></li>
					<li id="right"><a href="#">SHOPPING CART</a></li>
					<li id="right"><a href="#">MYPAGE</a></li>
					<li id="right"><a href="#this" name="join">JOIN</a></li>
					<li id="right"><a href="#">LOGIN</a></li>
				</ul>
			</div>
		</div>

		<div class="join" align="center">
			<h2>회원가입</h2>
			<h3>기본정보</h3>
			<p>
				<img src="~~~">필수입력사항
			</p>
			<table cellpadding="0" cellspacing="0" align="center">

				<div class="form-group">
					<tr>
						<th>아이디<img src="~~~"></th>
						<td><input type="text" id="MEMBER_ID" name="MEMBER_ID">(영문소문자/숫자,
							4~16자)
							<p class="alertId alert-positive"></p></td>
					</tr>
				</div>
				<tr>
					<th>비밀번호<img src="~~~"></th>
					<td><input type="password" id="PASSWD" name="PASSWD">(영문
						대소문자/숫자/특수문자 중 2가지 이상 조합, 8~16자)
						<p class="alertId alert-positive"></p></td>
				</tr>
				<tr>
					<th>비밀번호 확인<img src="~~~"></th>
					<td><input type="password" id="PASSWD2" name="PASSWD2">
						<p class="alertId alert-positive"></p></td>
				</tr>
				<tr>
					<th>이름<img src="~~~"></th>
					<td><input type="text" id="MEMBER_NAME" name="MEMBER_NAME"></td>
				</tr>
				<tr>
					<th>생년월일<img src="~~~"></th>
					<td><input type="text" id="BIRTH" name="BIRTH"
						placeholder="ex)19971217"></td>
				</tr>
				<tr>
					<th>주소<img src="~~~"></th>
					<td><input type="text" id="ZIPCODE" name="ZIPCODE" size="10">
						<input type="button" value="우편번호" onclick="DaumPostCode()"
						class="hreflink"><br /> <input type="text" id="ADDR1"
						name="ADDR1" placeholder="기본주소"><br /> <input type="text"
						id="ADDR2" name="ADDR2" placeholder="상세주소"></td>
				</tr>
				<tr>
					<th>휴대전화<img src="~~~"></th>
					<td><input type="text" id="PHONE" name="PHONE"
						placeholder="-없이 번호만 입력해주세요"></td>
				</tr>
				<tr>
					<th>이메일<img src="~~~"></th>
					<td><input type="text" id="EMAIL" name="EMAIL" class="box"
						placeholder="이메일을 입력하세요"> <input type="button"
						id="emailBtn" value="인증메일 발송"></td>
				</tr>
				<tr>
					<th>이메일 인증</th>
					<td><input type="text" id="emailAuth" placeholder="인증번호입력" />
						<button type="button" id=emailAuthBtn">이메일인증</button></td>
				<tr>
					<input type="hidden" path="random" id="random" value="${random }" />
					<br />
					<br />
					<br />
					<br />
			</table>
			<h3>전체 동의</h3>
			<!-- <form name="join_agree" onsubmit="return check2()"> -->
			<div class="ec-base-box typeThinBg gStrong">
				<p>
					<label for="sAgreeAllChecked"><strong>이용약관 및
							개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong></label><span class="ec-base-chk"><input
						type="checkbox" id="sAgreeAllChecked"><em class="checkbox"></em></span>
				</p>
			</div>
			<div class="ec-base-box typeThinBg agreeArea">
				<h3>[필수] 이용약관 동의</h3>
				<p class="check">
					<span>이용약관에 동의하십니까?</span> <input id="agree_service_check1"
						name="agree_service_check[]" fw-filter="/1/" fw-label="이용약관 동의"
						fw-msg="이용약관에 동의 하세요" value="1" type="checkbox"><label
						for="agree_service_check0">동의함</label>
				</p>
			</div>
			<div class="ec-base-box typeThinBg agreeArea">
				<h3>[필수] 개인정보 수집 및 이용 동의</h3>
				<div class="content">
					■ 수집하는 개인정보 항목<br>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를
					수집하고 있습니다.
				</div>
				<p class="check">
					<span>개인정보 수집 및 이용에 동의하십니까?</span> <input id="agree_privacy_check0"
						name="agree_privacy_check[]" fw-filter="/1/"
						fw-label="개인정보 수집 및 이용 방침" fw-msg="개인정보 수집 및 이용 방침에 동의하세요"
						value="1" type="checkbox"><label
						for="agree_privacy_check0">동의함</label>
				</p>
			</div>
			<div class="ec-base-box typeThinBg agreeArea displaynone">
				<h3>[선택] 개인정보 제3자 제공 동의</h3>
				<div class="content">
					아래 내용의 동의 여부는 회원가입에 영향을 미치지 않습니다. 단, 동의 거부시 서비스 이용에 제한이 있을 수 있습니다.<br>
					<br> - 제공 받는 자 : Grasse<br> - 제공 항목 : ~~~~<br> - 제공
					목적 : ~~~~<br> - 보유 및 이용기간 : 평생<br>
				</div>
				<p class="check">
					<span>개인정보 제3자 제공에 동의하십니까?</span> <input
						id="agree_information_check0" name="agree_information_check[]"
						fw-filter="" fw-label="개인정보 제3자 제공 동의" fw-msg=""
						class="ec-base-chk" value="1" type="checkbox"><label
						for="agree_information_check0">동의함</label>
				</p>
			</div>
			<tr>
				<td align="center">	
					<input type="button" value="회원가입취소" onclick="location.href="/grasse/main">&emsp;&emsp; 
					<input type="submit" value="회원가입"></td>
			</tr>
		</div>


	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='main']").on("click", function(e) { //메인
				e.preventDefault();
				fn_main();
			}).trigger("create");

			$("a[name='join']").on("click", function(e) { //회원가입
				e.preventDefault();
				fn_join();
			}).trigger("create");
		});

		function fn_main() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main.do' />");
			comSubmit.submit();
		}
		function fn_join() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/joinForm.do' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>