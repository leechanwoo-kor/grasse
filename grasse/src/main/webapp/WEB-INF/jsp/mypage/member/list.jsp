<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<div class="container">
			<div class="col-md-12 order-md-1"
				style="width: 60%; margin: 0px auto;">

				<div class="py-5 text-center">
					<h2 class="text-center">회원정보</h2>
				</div>

				<div class="dropdown-divider mb-3 py-3"></div>

				<table class="table table-bordered table-sm">
					<tr>
						<td id="title">회원번호</td>
						<td>${memberInfo.MEMBER_NO }</td>
					</tr>

					<tr>
						<td id="title">아이디</td>
						<td>${memberInfo.MEMBER_ID }</td>
					</tr>

					<tr>
						<td id="title">이름</td>
						<td>${memberInfo.NAME }</td>
					</tr>

					<tr>
						<td id="title">생일</td>
						<td>${memberInfo.BIRTH }</td>
					</tr>

					<tr>
						<td id="title">우편번호</td>
						<td>${memberInfo.ZIPCODE }</td>
					</tr>

					<tr>
						<td id="title">기본주소</td>
						<td>${memberInfo.ADDR1 }</td>
					</tr>
					<tr>
						<td id="title">상세주소</td>
						<td>${memberInfo.ADDR2 }</td>
					</tr>
					<tr>
						<td id="title">참고항목</td>
						<td>${memberInfo.EXTRAADDR }</td>
					</tr>

					<tr>
						<td id="title">휴대전화</td>
						<td>${memberInfo.PHONE }</td>
					</tr>
					<tr>
						<td id="title">이메일</td>
						<td>${memberInfo.EMAIL }</td>
					</tr>
					<tr>
						<td id="title">가입날짜</td>
						<td>${memberInfo.REGDATE }</td>
					</tr>
				</table>

				<div class="input-group form-group row pt-3">
					<div class="col-sm-6" style="margin: 0px auto;">
						<a href="/grasse/mypage/memberDetail.do"
							class="btn btn-outline-dark btn-sm btn-block">회원정보 수정</a>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>


</html>