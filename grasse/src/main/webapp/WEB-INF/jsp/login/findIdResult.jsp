<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<div class="result">
		<c:choose>
			<c:when test="${fn:length(list) > 0}">

			다음 정보로 가입된 아이디가 총 ${fn:length(list)}개 있습니다. <br><br>
			이름 ${name }<br>
			이메일 ${email}<br><br>
	
			아이디 <c:forEach items="${list}" var="item">
					<div>
						<c:out value="${item.get('MEMBER_ID')}" />
					</div>
				</c:forEach>
				<a href="/grasse/login/loginForm.do" class="btn">로그인</a>
				<a href="/grasse/login/findPw.do" class="btn">비밀번호 찾기</a>
			</c:when>

			<c:otherwise>
				조회된 아이디가 없습니다. <br>
				<a href="/grasse/findId.do" class="btn">아이디 찾기</a>
				<a href="/grasse/join/joinForm.do" class="btn">회원가입</a>
			</c:otherwise>
		</c:choose>
		<br>

	</div>

</body>
</html>