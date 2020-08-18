<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--PG크로스브라우징필수내용 시작-->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<!--PG크로스브라우징필수내용 끝-->
<!--해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요.-->
<!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
<link
	href="//fonts.googleapis.com/css?family=Lato:100,300,400,500,700,900,100italic,300italic,400italic,700italic,900italic"
	rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/css?family=Cabin" rel="stylesheet"
	type="text/css">
<link href="//fonts.googleapis.com/css?family=Cabin:700"
	rel="stylesheet" type="text/css">
<meta name="format-detection" content="telephone=no">
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="http://www.google-analytics.com/ga.js"></script>
<script
	src="https://connect.facebook.net/signals/config/829030643890604?v=2.8.25&amp;r=stable"
	async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<!-- <script src="/js/jquery.gray.js"></script>
해당 JS는 플래시를 사용하기 위한 스크립트입니다.
<script src="/js/jquery-1.11.2.min.js"></script>
<script src="/js/jquery-latest.js"></script>
<script src="/js/jquery.als-1.6.min.js"></script> -->


<link rel="canonical" href="http://asclo.com/order/basket.html">
<link rel="alternate" href="http://m.asclo.com/order/basket.html">
<meta property="og:url" content="http://asclo.com/order/basket.html">
<meta property="og:site_name" content="애즈클로">
<meta property="og:type" content="website">
<link rel="shortcut icon" href="/web/upload/favicon_20141006131340.ico">
<meta http-equiv="ImageToolbar" content="No">

<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
   
   
 	
   	
   
   
 
    function comma(str) {
       str = String(str);
       return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
   }
    
   //체크박스 단일 선택
    var sum = 0;
    var delivery = 0;
    var totalSum =0;
    
    function checkedRows(index){
      var index = index;
      var tagName = "#checkbox"+index;
      
      var totprice = $(".totprice").eq(index).data("price");
      
      totprice = parseInt(totprice);
      if($(tagName).is(":checked")){
             sum += totprice;
      } else {
          sum -=  totprice;
      } 

        if(sum>10000 || sum==0){
           delivery=0;
         }else{
              delivery=3000;
         }
        
          totalSum = sum + delivery;        
          
        $("#totalPrice").html(comma(sum)+" KRW");
        $("#delivery").html(comma(delivery)+" KRW");
        $("#totalSum").html(comma(totalSum)+" KRW");
        $("#totalPrice2").html(comma(sum)+" KRW");
        $("#delivery2").html(comma(delivery)+" KRW");
        $("#totalSum2").html(comma(totalSum)+" KRW");
   };
   
   //체크박스 다중 선택
   
   function checkAll(){
	  var chkCount = $("input[type=checkbox]").length ;
      if($("#chkBox").is(":checked")) {
         for(i=0;i<$("input[type=checkbox]").length-1;i++){
            if($("#checkbox"+i).is(":checked")){
            }
            else{
               $("#checkbox"+i).prop("checked",true);
               checkedRows(i); 
            }
         }
      } else{
         for(i=0;i<$("input[type=checkbox]").length-1;i++){
            if($("#checkbox"+i).is(":checked")){
               $("#checkbox"+i).prop("checked",false);
               checkedRows(i); 
            }
         }
      } 
   }

   function check_chk(index){
	   var chkCount = $("input[type=checkbox]").length -1;
	   var checkedCount = $("input[name=checkbox]:checked").length;
	   if(chkCount == checkedCount){
        	$("#chkBox").prop("checked",true);
		}
	   else {
		   $("#chkBox").prop("checked",false);
 	 	}
       checkedRows(index);
	}
   
</script>

<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/983431901/?random=1534724800800&amp;cv=9&amp;fst=1534724800800&amp;num=1&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=5&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;sendb=1&amp;frm=0&amp;url=http%3A%2F%2Fasclo.com%2Forder%2Fbasket.html%3Fdelvtype%3DA&amp;ref=http%3A%2F%2Fasclo.com%2Fproduct%2Fdetail.html%3Fproduct_no%3D8171%26cate_no%3D1%26display_group%3D2&amp;tiba=%EC%95%A0%EC%A6%88%ED%81%B4%EB%A1%9C&amp;rfmt=3&amp;fmt=4">
   
