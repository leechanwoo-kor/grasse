<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<div class="container col-lg-4 col-md-4 mx-auto">

		<!-- header -->
		<div class="header">
			<div class="row">
				<h4 class="text-center col-12 mb-0 font-weight-bold">���̵� ã�� ���</h4>
			</div>

			<div class="dropdown-divider mb-3"></div>
		</div>

		<!-- body -->
		<div class="body">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<h6 class="text-center py-3 text-center">���� ������ ���Ե� ���̵� ��
						${fn:length(list)}�� �ֽ��ϴ�.</h6>
					<div class="py-3 text-center">
						�̸�: ${NAME }<br> �̸���: ${EMAIL}
					</div>

					<div class="text-center font-weight-bold">���̵�</div>

					<div class="text-center">
						<c:forEach items="${list}" var="item">
							<c:out value="${item.get('MEMBER_ID')}" />
						</c:forEach>
					</div>

					<div class="row py-5">
						<div class="col">
							<a href="/grasse/login/loginForm.do"
								class="btn btn-secondary btn-sm btn-block">�α���</a>
						</div>
						<div class="col">
							<a href="/grasse/login/findPw.do"
								class="btn btn-secondary btn-sm btn-block">��й�ȣ ã��</a>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div class="py-5 text-center">��ȸ�� ���̵� �����ϴ�.</div>
					
					<div class="row py-5">
						<div class="col m-auto">
							<a href="/grasse/login/findId.do"
								class="btn btn-secondary btn-sm btn-block">���̵�ã��</a>
						</div>
						<div class="col m-auto">
							<a href="/grasse/join/joinForm.do"
								class="btn btn-secondary btn-sm btn-block">ȸ������</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		
	</div>

</body>
</html>