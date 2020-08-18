<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>


// 주소 API
   function execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.   
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                  }
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     document.getElementById("RECIPIENT_EXTRAADDR").value = extraAddr;
                  } else {
                     document.getElementById("RECIPIENT_EXTRAADDR").value = '';
                  }
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('RECIPIENT_ZIPCODE').value = data.zonecode;
                  document.getElementById("RECIPIENT_ADDR1").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("RECIPIENT_ADDR2").focus();
               }
         }).open();
   }
</script>

<script type="text/javascript">
function check(){
   var f = document.Order_form;
   if(f.RECIPIENT_NAME.value == ""){
      alert("받는분을 입력해주십시오");
      f.RECIPIENT_NAME.focus();
      return false;
   }
   if(f.RECIPIENT_ADDR1.value == ""){
      alert("주소를 입력해주십시오.");
      f.RECIPIENT_ADDR1.focus();
      return false;
   }
   if(f.RECIPIENT_ADDR2.value == ""){
      alert("상세주소를 입력해주십시오.");
      f.RECIPIENT_ADDR2.focus();
      return false;
   }
   if(f.RECIPIENT_PHONE.value == ""){
      alert("전화번호를 입력해주십시오.");
      f.RECIPIENT_PHONE.focus();
      return false;
   }
   if(f.PAYMENT.value == ""){
      alert("결제방법을 선택해주세요.");
      f.PAYMENT.focus();
      return false;
   }
   if(f.chk_purchase_agreement.checked == false){
      alert("구매진행에 동의해 주십시오.");
      f.chk_purchase_agreement.focus();
      return false;
   }
   if(f.DEPOSIT_.value=="-1"){
      alert("은행을 선택해주세요");
      return false;
   }
   // 아이템 받아오면 풀기
   if(f.TOTALSUM2.value<0){
      alert("0원보다 큰 금액으로 구매해주세요.");
      
      return false;
   }
   if(f.selected.checked == false){
      alert("상품을 선택해주세요.");
      return false;
   }
   if(f.usePoint.value == ""){
      alert("포인트를 입력해주세요.");
      f.usePoint.focus();
      return false;
   }
}
//F5키 막기
window.onkeydown = function() {
   var kcode = event.keyCode;
   if(kcode == 116) event.returnValue = false;
}

