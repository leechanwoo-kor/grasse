<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name='MEMBER_ID']").focus();
		
		if (${errCode == 1}) {
			alert("올바르지 않은 아이디 혹은 올바르지 않은 비밀번호입니다.");
		}
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[name='MEMBER_ID']").val(userInputId);
	    if($("input[name='MEMBER_ID']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	    $("#idSave").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSave").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='MEMBER_ID']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='MEMBER_ID']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='MEMBER_ID']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});


	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	} 

	function checkIt() {
		if (!document.loginForm.MEMBER_ID.value) {
			alert("아이디를 입력해주세요.");
			document.loginForm.MEMBER_ID.focus();
			return false;
		}
		if (!document.loginForm.passwd.value) {
			alert("비밀번호를 입력해주세요.");
			document.loginForm.PASSWD.focus();
			return false;
		}
	}
	function clearText(txt) {
		if (txt.defaultValue == txt.value)
			txt.value = "";
	}

</script>
</head>

<body>

	<!-- 로긴폼 -->

	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">

				<!-- header -->
				<div class="card-header">
					<h3 class="py-3 font-weight-bold text-center">로그인</h3>
				</div>

				<!-- body -->
				<div class="card-body py-5">
					<form name="loginForm" action="login.do" method="post"
						onsubmit="return checkIt()">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="아이디"
								name="MEMBER_ID" maxlength="20">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="비밀번호"
								name="PASSWD" maxlength="20">
						</div>

						<div class="input-group form-group row">
							<div class="col justify-content-center">
								<input type="checkbox" id="idSave" value="T" name="idSave">아이디
								저장
							</div>
							<div class="col justify-content-center">
								<input type="checkbox" id="autoLogin" value="T" name="autoLogin">자동
								로그인
							</div>
						</div>

						<div class="input-group form-group">
							<button type="submit"
								class="btn btn-secondary form-control text-light ">로그인</button>
						</div>
					</form>
				</div>

				<!-- footer -->
				<div class="card-footer">
					<div class="d-flex justify-content-center">
						<a href="findId.do">Forgot your id?</a>
					</div>
					<div class="d-flex justify-content-center">
						<a href="findPw.do">Forgot your password?</a>
					</div>
					<div>
						<p class="mt-5 mb-3 text-muted text-center">© 2020. GRASSE.
							All rights reserved.</p>
					</div>
				</div>


			</div>
		</div>
	</div>


</body>

</html>
