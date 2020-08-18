<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script>
window.onkeydown = function() {
	   var kcode = event.keyCode;
	   if(kcode == 116) event.returnValue = false;
	}


/*
<!-- 주문 상품 정보 -->
<div>
   <div>
      <h3>주문 상품 정보</h3>
   </div>
   <!-- 배송 -->
   <table border="1" align="center">
      <caption>배송</caption>
      <thead>
         <tr>
            <th scope="col">이미지</th>
            <th scope="col">상품정보</th>
            <th scope="col">판매가</th>
            <th scope="col">수량</th>
            <th scope="col">적립금</th>
            <th scope="col">배송</th>
            <th scope="col">합계</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(orderItemList) > 0}">
               <c:forEach items="${orderItemList }" var="row" varStatus="stat">
                  <tr>
                     <td align="center"><a
                        href="/grasse/item/detail?ITEM_NO=${row.ITEM_NO }"> <img
                           width="75" height="75"
                           src="${row.THUMBNAIL }" />
                     </a></td>
                     <td align="center"><a
                        href="/grasse/item/detail?ITEM_NO=${row.ITEM_NO }"> <strong>${row.NAME }</strong>
                     </a>
                        <div class="option">[옵션: ${row.ITEM_SIZE}]</div></td>
                     <td align="center"><strong><fmt:formatNumber
                              value="${row.PRICE }" pattern="#,###" />원</strong></td>
                     <td align="center">${row.COUNT }</td>
                     <td align="center"><c:if
                           test="${memberInfo.NAME != null }">
                           <span class="point" value="${row.PRICE*row.COUNT/10 }">
                              <fmt:formatNumber value="${row.PRICE*row.COUNT/10 }"
                                 pattern="#,###" />P
                           </span>
                        </c:if></td>
                     <td align="center">무료배송</td>
                     <td align="center"><strong><fmt:formatNumber
                              value="${row.COUNT*row.PRICE}" pattern="#,###" />원</strong></td>
                  </tr>
               </c:forEach>
            </c:when>
         </c:choose>
      </tbody>
   </table>
</div>*/
</script>
<meta charset="UTF-8">
<title>주문완료</title>
</head>
<body>
   <div align="center">
      <form id="frm" align="center">
         <div align="center">
            <!-- 주문완료 -->
            <div align="center">
               <p align="center">
                  <strong>고객님의 주문이 완료되었습니다.</strong> 주문내역 및 배송에 관한 안내는 <br> <a
                     href="/grasse/mypage/orderList.do">주문조회</a>를 통하여 확인가능합니다.
               </p>
               <div align="center"></div>
               <br />주문자 : <strong>${orderInfo.RECIPIENT_NAME }</strong> <br />주문번호
               : <strong>${orderInfo.ORDER_NO }</strong> <br />주문일자 : <strong><fmt:formatDate
                     value="${orderInfo.REGDATE }" pattern="yyyyMMdd hh:mm" /></strong> <br />주문번호는
               주문조회시 필요하므로 기억해 주시기 바랍니다. <br />
            </div>
         </div>
         <!-- 결제정보 -->
         <div align="center">
            <div align="center">
               <h3>결제정보</h3>
            </div>
            <div align="center">
               <table border="1" align="center">
                  <caption>결제정보</caption>
                  <tbody align="center">
                     <tr align="center">
                        <th scope="row">최종결제금액</th>
                        <td class="price"><strong><fmt:formatNumber
                                 value="${TOTALSUM }" pattern="#,###" />원</strong></td>
                     </tr>
                     <tr>
                        <th scope="row">결제수단</th>
                        <td>
                           <p>
                              <span>(${orderInfo.PAYMENT }) ${DEPOSIT_ } <%-- 
                                 임금자 : ${orderInfo.RECIPIENT_NAME },
                                 계좌번호 : ${orderInfo.RECIPIENT_BANK }
                               --%></span>
                           </p>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         
         
         <!-- 결제금액 -->
         <div align="center">
            <div>
               <table border="1" align="center">
                  <caption>결제금액</caption>
                  <thead>
                     <tr>
                        <th scope="col"><span>총 주문 금액</span></th>
                        <th scope="col"><span>총 할인 금액</span></th>
                        <th scope="col">총 결제금액</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>
                           <div>
                              <strong><fmt:formatNumber value="${TOTALPRICE }"
                                    pattern="#,###" /></strong>원
                           </div>
                        </td>
                        <td>
                           <div>
                              <strong><fmt:formatNumber value="${DISCOUNT }"
                                    pattern="#,###" /></strong>원
                           </div>
                        </td>
                        <td>
                           <div>
                              <strong><fmt:formatNumber value="${TOTALSUM }"
                                    pattern="#,###" /></strong>원
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <!-- 배송지정보 -->
         <div align="center">
            <div align="center">
               <h3>배송지정보</h3>
            </div>
            <div align="center">
               <table border="1" align="center">
                  <tbody>
                     <tr>
                        <th scope="row">받으시는 분</th>
                        <td><span>${orderInfo.RECIPIENT_NAME }</span></td>
                     </tr>
                     <tr>
                        <th scope="row">우편번호</th>
                        <td><span>${orderInfo.RECIPIENT_ZIPCODE }</span></td>
                     </tr>
                     <tr>
                        <th scope="row">주소</th>
                        <td><span>${orderInfo.RECIPIENT_ADDR1}
                              ${orderInfo.RECIPIENT_ADDR2 } ${orderInfo.RECIPIENT_EXTRAADDR }</span></td>
                     </tr>
                     <tr>
                        <th scope="row">전화번호</th>
                        <td><span>${orderInfo.RECIPIENT_PHONE }</span></td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
         <!-- 추가정보 -->
         <div>
            <span> <a href="/grasse/main.do">쇼핑계속하기</a>
            </span>
         </div>
         <!-- 이용안내 -->
         <div>
            <h3>이용안내</h3>
            <div>
               <br />배송은
               결제완료 후 지역에따라 1~3일 정도 소요됩니다. <br />상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수
               있습니다. <br />주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고하십시오.
            </div>
         </div>
   </div>
   </form>
   </div>
</body>
</html>