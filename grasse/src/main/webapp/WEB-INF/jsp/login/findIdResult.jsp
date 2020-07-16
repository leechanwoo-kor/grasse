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

			���� ������ ���Ե� ���̵� �� ${fn:length(list)}�� �ֽ��ϴ�. <br><br>
			�̸� ${name }<br>
			�̸��� ${email}<br><br>
	
			���̵� <c:forEach items="${list}" var="item">
					<div>
						<c:out value="${item.get('MEMBER_ID')}" />
					</div>
				</c:forEach>
				<a href="/grasse/login/loginForm.do" class="btn">�α���</a>
				<a href="/grasse/login/findPw.do" class="btn">��й�ȣ ã��</a>
			</c:when>

			<c:otherwise>
				��ȸ�� ���̵� �����ϴ�. <br>
				<a href="/grasse/findId.do" class="btn">���̵� ã��</a>
				<a href="/grasse/join/joinForm.do" class="btn">ȸ������</a>
			</c:otherwise>
		</c:choose>
		<br>

	</div>

</body>
</html>