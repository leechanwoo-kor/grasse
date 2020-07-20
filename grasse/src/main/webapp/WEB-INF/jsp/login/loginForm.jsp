<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<script type="text/javascript">
	$(document).ready(function() {
		if (${errCode == 1}) {
			alert("올바르지 않은 아이디 혹은 올바르지 않은 비밀번호입니다.");
		}
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[name='id']").val(userInputId);
	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	    $("#idSave").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSave").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });

		$("#findId").on("click", function(e) { //아이디 찾기
			e.preventDefault();
			fn_findId();
		}).trigger("create");

		$("a[name='findPw']").on("click", function(e) { //비밀번호 찾기
			e.preventDefault();
			fn_findPw();
		}).trigger("create");
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
		if (!document.loginForm.id.value) {
			alert("아이디를 입력해주세요.");
			document.loginForm.id.focus();
			return false;
		}
		if (!document.loginForm.passwd.value) {
			alert("비밀번호를 입력해주세요.");
			document.loginForm.passwd.focus();
			return false;
		}
	}
	function clearText(txt) {
		if (txt.defaultValue == txt.value)
			txt.value = "";
	}

	function fn_findId() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login/findId.do' />");
		comSubmit.submit();
	}
	
	function fn_findPw() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login/findPw.do' />");
		comSubmit.submit();
	}
</script>
</head>

<body>

	<!-- 로긴폼 -->

	<div class="container" style="padding-top: 50px;">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form name="loginForm" action="login.do" method="post"
					onsubmit="return checkIt()">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="passwd" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">

					<div class="form-group">
						<input type="checkbox" id="idSave" value="T" name="idSave"
							style="font-size: 10px">아이디 저장 <input type="checkbox"
							id="autoLogin" value="T" name="autoLogin" style="font-size: 10px">자동
						로그인
					</div>


					<div class="form-group">!회원이 되시면 다양한 혜택이있습니다. !아직 회원이 아니시라면
						지금 바로 가입하세요.</div>

					<div class="form-group">
						<input type="button" name="join_btn"
							style="width: 160; font-family: 돋움; background-color: #000000; color: #FFFFFF">
						<a href="#this" class="btn btn-info" id="findId" name="findId">아이디
							찾기</a> <a href="#this" class="btn btn-info" id="findPw" name="findPw">비밀번호
							찾기</a>
					</div>

					<p class="mt-5 mb-3 text-muted text-center">© 2020. GRASSE. All
						rights reserved.</p>
				</form>
			</div>
		</div>
	</div>



</body>

</html>