</script>
<title>CART</title>
<style type="text/css">
#deleteBtn {
	position: relative;
	float: right;
	max-width: 100px;
	height: auto;
}
</style>
</head>
<body>
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<h2 class="pt-5 text-center">장바구니</h2>
		<h6 class="pb-5 text-center">구매하실 상품을 확인하세요</h6>
		<div class="dropdown-divider mb-3 py-3"></div>

		<form id="frm" method="post">
		<input type="hidden" name="TOTAL" value="">
		<input type="hidden" name="ATTRIBUTE" value="">
			<div id="contentwrap">
				<div id="contents">
					<div>
						<div class="orderListArea">
							<div class="cartList">
								<div class="table-responsive pt-3 mx-auto" style="width: 100%;">
									<table class="table table-hover table-sm"
										style="text-align: center;">
										<thead>
											<tr class="text-center">
												<th class="chk" style="width: 3%"><input
													type="checkbox" id="chkBox" onclick=checkAll()></th>
												<th class="thumb">IMAGE</th>
												<th class="product">PRODUCT</th>
												<th class="price" style="width: 8%">가격</th>
												<th class="quantity" style="width: 5%">수량</th>
												<th class="quantityBtn" width="8%"></th>
												<th class="mileage" style="width: 7%">적립금</th>
												<th class="charge" style="width: 8%">배송비</th>
												<th class="total" style="width: 9%">TOTAL</th>
												<th class="button"></th>
											</tr>
										</thead>

										<tbody>
											<c:if test="${fn:length(cartList) > 0}">
												<c:forEach items="${cartList }" var="row" varStatus="stat">
													<input type="hidden" name="CART_NO" class="CART_NO"
														value="<c:out value='${row.CART_NO }'/>">
													<input type="hidden" name="ATTRIBUTE_NO" value="${row.ATTRIBUTE_NO }">
													<tr>
														<td><input type="checkbox" id="checkbox${stat.index}"
															name="checkbox" value="${row.CART_NO}"
															onclick="check_chk(${stat.index});"></td>

														<!-- 제품사진, 이름, 옵션 -->
														<td class="thumb"><a
															href="/grasse/itemDetail/item.do?ITEM_NO=${row.ITEM_NO }"
															class="toItemDetail"> <img src="${row.THUMBNAIL }" name="THUMBNAIL"
																style="width: 100px; height: 100px;" />
															<input type="hidden" name="THUMBNAIL" value="${row.THUMBNAIL }">
														</a></td>
														<td class="product"><a
															href="/grasse/itemDetail/item.do?ITEM_NO=${row.ITEM_NO }"
															class="toItemDetail text-dark"> <span class="ITEM_NO"
																data-item=${row.ITEM_NO }>${row.NAME }</span></a>
																<input type="hidden" name="NAME" value="${row.NAME }">
															<ul>
																<li>[옵션: ${row.ITEM_SIZE }]</li>
															</ul>
															<input type="hidden" name="ITEM_SIZE" value="${row.ITEM_SIZE }"></td>

														<!-- 가격, 수량변경버튼 -->
														<td><span class="price"
															data-price="<c:out value='${row.ITEM_PRICE }'/>">
																<fmt:formatNumber value="${row.ITEM_PRICE}"
																	pattern="#,###" />원
														</span></td>

														<td>${row.COUNT }<input type="hidden" name="COUNT" value="${row.COUNT }">
														</td>
														<td><a href="#this" class="countUp"> <img
																src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_up.gif"
																alt="증가" class="QuantityUp"></a> <c:if
																test="${row.COUNT>1 }">
																<a href="#this" class="countDown"> <img
																	src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_down.gif"
																	alt="감소" class="QuantityDown"></a>
															</c:if></td>

														<!-- 적립금, 가격 -->
														<td class="mileage"><c:out
																value="${row.ITEM_PRICE /100 }" /></td>
														<td><span class="totprice"
															data-price="${row.ITEM_PRICE*row.COUNT}">0원</span></td>
														<td class="total"><strong><fmt:formatNumber
																	value="${row.ITEM_PRICE * row.COUNT }" pattern="#,###" />원</strong></td>

														<!-- 주문하기, 삭제하기 버튼  -->
														<td class="button" style="padding-bottom: 30px;"><a
															href="#none" class="orderOneItem" onclick=""> <img
																src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order.gif"
																alt="주문하기">
														</a><br> <a href="#this" class="deleteOneItem"> <img
																src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete.gif"
																alt="삭제"></a></td>
													</tr>
												</c:forEach>
											</c:if>

											<c:if test="${fn:length(cartList) eq 0 }">
												<tr height=200>
													<td colspan="10" align="center">장바구니가 비었습니다.</td>
												</tr>
											</c:if>
										</tbody>

										<tfoot>
											<tr>
												<td colspan="9" align="center"><strong class="type">[기본배송]</strong>
													상품구매금액 <strong id="totalPrice">0 KRW </strong> + 배송비 <strong
													id="delivery">0 KRW </strong> -상품할인금액 <strong id="discount">0
														KRW </strong> = 합계 : <strong id="totalSum">0 KRW </strong> <br>결제
													예정 금액의 1% 는 포인트로 적립됩니다.</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
						</div>

						<!-- 선택상품 제어 버튼 -->
						<div style="margin-bottom: 10px;">
							<div style="float: right; margin-bottom: 30px;">
								<a href="#this" class="deleteSelected" onclick="deleteItem(2);"> <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete2.gif"
									alt="삭제하기"></a> <a href="#this" class="deleteAll" onclick="deleteItem(3);"> <img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_clear.gif"
									alt="장바구니비우기"></a>
								<div></div>
							</div>

							<!-- 총 금액  -->
							<div>
								<table border="2" width="1000px" bgcolor="#A4A4A4">
									<colgroup>
										<col style="width: 23%;">
										<col style="width: 24%;">
										<col style="width: auto;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" width=33%>총 상품금액</th>
											<th scope="col" width=33%>총 배송비</th>
											<th scope="col" width=33%>결제예정금액</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><strong id="totalPrice2">0 KRW</strong></td>
											<td><strong>+</strong><strong id="delivery2">0
													KRW</strong></td>
											<td><strong>=</strong><strong id="totalSum2">0
													KRW</strong></td>
										</tr>
									</tbody>
								</table>

							</div>

							<!-- 주문 버튼 -->
							<div class="input-group form-group row pt-3">
								<div class="col-sm">
									<a href="#none" class="btn btn-outline-dark btn-sm btn-block"
										id="cartAddSelected" onclick="orderCheck(1);">선택상품주문</a>
								</div>
								<div class="col-sm">
									<a href="#none" class="btn btn-outline-dark btn-sm btn-block"
										id="addOrderAll" onclick="orderCheck(2);">전체상품주문</a>
								</div>
								<div class="col-sm">
									<a href="javascript:back();"
										class="btn btn-outline-dark btn-sm btn-block">쇼핑계속하기</a> </span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<script type="text/javascript">
	function back(){
		history.back();
	}  		
    </script>
		<script type="text/javascript">
		
	//수량증가
	$(".countUp").on("click", function(){
		var thisIdx = $(".countUp").index(this);
		var price = $("span.price").eq(thisIdx).data("price");
		var cart = $("input[name=checkbox][type=checkbox]").val();

		alert(cart);
		var aJson = {
			CART_NO:cart,
			index:0
		};

		to_ajax(aJson, "/grasse/cart/cartUpdate.do");
	});
	//수량감소
	$(".countDown").on("click", function(){
		var thisIdx = $(".countDown").index(this);
		var price = $("span.price").eq(thisIdx).data("price");
		var cart = $("input[name=checkbox][type=checkbox]").eq(thisIdx).val();
	    
		var aJson = {
			CART_NO:cart,
			index:1
		};

		to_ajax(aJson, "/grasse/cart/cartUpdate.do");
	});

	$(".orderOneItem").on("click", function(){
		var thisIdx = $(".orderOneItem").index(this);
		var TOTAL = $(".totprice").eq(thisIdx).data("price");
		var CART_NO = $("input[name=checkbox]").val();
		
		var ATTRIBUTE = new Array();
		
		var aJson = {
				"ITEM_NO" : $(".ITEM_NO").eq(thisIdx).data("item"),
				"THUMBNAIL" : $("input[name=THUMBNAIL]").eq(thisIdx).val(),
				"NAME" : $("input[name=NAME]").eq(thisIdx).val(),
				"ATTRIBUTE_NO" : $("input[name=ATTRIBUTE_NO]").eq(thisIdx).val(),
				"SIZE" : $("input[name=ITEM_SIZE]").eq(thisIdx).val(),
				"PRICE" : $("span.price").eq(thisIdx).data("price"),
				"COUNT" : $("input[name=COUNT]").eq(thisIdx).val()
		};
			ATTRIBUTE.push(JSON.stringify(aJson));
			alert(ATTRIBUTE);
			
			$("input[type=hidden][name=TOTAL]").val(TOTAL);
			$("input[type=hidden][name=CART_NO]").val(CART_NO);
			$("input[type=hidden][name=ATTRIBUTE]").val(JSON.stringify(ATTRIBUTE));
			
			document.getElementById('frm').action="/grasse/order/buyCart.do";
			document.getElementById('frm').submit();
	});

	//선택상품주문(index=1) , 전체상품주문(index=2)
	function orderCheck(index){
		var chkCount = 0;
		var CART_NO = [];
		var TOTAL = 0;	
		var ATTRIBUTE = new Array();	
		
		//선택상품 주문인데 선택된게 없으면 alert
		if(index==1){
			if($("input[name=checkbox]:checked").length == 0){
				alert("주문하실 상품을 선택해주세요");
				return false;
			}
			else {
				//선택된 checkbox의 CART_NO를 저장
				$("input[name=checkbox]:checked").each(function() {
					var thisIdx = $("input[name=checkbox]:checked").index(this);
					CART_NO.push($(this).val());
					TOTAL = TOTAL + $(".totprice").eq(thisIdx).data("price");
					var aJson = {
							ITEM_NO : $(".ITEM_NO").eq(thisIdx).data("item"),
							THUMBNAIL : $("input[name=THUMBNAIL]").eq(thisIdx).val(),
							NAME : $("input[name=NAME]").eq(thisIdx).val(),
							ATTRIBUTE_NO : $("input[name=ATTRIBUTE_NO]").eq(thisIdx).val(),
							SIZE : $("input[name=ITEM_SIZE]").eq(thisIdx).val(),
							PRICE : $("span.price").eq(thisIdx).data("price"),
							COUNT : $("input[name=COUNT]").eq(thisIdx).val()
						};
						ATTRIBUTE.push(aJson);
				});
			}
		}

		
		//전체상품 주문의 경우 모든 체크박스의 CART_NO값 저장	
		if(index==2) {
			$("input[name=checkbox]").each(function() {
				var thisIdx = $("input[name=checkbox]").index(this);
				CART_NO.push($(this).val());
				var aJson = {
						ITEM_NO : $(".ITEM_NO").eq(thisIdx).data("item"),
						THUMBNAIL : $("input[name=THUMBNAIL]").eq(thisIdx).val(),
						NAME : $("input[name=NAME]").eq(thisIdx).val(),
						ATTRIBUTE_NO : $("input[name=ATTRIBUTE_NO]").eq(thisIdx).val(),
						SIZE : $("input[name=ITEM_SIZE]").eq(thisIdx).val(),
						PRICE : $("span.price").eq(thisIdx).data("price"),
						COUNT : $("input[name=COUNT]").eq(thisIdx).val()
				};
				ATTRIBUTE.push(aJson);
			});
			$(".totprice").each(function(){
				TOTAL = TOTAL + $(this).data("price");
			});
		}
		
		$("input[type=hidden][name=TOTAL]").val(TOTAL);
		$("input[type=hidden][name=CART_NO]").val(CART_NO);
		$("input[type=hidden][name=ATTRIBUTE]").val(JSON.stringify(ATTRIBUTE));
		
		document.getElementById('frm').action="/grasse/order/buyCart.do";
		document.getElementById('frm').submit();
	}
	
	$(".deleteOneItem").on("click", function(){
	      var thisIdx = $(".deleteOneItem").index(this);
	      alert(thisIdx);
	      var cart = $("input[name=checkbox]").eq(thisIdx).val();
	       
	      var aJson = {
	         CART_NO:cart,
	         index:1
	      };

	      alert(JSON.stringify(aJson));

	      to_ajax(aJson, "/grasse/cart/cartDelete.do");
	 });

	   function deleteItem(index){
	      var CART_NO_LIST = [];

	      if(index==2){
	         if($("input[name=checkbox]:checked").length==0){
	            alert("삭제하실 상품을 선택해주세요");
	            return false;
	         } else {
	            $("input[name=checkbox]:checked").each(function(){
	               CART_NO_LIST.push(parseInt($(this).val()));
	            });
	         }
	      }

	      if(index==3){
	         $("input[name=checkbox]").each(function(){
	            CART_NO_LIST.push(parseInt($(this).val()));
	         });
	      }

	      var aJson={
	            index:0,
	            CART_NO_LIST:CART_NO_LIST
	         }

	      to_ajax(aJson, "/grasse/cart/cartDelete.do");
	   }

	
	
	function to_ajax(aJson, url){
		$.ajax({
			url:url,
			type:"POST",
			data:JSON.stringify(aJson),
			contentType:"application/json; charset=utf-8",
			success : function(data) {
				document.getElementById('frm').submit();
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
		
	
</script>
	</main>
</body>
</html>