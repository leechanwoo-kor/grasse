<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
function BuyCheck(index) {
	if(form.option.value=='none'){
		alert("옵션을 선택해주세요");
		return false;
	}

	if (index == 1) {
    	document.form.action = '/grasse/cart/cart';
    }
    if (index == 2) {
       document.form.action = '/grasse/cart/addCart';
    }
	if (index == 3) {
	  alert('관심상품으로 등록되었습니다.');
	}
	   document.form.submit();
}
</script>

<script>
    function fnMove(divId){
        var offset = $("."+divId).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>

<style>
.product_about font {
    margin: -50px;
}
.btnArea input {
    padding: 0px 0px 7px 0px;
    margin: -10px 0px 0px 0;
}
.it-dt-thumb{
	width:49%;
	height:490px;
	float:left;
}
.it_dt_info{
	font-family: 'Lato','Nanum Gothic';
	width:48%;
	height:490px;
	float:right;
}
.it-name{
    text-align: left; 
    font-size: 25px; 
    color: #000000; 
    font-weight: bold;
}
.it-dt-info-style {
    vertical-align: top;
    line-height: 21px !important;
    text-align: left;
    font-size: 12pt;
}
.MK_price {
    margin: 0px 0 0 31px;
    font-size: 12px;
}
.MK_qty-ctrl {
    width: 150px!important;
}
.it-dt-btn-group{
}
.it-dt-sl-btn-group{
	width:100%;
	height: 50px;
	text-align:center;
	font-size:14pt;
}
.btn btn-default2 {
    padding: 4px 1px!important;
    width: 15%!important;
    height: 3%!important;
    margin: -17px 0 0 0!important;
}
</style>
</head>
<body>
<br><br>
<br><br>
<br>
<center>
<div class="container">
	<div class="it-dt-thumb">
		<img width="100%" height="100%" src="${images[0] }" />
	</div>         	

	<div class="it_dt_info">
		<form name="form" id="form" method="post">
			<input type="hidden" name="NAME" id="NAME" value="${item.NAME}">
			<p class="it-name">${item.NAME }</p>
			
			<div class="it-dt-info-style">
				<!-- 상품가격  -->
	            <input type="hidden" name="PRICE" id="PRICE" value="${item.PRICE }">
	            <p class="it-price"><br>판매가&emsp;&emsp;${item.PRICE }원</p>
					
				<!-- 용량 -->
				<select id="option" onchange="setOption(this)" onchange="this.blur();">
					<option value="none" selected disabled><필수> 용량을 선택해주세요.</option>
					<c:forEach items="${itemAttribute}" var="at">
						<c:if test="${at.COUNT==0 }">
							<option value="${at.PRICE}" style="color:#C0C0C0;" disabled>${at.ITEM_SIZE } (품절)</option>
						</c:if>
						<c:if test="${at.COUNT!=0 }">
							<option value="${at}" style="onfocus: #FFFFFF">${at.ITEM_SIZE }</option>
						</c:if>
					</c:forEach>
						
				</select>
				
				<!-- 사이즈, 색상, 개수출력 -->
				<div id="attribute">
					<ul class="MK_inner-opt-cm" id="total_price"></ul>
					<div id="MK_innerOptTotal" class="good_total">
						<p class="totalRight">
							<span class="MK_txt-total">TOTAL</span> 
							<span id="MK_txt-won" data-price="">&emsp;&emsp;0원</span>
						</p>
					</div>
				</div>
			</div>
			
			<div class="it-dt-btn-group">
				<!-- BUY,ADD CART추가하기 -->
				<a><input name="buy" onclick="BuyCheck(1);" type="image"
                           src="/grasse/resources/images/buy.PNG" /> 
                   <input type="hidden" name="ITEM_NO" id="ITEM_NO" value="${item.ITEM_NO }" /></a><br>
				<a><input name="cart" onclick="BuyCheck(2);" type="image"
                           src="/grasse/resources/images/cart.PNG" /></a><br>
			
				<input name="wishList" onclick="BuyCheck(4);" type="image" 
						src="/grasse/resources/images/wishlist.PNG" value="wishlist" />
			</div>
		</form>
	</div>
   
	<div class="it-dt-sl-btn-group">
		<input type="button" value="상품상세정보" name="itemDetailBtn" onclick="fnMove('it-dt-img')">
		<input type="button" value="상품후기" name="itemReviewBtn" onclick="fnMove('it-dt-rv')">
		<input type="button" value="상품문의" name="itemQaBtn" onclick="fnMove('it-dt-qa')">
	</div> 
	
	<!-- 상품 상세 이미지 -->
	<div class="it-dt-img" >
		<c:forEach items="${images }" var="image" begin="1">
			<img src="${image }"/>
		</c:forEach>
	</div>
	
	<div class="it-dt-sl-btn-group">
		<input type="button" value="상품상세정보" name="itemDetailBtn" onclick="fnMove('it-dt-img')">
		<input type="button" value="상품후기" name="itemDetailBtn" onclick="fnMove('it-dt-rv')">
		<input type="button" value="상품문의" name="itemDetailBtn" onclick="fnMove('it-dt-qa')">
	</div> 
	<div class="it-dt-rv">
		rv<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	
	<div class="it-dt-sl-btn-group">
		<input type="button" value="상품상세정보" name="itemDetailBtn" onclick="fnMove('it-dt-img')">
		<input type="button" value="상품후기" name="itemDetailBtn" onclick="fnMove('it-dt-rv')">
		<input type="button" value="상품문의" name="itemDetailBtn" onclick="fnMove('it-dt-qa')">
	</div> 
	<div class="it-dt-qa">
		qa<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
</center>

<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script>
var totprice = 0;
var r_optno = [];
function setOption(obj) {
	 var optno = $("#option option:selected").val();	//선택한 옵션
	 if (!optno || in_array(optno,r_optno)) return;

	//선택에 따라 li생성
	 var li = "<li class='MK_li_1_1'>"
		 		+ "<span class='it-size'>" + $("#option option:selected") + "</span>"
		 		//선택한 옵션번호랑 그 옵션의 ATTRIBUTE_NO, COUNT 저장
		 		+ "<input type='hidden' name='optno[]' value='" + optno +"'>"
		 		+ "<input type='hidden' name='attribute_no[]' " 
		 				+ "value='" + $("option:selected",$(obj)).attr("ATTRIBUTE_NO") + "'>" 
		 		+ "<input type='hidden' class='item-count' " 
		 				+ "value='" + $("option:selected",$(obj)).attr("COUNT") + "'>" 
		 		//선택한 갯수 
		 		+ "<div class='MK_qty-ctrl'>" 
		 			+ "<input type='text' name='ea[]' value='1' class='input_ea' size='2' maxlength='3'>"
		 			+ "<span class='ea'>"
		 			//갯수 조절 버튼
		 			+ "<a class='MK_btn-up'>"
		 			+ "<img src='/grasse/resources/images/btn_num_up.gif' alt='' /></a>" 
		 			+ "<a class='MK_btn-dw'>" 
		 			+ "<img src='/grasse/resources/images/btn_num_down.gif' alt='' /></a></span>"
		 			//가격 출력
		 			+ "<span class='MK_price' "
		 				+ "data-price='" + $("option:selected".PRICE) + "'>" 
		 				+($("option:selected".PRICE)) + "원</span>"
		 			//선택취소
		 			+ "<a href='#' optno='" + optno + "' class='MK_btn-del'>"
		 			+ "<img src='/grasse/resources/images/btn_close.gif' alt='' /></a></li></div>";


	 $("#total_price").append(li);
	 r_optno.push(optno);
	 var thisIdx = $(".input_ea").index(this);
	 var index = parseInt($(".input_ea").eq(thisIdx).val());
	 change_ea(this,1);
	 
	 var price = parseInt($("option:selected").val().attr("PRICE"));
	 alert(price);
	 price = price*inputEa;
	 price = parseInt(price);
	 if(totprice != 0){
	    totprice = $("#MK_txt-won").data("price");
	 }
	 totprice = totprice + price;
	 $("#MK_txt-won").data("price",totprice);
	 $("#MK_txt-won").html((totprice)+"원");
}


	//
	 $("#total_price").on("click", "li a.MK_btn-del", function(){
		 var ritem = $(this).attr("optno");
		 var thisIdx = $(".MK_btn-del").index(this); 
	     console.log("음"+thisIdx);
	     var price = $(".MK_price").eq(thisIdx).data("price");
		 console.log("zz"+price);
		 var totprice = $("#MK_txt-won").data("price");
		 totprice = totprice - price;
		 $("#MK_txt-won").data("price",totprice);
		 $("#MK_txt-won").html((totprice)+"원");
		 r_optno = $.grep(r_optno,function(v){ return v != ritem; });
		 $(".MK_li_1_1").eq(thisIdx).remove();
	});

	 //
	$("#total_price").on("click", "li a.MK_btn-up", function(e) {
		 var thisIdx = $(".MK_btn-up").index(this);    
		 change_ea(this,1);
		 var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
		 var mStock = parseInt($(".mstock").eq(thisIdx).val()); 
		 var price = parseInt($("option:selected",$('#option')).attr("price"));
		 $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
		 var total = $(".MK_price").eq(thisIdx).html((price*inputEa)+"원");
		 var totprice = $("#MK_txt-won").data("price");
		 console.log(totprice);
		 totprice = totprice + price;
		 $("#MK_txt-won").data("price",totprice);
		 $("#MK_txt-won").html((totprice)+"원");


	    // 재고 수량 이상 주문 체크
	    if(inputEa >= mStock) {
	       alert(mStock+"개 이상 주문하실 수 없습니다.");
	       change_ea(this,-1);
	         inputEa = parseInt($(".input_ea").eq(thisIdx).val());
	         var total = $(".MK_price").eq(thisIdx).html((price*inputEa)+"원");
	
	       return false ;
    	} 
   });
	   
   $("#total_price").on("keyup", "li input.input_ea", function(e){
       var thisIdx = $(".input_ea").index(this); 
       var mStock = parseInt($(".mstock").eq(thisIdx).val()); 
       var price = parseInt($("option:selected",$('#option')).attr("price"));
       var totprice = $("#MK_txt-won").data("price");

       $(this).val($(this).val().replace(/[^0-9]/g,""));
       if($(this).val() == "" || parseInt($(this).val()) <= 0) {
          $(this).val("1");
          return false ;
       }

       if(parseInt($(this).val()) > mStock) {
          alert(mStock+"개 이상 주문하실 수 없습니다.");
          $(this).val(mStock);
          var total = $(".MK_price").eq(thisIdx).html((price*parseInt($(this).val()))+"원");

          return false ;
       } else {
            var total = $(".MK_price").eq(thisIdx).html((price*parseInt($(this).val()))+"원");
            totprice = totprice + (price*(parseInt($(this).val())-1));
            $("#MK_txt-won").html((totprice)+"원");
       }
    });

	//선택한 옵션의 수량을 줄일경우
      $("#total_price").on("click", "li a.MK_btn-dw", function(e) {
       var thisIdx = $(".MK_btn-dw").index(this); 
       var inputEa = parseInt($(".input_ea").eq(thisIdx).val());

       if(inputEa == 1){
          alert("1개 이상 주문하셔야 합니다.");
          $(".input_ea").eq(thisIdx).val() == 1;   
          return false;
       } 

       change_ea(this,-1);
        inputEa = parseInt($(".input_ea").eq(thisIdx).val());
        var price = parseInt($("option:selected",$('#option')).attr("price"));
        $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
        var total = $(".MK_price").eq(thisIdx).html((price*inputEa)+"원");
        var totprice = $("#MK_txt-won").data("price");
        totprice = totprice - price;
        $("#MK_txt-won").data("price",totprice);
        $("#MK_txt-won").html((totprice)+"원");
       return false ;
      });
</script>

<script>
      function change_ea(obj,idx){
         var ea = parseInt($("input.input_ea",$(obj).parent().parent()).val()) + idx;
         
         if (ea<1){ alert("1개 이상을 주문하셔야 합니다"); return; }
         $("input.input_ea",$(obj).parent().parent()).val(ea);   
      }

      function in_array(val,arr){
         for (var i=0;i<arr.length;i++){ 
             if (arr[i]==val) return true; 
         }

         return false;
      }
</script>

</body>
</html>