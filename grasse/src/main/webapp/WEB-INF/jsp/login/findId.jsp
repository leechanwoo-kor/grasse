<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script type="text/javascript">

	function fclose() {
		location.href = "<c:url value='/main'/>";
	}
	function id_search() { //이름,이메일로 '찾기' 버튼

		var frm = document.idfindscreen;

		if (frm.name.value.length < 1) {
			alert("이름을 입력해주세요");
			return;
		}
		if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
			alert("이메일을 입력해주세요");
			return;
		}

		frm.method = "post";
		frm.action = "findIdResult.do"; //넘어간화면
		frm.submit();
	}

	function checkid() {
		var frm = document.idfindscreen;
		var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';
		if (!regExp.test(frm.email.value)) {
			alert('올바른 email을 입력해주세요.');
			frm.email.focus();
		}
	}

	function domainCheck() {
		var frm = document.idfindscreen;

		if (frm.domain.value == 0) {
			frm.e_domain.value = "";
			frm.e_domain.disabled = false;
		} else {
			frm.e_domain.disabled = true;
			var value = frm.domain.value;
			frm.e_domain.value = frm.domain.value;
			frm.e_domain.val(value);

		}
	}
	
</script>
</head>

<body>
	<form name="idfindscreen">
		<table width="380px" height="70px" align="center" border="0"
			style="font-size: 16px;">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				 <td style="text-align: center;">e-mail&nbsp;</td>
             	 <td>
             	 	<input type="text" name="email" style="width: 80px" onblur="checkid()">
             	  @ <input type="text" name="e_domain" style="width: 80px">
             	 </td> 
				 <!-- e_domain을 select옵션으로 
				   <input type="text" name="e_domain" style="width: 80px">  
				 	<select name="domain" on change="domainCheck()">
		               	<option value="0" selected="selected">직접입력</option>
		               	<option value="naver.com">naver.com</option>
		               	<option value="hanmail.net">daum.net</option>
		              	<option value="nate.com">nate.com</option>
		              	<option value="yahoo.com">yahoo.com</option>
		            </select>
		         -->
			</tr>
		</table>
		<table width="140px" height="10px" border="0" style="margin-top: 2%;"align="center">
			<tr>
				<td>
					<input type="button" name="enter" value="  찾기  " align="center"
					style="cursor: pointer; background: white; color: black; border-color: black;"
					onClick="id_search()">
				</td>
				<td>
					<input type="button" name="cancle" value="  취소  " align="center"
					style="cursor: pointer; background: white; color: black; border-color: black"
					onClick="fclose()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>