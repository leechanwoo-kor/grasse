<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>

<script type="text/javascript">
function fn_orderList() {
	var ORDER_NO="${map.ORDER_NO}";
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myPage/OrderList.do'/>");
    	comSubmit.addParam("ORDER_NO",ORDER_NO);
	comSubmit.submit();
}
$(document).ready(function(){
    $("#orderList").on("click", function(e){ //내주문 목록으로 넘기기
		 e.preventDefault(); 
		 fn_orderList(); 
    }); 
</script>

<style>
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
}
</style>

<script type="text/javascript">
<body>
	<h4 style="text-align:center; font-weight: bold;">나의 주문 상세보기</h4>
	
	<br><br>
	<table class="board_view" style="width: 100%;">
			<colgroup>
				<col width="10%" />
				<col width="25%" />
				<col width="10%" />
				<col width="25%" />
				<col width="10%" />
				<col width="20%" />
			</colgroup>

			<tbody>
				<tr>
					<th scope="row">주문 번호</th>
					<td>${map.ORDER_NO}</td>
					<th scope="row">주문일</th>
					<td>${map.REGDATE}</td>
				</tr>
				<tr>
					<th scope="row">상품번호</th>
					<td>${map.ITEM_NO}</td>
					<th scope="row">배송 구분</th>
					<td>배송 준비 중입니다.</td>	
				
				</tr>
				<tr>
					<th scope="row">총금액</th>
					<td colspan="6">${map.TOTALPRICE}</td>
					<th scope="row">결제 수단</th>
					<td colspan="6">${map.PAYMENT}</td>
				
				</tr>
				<tr>
					<th scope="row">수취자 성명</th>
					<td colspan="6">${map.RECIPIENT_NAME}</td>
					<th scope="row">수취자 주소</th>
					<td colspan="6">${map.RECIPIENT_ADDR1}+${map.RECIPIENT_ADDR2}</td>
				
				</tr>
			</tbody>
		</table>

<a href="#this" class="btn btn-default" id="orderList">목록으로 돌아가기</a>
	
</body>
</html>