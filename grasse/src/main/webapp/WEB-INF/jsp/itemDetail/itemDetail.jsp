<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	function fnMove(divId) {
		var offset = $("." + divId).offset();
		$('html, body').animate({
			scrollTop : offset.top - 100
		}, 400);
	}

	$(function() {
		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>

<style>
.product_about font {
	margin: -50px;
}

.btnArea input {
	padding: 0px 0px 7px 0px;
	margin: -10px 0px 0px 0;
}

.it-dt-thumb {
	width: 49%;
	height: 490px;
	float: left;
}

.it_dt_info {
	font-family: 'Lato', 'Nanum Gothic';
	width: 45%;
	height: 490px;
	float: right;
	position: relative;
	vertical-align: top;
	line-height: 21px !important;
	text-align: left;
	font-size: 12pt;
	padding: 5px;
}

.it-name {
	text-align: left;
	font-size: 25px;
	color: #000000;
	font-weight: bold;
}

.MK_price {
	margin: 0px 0 0 31px;
	font-size: 12px;
}

.MK_qty-ctrl {
	width: 300px !important;
}

.MK_inner-opt-cm {
	position: absolute;
	max-height: 200px;
	width: 100%;
	overflow: auto;
}

.good_total {
	position: absolute;
	bottom: 120px;
}

.it-dt-btn-group {
	position: absolute;
	bottom: 0px;
	max-width: 100%;
	height: auto;
}

.it-dt-sl-btn-group {
	width: 100%;
	height: 25px;
	text-align: center;
	font-size: 14pt;
	position: relative;
	vertical_align: top;
	border-radius: 1em;
	background-color: #A4A4A4;
}

.it-dt-sl-btn-group>.Btn {
	background-color: transparent;
	color: #FFFFFF;
	width: 33%;
}

.it-dt-img {
	
}

.btn btn-default2 {
	padding: 4px 1px !important;
	width: 15% !important;
	height: 3% !important;
	margin: -17px 0 0 0 !important;
}
</style>
</head>
<body>
	<div class="container justify-content-center py-5">
		<div class="it-dt">
			<div class="it-dt-thumb">
				<img width="100%" height="100%" src="${map.THUMBNAIL }" />
			</div>

			<div class="it_dt_info">
				<form name="form" id="form" method="post">
					<p class="it-name">${map.NAME }</p>
					<input type="hidden" name="ITEM_NO" id="ITEM_NO"
						value="${map.ITEM_NO }"> <input type="hidden" name="TOTAL"
						class="TOTAL" value=""> <input type="hidden"
						name="ATTRIBUTE" class="ATTRIBUTE" value=""> <input
						type="hidden" name="MEMBER_ID" id="MEMBER_ID"
						value="${sessionScope.member.MEMBER_ID}">



					<!-- 상품가격  -->
					<div style="height: 110px; position: static;">
						<p style="height: 20px">
							<br>판매가&emsp;&emsp;${map.PRICE }원
						</p>
						<p>
							<br>배송비&emsp;&emsp;무료
						</p>


						<!-- 용량 -->
						<div style="width: 18%; height: 30px; float: left;">용량</div>
						<div style="height: 30px; float: left; vertical-align: middle">
							<select id="option" name="SIZE" onchange="setOption(this)"
								onchange="this.blur();">
								<option value="none" selected disabled><필수> 용량을
									선택해주세요.</option>
								<c:forEach items="${itemAttribute}" var="at">
									<c:if test="${at.COUNT==0 }">
										<option value="" style="color: #C0C0C0;" disabled>${at.ITEM_SIZE }
											(품절)</option>
									</c:if>
									<c:if test="${at.COUNT!=0 }">
										<option
											value="${at.ATTRIBUTE_NO},${at.ITEM_SIZE},${at.ITEM_PRICE}"
											style="onfocus: #FFFFFF">${at.ITEM_SIZE }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<br>
					</div>


					<!-- 사이즈, 색상, 개수출력 -->
					<div id="attribute" class="py-3">
						<ul class="MK_inner-opt-cm" id="total_price"></ul>
						<div id="MK_innerOptTotal" class="good_total">
							<p class="totalRight">
								<span class="MK_txt-total">TOTAL&emsp;&emsp;&emsp;&emsp;</span>
								<span id="MK_txt-won" data-price="0">0원</span>
							</p>
						</div>
					</div>

					<div class="it-dt-btn-group">
						<!-- BUY,ADD CART추가하기 -->
						<!-- 구매하기 -->
						<a><input type="image" class="buy" id="buy"
							src="/grasse/resources/images/buy.PNG" onclick="BuyCheck(1);">
						</a><br>
						<!-- 장바구니 담기 -->
						<a><input class="cart" onclick="BuyCheck(2);" type="image"
							src="/grasse/resources/images/cart.PNG" /></a><br>
						<!-- 찜 하기 -->
						<input class="wishList" onclick="WishCheck();" type="image"
							src="/grasse/resources/images/wishlist.PNG" value="wishlist" />

					</div>
				</form>


				<a id="MOVE_TOP_BTN" href="#"
					style="position: fixed; right: 20px; bottom: 20px; z-index: 99;">
					<img src="/grasse/resources/images/top_btn.png" />
				</a>

			</div>
		</div>
		<div class="py-5">
			<button class="it-dt-sl-btn-group" width="100%">
				<input type="button" value="상품상세정보" class="Btn"
					onclick="fnMove('it-dt-img')"> <input type="button"
					value="상품후기 (0)" class="Btn" onclick="fnMove('it-dt-rv')">
				<input type="button" value="상품문의 (0)" class="Btn"
					onclick="fnMove('it-dt-qa')">
			</button>
		</div>

		<!-- 상품 상세 이미지 -->
		<div class="it-dt-img py-5">
			<img src="${map.CONTENT }" />
		</div>
		<div class="it-dt-rv"></div>
		<div class="it-dt-qa"></div>

	</div>
	<!-- end container -->
	<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script>
		var totprice = 0;
		var r_attrno = [];
		var r_count = [];
		var r_size = [];
		var r_price = [];

		function setOption(obj) {
			//선택한 옵션가져오기.  optno[0]=ATTRIBUTE_NO, optno[1]=ITEM_SIZE, optno[2]=PRICE
			var optno = $("#option option:selected").val().split(",");
			var attrno = parseInt(optno[0]);
			var size = optno[1];
			var price = parseInt(optno[2]);

			if (!optno)
				return;
			if (in_array(attrno, r_attrno)) {
				alert("이미 선택된 옵션입니다.");
				return;
			}

			//선택에 따라 li생성
			var li = "<li class='MK_li'>"
					+ "<br>"
					+ size
					+ "<div class='MK_qty-ctrl'>"
					//선택한 갯수 
					+ "<input type='text' value='1' class='input_ea' size='2' maxlength='3' this_price='" + price + "'>"
					+ "<input type='hidden' class='ATTRIBUTE_NO' name='ATTRIBUTE_NO' value='" + attrno + "'>"
					+ "<input type='hidden' class='SIZE' name='SIZE' value='"+size+"'>"
					//갯수 조절 버튼
					+ "<span class='ea'>"
					+ "<a this_price='" + price + "' class='MK_btn-up'>"
					+ "<img src='/grasse/resources/images/btn_num_up.gif' alt='' /></a>"
					+ "<a this_price='" + price + "' class='MK_btn-dw'>"
					+ "<img src='/grasse/resources/images/btn_num_down.gif' alt='' /></a></span>"
					//가격 출력
					+ "<span class='MK_price' "
		 				+ "data-price='" + price + "'>"
					+ price
					+ "원</span>"
					//선택취소
					+ "<a href='#' this_price='" + price + "' class='MK_btn-del'>"
					+ "<img src='/grasse/resources/images/btn_close.gif' alt='' /></a></div></li>";

			$("#total_price").append(li);
			r_attrno.push(parseInt(attrno));
			//alert(r_attrno);
			r_price.push(parseInt(price));
			r_size.push(size);

			var thisIdx = $(".input_ea").index(this);
			var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
			var index = parseInt($(".input_ea").eq(thisIdx).val());

			change_ea(this, 1);

			price = price * inputEa;
			if (totprice != 0) {
				totprice = $("#MK_txt-won").data("price");
			}
			totprice = totprice + price;
			$("#MK_txt-won").data("price", totprice);
			$("#MK_txt-won").html((totprice) + "원");
		}

		//
		$("#total_price").on(
				"click",
				"li a.MK_btn-del",
				function() {
					var thisIdx = $(".MK_btn-del").index(this);
					//alert(thisIdx);
					var ritem = parseInt($("input[name=ATTRIBUTE_NO]").eq(
							thisIdx).val());

					//alert(ritem);
					//alert(r_attrno);

					var price = parseInt($(this).attr("this_price"));
					//alert(price);
					var size = $("input[name=SIZE]").eq(thisIdx).val();
					//alert(size);
					var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
					var totprice = parseInt($("#MK_txt-won").data("price"));

					totprice = totprice - (price * inputEa);
					$("#MK_txt-won").data("price", totprice);
					$("#MK_txt-won").html((totprice) + "원");

					r_attrno = $.grep(r_attrno, function(v) {
						return v != ritem;
					});
					r_count = $.grep(r_count, function(v) {
						return v != inputEa;
					});
					r_price = $.grep(r_price, function(v) {
						return v != price;
					});
					r_size = $.grep(r_size, function(v) {
						return v != size;
					});

					$(".MK_li").eq(thisIdx).remove();
				});

		//
		$("#total_price")
				.on(
						"click",
						"li a.MK_btn-up",
						function(e) {
							var thisIdx = $(".MK_btn-up").index(this);
							change_ea(this, 1);
							var inputEa = parseInt($(".input_ea").eq(thisIdx)
									.val());
							var price = parseInt($(this).attr("this_price"));
							var mStock = parseInt($(".mstock").eq(thisIdx)
									.val());

							$(".MK_price").eq(thisIdx).data("price",
									(price * inputEa));
							var total = $(".MK_price").eq(thisIdx).html(
									(price * inputEa) + "원");
							var totprice = parseInt($("#MK_txt-won").data(
									"price"));
							totprice = totprice + price;
							$("#MK_txt-won").data("price", totprice);
							$("#MK_txt-won").html((totprice) + "원");

							// 재고 수량 이상 주문 체크
							if (inputEa >= mStock) {
								alert(mStock + "개 이상 주문하실 수 없습니다.");
								change_ea(this, -1);
								inputEa = parseInt($(".input_ea").eq(thisIdx)
										.val());
								var total = $(".MK_price").eq(thisIdx).html(
										(price * inputEa) + "원");
								return false;
							}
						});

		$("#total_price").on(
				"keyup",
				"li input.input_ea",
				function(e) {
					var thisIdx = $(".input_ea").index(this);
					var mStock = parseInt($(".mstock").eq(thisIdx).val());
					var price = parseInt($(this).attr("this_price"));
					var totprice = $("#MK_txt-won").data("price");

					$(this).val($(this).val().replace(/[^0-9]/g, ""));
					if ($(this).val() == "" || parseInt($(this).val()) <= 0) {
						$(this).val("1");
						return false;
					}

					if (parseInt($(this).val()) > mStock) {
						alert(mStock + "개 이상 주문하실 수 없습니다.");
						$(this).val(mStock);
						var total = $(".MK_price").eq(thisIdx).html(
								(price * parseInt($(this).val())) + "원");

						return false;
					} else {
						var total = $(".MK_price").eq(thisIdx).html(
								(price * parseInt($(this).val())) + "원");
						totprice = totprice
								+ (price * (parseInt($(this).val()) - 1));
						$("#MK_txt-won").html((totprice) + "원");
					}
				});

		//선택한 옵션의 수량을 줄일경우
		$("#total_price")
				.on(
						"click",
						"li a.MK_btn-dw",
						function(e) {
							var thisIdx = $(".MK_btn-dw").index(this);
							var inputEa = parseInt($(".input_ea").eq(thisIdx)
									.val());
							var price = parseInt($(this).attr("this_price"));

							if (inputEa == 1) {
								alert("1개 이상 주문하셔야 합니다.");
								$(".input_ea").eq(thisIdx).val() == 1;
								return false;
							}

							change_ea(this, -1);
							inputEa = parseInt($(".input_ea").eq(thisIdx).val());
							$(".MK_price").eq(thisIdx).data("price",
									(price * inputEa));
							var total = $(".MK_price").eq(thisIdx).html(
									(price * inputEa) + "원");
							var totprice = $("#MK_txt-won").data("price");
							totprice = totprice - price;
							$("#MK_txt-won").data("price", totprice);
							$("#MK_txt-won").html((totprice) + "원");
							return false;
						});
	</script>

	<script>
		function change_ea(obj, idx) {
			var ea = parseInt($("input.input_ea", $(obj).parent().parent())
					.val())
					+ idx;

			if (ea < 1) {
				alert("1개 이상을 주문하셔야 합니다");
				return;
			}
			$("input.input_ea", $(obj).parent().parent()).val(ea);

		}

		function in_array(val, arr) {
			for (var i = 0; i < arr.length; i++) {
				if (arr[i] == val)
					return true;
			}

			return false;
		}

		//itemDetail
		function BuyCheck(index) {
			if (form.option.value == 'none') {
				alert("옵션을 선택해주세요");
				return false;
			}

			$(".input_ea").each(function() {
				r_count.push(parseInt($(this).val()));
			});

			var ATTRIBUTE = new Array();
			var ITEM_NO = $("input[name=ITEM_NO]").val();
			var THUMBNAIL = '<c:out value="${map.THUMBNAIL}"/>';
			var NAME = '<c:out value="${map.NAME}"/>';
			var totprice = parseInt($("#MK_txt-won").data("price"));
			//alert(totprice);

			for (var i = 0; i < r_attrno.length; i++) {
				var aJson = {
					ITEM_NO : ITEM_NO,
					THUMBNAIL : THUMBNAIL,
					NAME : NAME,
					ATTRIBUTE_NO : r_attrno[i],
					SIZE : r_size[i],
					PRICE : r_price[i],
					COUNT : r_count[i]
				};
				ATTRIBUTE.push(aJson);
			}

			$("input[type=hidden][name=ATTRIBUTE]").val(
					JSON.stringify(ATTRIBUTE));
			$("input[type=hidden][name=TOTAL]").val(totprice);

			if (index == 1) {
				document.form.action = '/grasse/order/order.do';
			}
			if (index == 2) {
				document.form.action = "/grasse/cart/addCart.do";
			}
			document.form.submit();
		}

		function WishCheck() {
			var memberId = $("input[name=MEMBER_ID]").val();
			var itemNo = $("input[name=ITEM_NO]").val();

			if (memberId != "") {
				aJson = {
					MEMBER_ID : memberId,
					ITEM_NO : itemNo
				};

				$.ajax({
					url : "/grasse/myWish/addWish.do",
					type : "POST",
					data : JSON.stringify(aJson),
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						alert("관심상품으로 등록되었습니다.");
						document.form.action = "/grasse/login/loginForm.do?ITEM_NO="+itemNo;
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

			} else {
				document.form.action = "/grasse/login/loginForm.do";
			}

			document.form.submit();
		}
	</script>

</body>
</html>