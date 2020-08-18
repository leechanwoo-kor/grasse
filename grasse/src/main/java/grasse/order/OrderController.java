package grasse.order;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;

import grasse.common.map.CommandMap;
import grasse.common.util.ParseListToJson;
import grasse.common.util.SequenceUtils;
import grasse.member.member.MemberService;

@Controller
public class OrderController {
   @Resource(name = "orderService")
   private OrderService orderService;

   @Resource(name = "memberService")
   private MemberService memberService;

   // 디테일에서
   @RequestMapping(value = "/order/order.do", method = RequestMethod.POST)
   public  ModelAndView buy(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView(".tiles/order/orderForm");
      HttpSession session = request.getSession();

      String attr = (String) commandMap.get("ATTRIBUTE");

      int totalPrice = Integer.valueOf((String)commandMap.get("TOTAL"));
      
      System.out.println(attr);
      
      Gson gson = new Gson();
      List<Map<String, Object>> attributeList = gson.fromJson(attr, new TypeToken<List<Map<String, Object>>>() {
      }.getType());
      
      Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
      
      // 회원이면
      if (session.getAttribute("member") != null) {
         commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
         Map<String, Object> memberInfo = new HashMap<String, Object>();
         memberInfo = memberService.memberInfo(commandMap.getMap());
         /* memberInfo=adminMemberService.memberDetail(commandMap.getMap()); */
         mv.addObject("memberInfo", memberInfo);
         mv.addObject("list", attributeList);
         mv.addObject("TOTAL", totalPrice);

         return mv;
         // 비회원이면
      } else {
         String n_Mem = "nonMem_" + SequenceUtils.getSeqNumber();
         session.setAttribute("MEMBER_ID", n_Mem);
         commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
         System.out.println(commandMap.getMap());
         mv.addObject("list", attributeList);
         mv.addObject("TOTAL", totalPrice);

      }
      // }
      return mv;
   }

   @RequestMapping(value = "/order/buyCart.do", method = RequestMethod.POST)
   public  ModelAndView buyCart(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView(".tiles/order/orderForm");
      
      for(String key : commandMap.keySet()) {
    	  Object value = commandMap.get(key);
    	  System.out.println(key +":" + value);
      }
      HttpSession session = request.getSession();

      String attr = (String) commandMap.get("ATTRIBUTE");

      int totalPrice = Integer.valueOf((String)commandMap.get("TOTAL"));
      System.out.println(attr);
      
      Gson gson = new Gson();
      List<Map<String, Object>> attributeList = gson.fromJson(attr, new TypeToken<List<Map<String, Object>>>() {
      }.getType());
      
      
      Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
      
      // 회원이면
      if (session.getAttribute("member") != null) {
         commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
         Map<String, Object> memberInfo = new HashMap<String, Object>();
         memberInfo = memberService.memberInfo(commandMap.getMap());
         /* memberInfo=adminMemberService.memberDetail(commandMap.getMap()); */
         mv.addObject("memberInfo", memberInfo);
         mv.addObject("list", attributeList);
         mv.addObject("TOTAL", totalPrice);

         return mv;
         // 비회원이면
      } else {
         String n_Mem = "nonMem_" + SequenceUtils.getSeqNumber();
         session.setAttribute("MEMBER_ID", n_Mem);
         commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
         System.out.println(commandMap.getMap());
         mv.addObject("list", attributeList);
         mv.addObject("TOTAL", totalPrice);

      }
      // }
      return mv;
   }
   
   @RequestMapping(value = "/order/orderSuccess.do")
   public ModelAndView orderSuccess(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView(".tiles/order/orderSuccess");
      HttpSession session = request.getSession();
      return mv;
   }

   @RequestMapping(value = "/order/orderInsert.do")
   public ModelAndView addInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      HttpSession session = request.getSession();

      @SuppressWarnings("rawtypes")
      Map member = (Map) session.getAttribute("member");

      //System.out.println(member);
      
      System.out.println("감?");
      // 비회원
      if (session.getAttribute("member") == null) {
         mv.setViewName("order/orderSuccess");
         /* commandMap.put("MEMBER_ID", mm.get("NON_MEMBER_ID")); */
         String n_Mem = "nonMem_" + SequenceUtils.getSeqNumber();
         session.setAttribute("MEMBER_ID", n_Mem);
         commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
         System.out.println(commandMap.getMap());
         System.out.println("비회원결제");
         /* System.out.println(commandMap.getMap()); */
      } else {
         mv.setViewName("order/orderSuccess");
         commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
         System.out.println(commandMap.getMap());
         System.out.println("회원결제");
         Map<String, Object> memberInfo = new HashMap<String, Object>();
         memberInfo = memberService.memberInfo(commandMap.getMap());

         mv.addObject("memberInfo", memberInfo);
      }
      commandMap.put("cart_No", session.getAttribute("CART_NO"));
      System.out.println("인서트오더감??");
      orderService.insertOrder(commandMap.getMap(), request);
      System.out.println("인서트오더옴??");
      /* orderService.insertOrderDetail(commandMap.getMap()); */
      
      List<Map<String, Object>> orderList = new ArrayList<Map<String, Object>>();
      Map<String, Object> orderMemberInfo = new HashMap<String, Object>();

      orderList = orderService.selectOrderInfo(commandMap.getMap());
      orderMemberInfo = orderService.selectOrderMemberInfo(commandMap.getMap());

      mv.addObject("orderInfo", orderMemberInfo);
      mv.addObject("orderItemList", orderList);
      mv.addObject("TOTALPRICE", commandMap.get("TOTALPRICE"));
      mv.addObject("TOTALSUM", commandMap.get("TOTALSUM2"));
      mv.addObject("DISCOUNT", commandMap.get("DISCOUNT2"));
      mv.addObject("DEPOSIT_", commandMap.get("DEPOSIT_"));
      mv.addObject("ADDPOINT", commandMap.get("ADDPOINT"));
      System.out.println(mv);
      return mv;
   }

   @ResponseBody
   @RequestMapping(value = "/order/getMemberInfo.do", produces = "application/json; charset=UTF-8")
   public ModelAndView getMemberInfo11(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
         throws Exception {
      PrintWriter writer = response.getWriter();
      HttpSession session = request.getSession();

      @SuppressWarnings("rawtypes")
      Map member = (Map) session.getAttribute("member");
      commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));

      @SuppressWarnings("unchecked")
      List<Map<String, Object>> memberInfo2 = memberService.memberInfoList(member);
      JSONArray json = ParseListToJson.convertListToJson(memberInfo2);

      writer.print(json);
      writer.flush();
      writer.close();
      ModelAndView mv = new ModelAndView(".tiles/order/orderForm");

      return mv;
   }

}