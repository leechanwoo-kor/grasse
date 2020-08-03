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
				<h4 class="text-center col-12 mb-0 font-weight-bold">아이디 찾기 결과</h4>
			</div>

			<div class="dropdown-divider mb-3"></div>
		</div>

		<!-- body -->
		<div class="body">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<h6 class="text-center py-3 text-center">다음 정보로 가입된 아이디가 총
						${fn:length(list)}개 있습니다.</h6>
					<div class="py-3 text-center">
						이름: ${NAME }<br> 이메일: ${EMAIL}
					</div>

					<div class="text-center font-weight-bold">아이디</div>

					<div class="text-center">
						<c:forEach items="${list}" var="item">
							<c:out value="${item.get('MEMBER_ID')}" />
						</c:forEach>
					</div>

					<div class="row py-5">
						<div class="col">
							<a href="/grasse/login/loginForm.do"
								class="btn btn-secondary btn-sm btn-block">로그인</a>
						</div>
						<div class="col">
							<a href="/grasse/login/findPw.do"
								class="btn btn-secondary btn-sm btn-block">비밀번호 찾기</a>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div class="py-5 text-center">조회된 아이디가 없습니다.</div>
					
					<div class="row py-5">
						<div class="col m-auto">
							<a href="/grasse/login/findId.do"
								class="btn btn-secondary btn-sm btn-block">아이디찾기</a>
						</div>
						<div class="col m-auto">
							<a href="/grasse/join/joinForm.do"
								class="btn btn-secondary btn-sm btn-block">회원가입</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		
	</div>

</body>
</html>