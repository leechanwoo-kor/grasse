<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='NAME']").focus();
	});
	
	function checkIt() {
		if (!document.frm.NAME.value) {
			alert("이름 항목은 필수 입력값입니다.");
			return false;
		}
		if (!document.frm.MEMBER_ID.value) {
			alert("아이디 항목은 필수 입력값입니다.");
			return false;
		}
		if (!document.frm.EMAIL.value) {
			alert("이메일을 입력하지 않았습니다.")
			return false;
		}
		return true;
	}
</script>
</head>

<body>
	<div class="jumbotron col-lg-6 col-md-6 mx-auto">

		<h4 class="text-center font-weight-bold">비밀번호 찾기</h4>

		<h6 class="text-center py-3 text-center">비밀번호를 잊으셨나요?</h6>

		<form name="frm" action="changePw.do" method="post"
			onsubmit="return checkIt()">

			<fieldset>
				<p style="text-align: center;">
					<span>이름</span> <label class="Pw"> <input id="NAME"
						name="NAME" type="text" fw-filter="isFill" fw-label="이름" fw-msg=""
						class="inputTypeText" placeholder="" value=""></label><br>
				<p>
				<p style="text-align: center;">
					<span>아이디</span> <label class="Pw"> <input id="MEMBER_ID"
						name="MEMBER_ID" type="text" fw-filter="isFill" fw-label="아이디"
						fw-msg="" class="inputTypeText" placeholder="" value=""></label><br>
				<p>
				<p style="text-align: center;">
					<span>이메일로 찾기</span> <label class="PW"> <input id="EMAIL"
						name="EMAIL" type="text" fw-filter="isFill" fw-label="이메일"
						fw-msg="" class="inputTypeText" placeholder="" value=""></label><br>
				<p>
			</fieldset>

			<div class="text-center">가입하신 이메일로 비밀번호 찾기가 가능합니다.</div>
			<div class="text-center">회원 가입하신 이메일를 입력해 주세요.</div>

			<div class="row pt-3">
				<div class="col m-5">
					<button class="btn btn-secondary btn-lg btn-block" type="submit">비밀번호
						변경</button>
				</div>
				<div class="col m-5">
					<a href="/grasse/main.do"
						class="btn btn-secondary btn-lg btn-block">취소</a>
				</div>
			</div>
			<!-- 
				<p style="text-align: center;">
					<input class="changePwbtn" type="submit" value="비밀번호 변경">
				<p>

 -->
		</form>


	</div>
</body>
<%-- 
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#changePwBtn").on("click", function(e) { //비밀번호 변경
			e.preventDefault();
			fn_changePwBtn();
		}).trigger("create");
	});

	function fn_changePwBtn() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login/changePw.do' />");
		comSubmit.submit();
	}
</script>
 --%>
</html>