function comma(str){
   str = String(str);
   return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
var accountPrice2 = 0;




var sum = 0;
var delivery = 0;
var totalSum = '<c:out value="${TOTAL}"/>';
var discountPrice = 0;
var usePoint = 0;
var memberPoint = parseInt('<c:out value="${memberInfo.POINT}"/>');
var accountPrice = 0;

function discount_Fun(){
   if($("#usePoint").val()!=null){
      usePoint = parseInt($("#usePoint").val());
      alert(usePoint);
      if(usePoint > memberPoint){
         $("#usePoint").val("0");
         alert("사용가능 포인트보다 적은 금액을 입력해주세요");
         return false;
      } else if(usePoint > totalSum){
		$("#usePoint").val(totalSum);
      } else {
		$("#usePoint").val(usePoint);
          }

      $(".totalPrice2").val(totalSum);
      
      discountPrice = parseInt($("#usePoint").val()) + 0;
      accountPrice = totalSum - discountPrice;
      point = parseInt(accountPrice/10);
      
      $("#use_point").html('<li>' + "-" + usePoint + "원 할인" + '</li>');
      $(".totalSum2").html(comma(accountPrice)+" 원");
       $(".discount").html("-"+comma(discountPrice)+" 원");
       $("#totalSum").data("total", accountPrice);
       $("#totalSum").html((accountPrice) + "원");
       $(".memberPoint").html(memberPoint -usePoint);
       $(".usePoint2").val(usePoint);
       $(".discount2").val(discountPrice);
       $(".totalSum2").val(accountPrice);
       $(".pointSum").html(comma(point)+" P");
       $("span.pointSum").data("point", point);
       $(".pointSum2").val($(".pointSum").data("point"));
       
   } 
}
</script>

<meta charset="UTF-8">
<title>주문</title>
</head>
<body>
   <div class="container" style="font-family: 'Lato', 'Nanum Gothic';">
      <div align="center">
         <h4>ORDER</h2>
      </div>
      <div align="center">
         <h5>혜택정보</h5>
         <div>
            <div>
               <c:if test="${memberInfo.NAME != null }">
                  <p>
                     <strong>${memberInfo.MEMBER_ID }</strong>님 안녕하세요<br /> 상품 구매시
                     10%의 포인트를 적립받으실 수 있습니다.<br /> <a>가용포인트 : <strong><fmt:formatNumber
                              value="${memberInfo.POINT }" pattern="#,###" /> P</strong>
                     </a>
                  </p>
               </c:if>
               <c:if test="${memberInfo.MEMBER_ID == null }">
                  <p>비회원주문입니다. 회원가입시 포인트 혜택을 받으실 수 있습니다.</p>
               </c:if>
            </div>
         </div>
      </div>
      <!-- 주문내역 -->
      <form name="Order_form" action="/grasse/order/orderInsert.do"
         onsubmit="return check()">
         <div>
            <div align="center">
               <h3>주문내역</h3>
            </div>
            <div align="center">
               <table border="1" style="text-align:center;">
                  <caption>기본배송</caption>
                  <colgroup>
                     <col style="width: 92px">
                     <col style="width: 138px">
                     <col style="width: 98px">
                     <col style="width: 75px">
                     <col style="width: 58px">
                     <col style="width: 98px">
                     <col style="width: 85px">
                     <col style="width: 98px">
                  </colgroup>
                  <thead>
                     <tr>
                        <th scope="col">이미지</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">판매가</th>
                        <th scope="col">수량</th>
                        <th scope="col">적립포인트</th>
                        <th scope="col">배송비</th>
                        <th scope="col">합계</th>
                  </thead>
                  <tfoot class="rigth">
                     <tr>
                        <td colspan="8"><span>[기본배송]</span> 상품구매금액 <strong
                           class="totalPrice"> ${TOTAL } 원</strong> + 배송비 <strong class="delivery">0
                              원</strong> = 합계 : <strong><span class="totalPrice">${TOTAL } 원</span></strong>
                        </td>
                     </tr>
                  </tfoot>
                  <tbody>
                     <c:choose>
                        <c:when test="${fn:length(list)>0 }">
                           <c:forEach items="${list }" var="row" varStatus="stat">
                              <tr>
                                 <td class="thumb" align="center">
                                    <!-- 아이템 링크 확인 --> <a
                                    href="/grasse/itemDetail/item.do?ITEM_NO=${row.ITEM_NO }"> <img
                                       width="75" height="75"
                                       src="${row.THUMBNAIL }" />
                                 </a>
                                 </td>
                                 <td align="center"><a
                                    href="/grasse/item/detail?ITEM_NO=${row.ITEM_NO }"><strong>${row.NAME }</strong>
                                 </a>
                                    <div>[옵션:${row.SIZE}]</div></td>
                                 <td align="center">
                                    <div>
                                       <span class="price" value="{row.PRICE}"><strong>
                                             <fmt:formatNumber value="${row.PRICE }" pattern="#,###" />원
                                       </strong></span>
                                    </div>
                                 </td>
                                 <td align="center">
                                    <fmt:parseNumber value="${row.COUNT }" integerOnly="true" />개<c:if
                                       test="${row.WISHLIST_NO != null }">1</c:if>
                                 </td>
                                 <td align="center"><c:if
                                       test="${memberInfo.NAME != null }">
                                       <span class="point" value="${row.PRICE/10*row.COUNT }">
                                          <fmt:formatNumber value="${row.PRICE/10*row.COUNT }"
                                             pattern="#,###" />P
                                       </span>
                                    </c:if>
                                    <c:if test="${memberInfo.NAME == null }">0P</c:if></td>
                                 <td align="center">무료배송</td>
                                 <td align="center"><c:choose>
                                       <c:when test="${row.WISHLIST_NO != null }">
                                          <span> <strong>${row.PRICE }</strong>
                                          </span>
                                       </c:when>
                                       <c:otherwise>
                                          <span class="totprice" value="${row.PRICE * row.COUNT }">
                                             <strong><fmt:formatNumber
                                                   value="${row.PRICE * row.COUNT }" pattern="#,###" />원</strong>
                                          </span>
                                       </c:otherwise>
                                    </c:choose></td>
                              </tr>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                           <tr>
                              <td colspan="9">조회된 결과가 없습니다.</td>
                           </tr>
                        </c:otherwise>
                     </c:choose>
                  </tbody>
               </table>
            </div>
         </div>
         <div align="center">•상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</div>
         <!-- 배송 정보 -->
         <div align="center">
            <div align="center">
               <h3>배송정보</h3>
               <p>
                  <font color="red">*</font>필수입력사항
               </p>
            </div>
            <div align="center">
               <table border="1">
                  <colgroup>
                     <col style="width: 139px;">
                     <col style="width: auto;">
                  </colgroup>
                  <!-- 배송지 정보 -->
                  <tbody class="">
                     <c:if test="${memberInfo.NAME != null }">
                        <tr class="">
                           <th scope="row">배송지 선택</th>
                           <td>
                              <div>
                                 <input id="sameaddr" name="sameaddr" value="M" type="radio">
                                 <label for="sameaddr">회원 정보와 동일</label> <input id="sameaddr1"
                                    name="sameaddr1" value="F" type="radio"> <label
                                    for="sameaddr1">새로운 배송지</label>
                              </div>
                           </td>
                        </tr>
                     </c:if>
                     <tr>
                        <th scope="row">받으시는 분<font color="red">*</font>
                        </th>
                        <td><input type="text" id="RECIPIENT_NAME"
                           name="RECIPIENT_NAME"></td>
                     </tr>
                     <tr>
                        <th scope="row">주소<font color="red">*</font></th>
                        <td><input type="text" id="RECIPIENT_ZIPCODE"
                           name="RECIPIENT_ZIPCODE" placeholder="우편번호"> <input
                           type="button" value="우편번호" onclick="execDaumPostcode()"><br>
                           <input type="text" id="RECIPIENT_ADDR1" name="RECIPIENT_ADDR1"
                           placeholder="기본주소"> <input type="text"
                           id="RECIPIENT_ADDR2" name="RECIPIENT_ADDR2" placeholder="상세주소"><br />
                           <input type="text" id="RECIPIENT_EXTRAADDR"
                           name="RECIPIENT_EXTRAADDR" placeholder="참고항목"></td>
                     </tr>
                     <tr>
                        <th scope="row">전화번호<font color="red">*</font></th>
                        <td><input type="text" id="RECIPIENT_PHONE"
                           name="RECIPIENT_PHONE" placeholder="-없이 번호만 입력해주세요" maxlength="11"> <input
                           type="hidden" id="MEMBER_ID" name="${MEMBER_ID }"></td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <c:if test="${memberInfo.NAME != null }">
            <div align="center">
               <h3>할인정보</h3>
            </div>
            <div align="center">
               <table border="1">
                  <tbody>
                     <tr>
                        <th scope="row">적립금</th>
                        <td>
                           <p>
                              <input type="text" id="usePoint" onblur="discount_Fun()"
                                 value="0"> 원 (총 사용가능 적립금 : <strong><span
                                 class="memberPoint">${memberInfo.POINT }</span></strong>원) <input
                                 type="hidden" name="USEPOINT" class="usePoint2">

                           </p>
                           <ul class="info">
                              <li>상품금액 넘게 사용은 불가능합니다.</li>
                           </ul>
                        </td>
                        <td>
                           <ul>
                              <li>총 적립예정 포인트 : <span class="pointSum"><strong><fmt:formatNumber
                                          value="" pattern="#,###" /></strong>P
                              </span> <input type="hidden" name="ADDPOINT" class="pointSum2" value="">
                              </li>
                           </ul>
                           <ul id="use_point">
                           </ul>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </c:if>
         <c:if test="${memberInfo.NAME == null }">
            <input type="hidden" id="DISCOUNT2" value="0">
            <input type="hidden" id="usePoint" onblur="discount_Fun()" value="0">
         </c:if>

         <!-- 결제 금액 -->
         <div align="center">
            <h3>결제 금액</h3>
         </div>
         <div align="center">
            <div>
               <table border="1">
                  <caption>결제 금액</caption>
                  <colgroup>
                     <col style="width: 33.33%">
                     <col style="width: 33.33%">
                     <col style="width: 33.33%">
                  </colgroup>
                  <thead>
                     <tr>
                        <th scope="col"><strong>총 주문 금액</strong></th>
                        <th scope="col"><strong> - 총</strong> <strong>할인</strong></th>
                        <th scope="col"><strong>총 결제 금액</strong></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>
                           <div>
                              <strong><span class="totalPrice">${TOTAL } 원</span></strong> <input
                                 type="hidden" name="TOTALPRICE" class="totalPrice2">
                           </div>
                        </td>
                        <td>
                           <div>
                              <strong><span class="discount" data-discount-"0"> - 0 원</span></strong> <input
                                 type="hidden" name="DISCOUNT2" class="discount2" >
                           </div>
                        </td>
                        <td>
                           <div>
                              <strong>=</strong><strong><span id="totalSum" data-total="0"> 0 원</span></strong> <input type="hidden"
                                 name="TOTALSUM2" class="totalSum2">
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <!-- 결제수단 -->
         <div align="center">
            <h3>결제수단</h3>
         </div>
         <div align="center">
            <div>
               <div>
                  <span> <input type="radio" id="무통장입금" name="PAYMENT"
                     value="무통장입금" checked="checked">

                  </span>
               </div>
               <div>
                  <!-- 무통장입금 -->
                  <table border="1">
                     <caption>무통장입금</caption>
                     <colgroup>
                        <col style="width: 139px">
                        <col style="width: auto">
                     </colgroup>
                     <tbody>

                        <!-- 
               <tr>
                  <th scope="row">입금자명</th>
                  <td>
                     <input type="text" name="DEPOSIT_NAME" id="DEPOSIT_NAME">
                  </td>
               </tr>
               <tr>
                  <th scope="row">계좌번호</th>
                  <td>
                     <input type="text" name="DEPOSIT_BANK" id="DEPOSIT_BANK">
                  </td>
               </tr>
               -->
                        <tr>
                           <th scope="row">입금은행</th>
                           <td><select id="DEPOSIT_" name="DEPOSIT_">
                                 <option value="-1">::: 선택해 주세요. :::</option>
                                 <option value="bank:농협:0000-00-000000-00:Grasse">농협:0000-00-000000-00
                                    Grasse</option>
                                 <option value="bank:국민:000-00-00000-0000:Grasse">국민:000-00-00000-0000
                                    Grasse</option>
                           </select></td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <!-- 최종결제금액 -->
         <div align="center">
            <h4>
               <strong>무통장 입금</strong> <span>최종결제금액</span>
            </h4>
            <p>
               <span class="totalSum"> </span>
            </p>
            <p>
               <input type="checkbox" id="chk_purchase_agreement"
                  name="chk_purchase_agreement[]" value="1"> <label
                  for="chk_purchase_agreement">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
            </p>
            <div>
               <input type="submit" name="submit" value="결제하기" />
            </div>
         </div>
      </form>
   </div>
</body>

<script>

$(document).ready(function(){
   
   $("#usePoint").trigger("blur");

   $("input:radio[name=sameaddr]").click(function(){
      CopyInfo();
   })
   $("input:radio[name=sameaddr1]").click(function(){
      deleteInfo();
   })
   $("btn_payment").click(function(){
      e.preventDefault();
      fn_Insert();
   })

   $("input:submit[name=submit]").click(function(){
      discount_Fun();
   })
});
function fn_Insert(){
   var comSubmit = new ComSubmit();
   comSubmit.setUrl("c:url value='/grasse/order/insert.do'/>");
   comSubmit.addParam("key", "value");
   comSubmit.submit();
}
function CopyInfo(){
   $.ajax({
      type : "POST",
      url : "/grasse/order/getMemberInfo.do",
      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
      dataType : 'json',
      success : function(json){
         var jsonData = json;

         $('#RECIPIENT_NAME').val(jsonData[0].NAME);
         $('#RECIPIENT_ZIPCODE').val(jsonData[0].ZIPCODE);
         $('#RECIPIENT_ADDR1').val(jsonData[0].ADDR1);
         $('#RECIPIENT_ADDR2').val(jsonData[0].ADDR2);
         $('#RECIPIENT_EXTRAADDR').val(jsonData[0].EXTRAADDR);
         $('#RECIPIENT_PHONE').val(jsonData[0].PHONE);
         $("input:radio[name='sameaddr1']:radio").prop("checked", false);
      },
      error : function(e){
         alert('error'+ e);
      }
   });
}
function deleteInfo(){
   $('#RECIPIENT_NAME').val("");
   $('#RECIPIENT_ZIPCODE').val("");
   $('#RECIPIENT_ADDR1').val("");
   $('#RECIPIENT_ADDR2').val("");
   $('#RECIPIENT_EXTRAADDR').val("");
   $('#RECIPIENT_PHONE').val("");
   $("input:radio[name='sameaddr']:radio").prop("checked", false);
}

</script>

</html>