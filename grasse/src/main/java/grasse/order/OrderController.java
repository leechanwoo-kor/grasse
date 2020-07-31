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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value = "/order/order.do")
	public ModelAndView buy(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/order/orderForm");
		HttpSession session = request.getSession();

		Map<String, Object> cartMap = new HashMap<String, Object>();
		List<Map<String, Object>> buy = new ArrayList<Map<String, Object>>();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		// 1개
		String ITEM_NO = (String) commandMap.get("ITEM_NO");
		String ATTRIBUTE_NO = (String) commandMap.get("attrno");
		String COUNT = (String) commandMap.get("r_count");
		String CONTENT = (String) commandMap.get("CONTENT");
		String IMAGE = (String) commandMap.get("IMAGE");
		String PRICE = (String) commandMap.get("total");
		String NAME = (String) commandMap.get("NAME");
		String SIZE = (String) commandMap.get("SIZE");

		cartMap.put("ATTRIBUTE_NO", ATTRIBUTE_NO);
		cartMap.put("ITEM_NO", 2);
		cartMap.put("COUNT", COUNT);
		cartMap.put("CONTENT", "ㅎㅅㅎ"/* CONTENT */);
		cartMap.put("IMAGE", "134.jpg"/* IMAGE */);
		cartMap.put("PRICE", 12345/* PRICE */);
		cartMap.put("NAME", "grasse"/* NAME */);
		cartMap.put("SIZE", SIZE);
		buy.add(cartMap);
		mv.addObject("list", buy);
		// 회원이면
		if (session.getAttribute("member") != null) {
			commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
			Map<String, Object> memberInfo = new HashMap<String, Object>();
			memberInfo = memberService.memberInfo(commandMap.getMap());
			/* memberInfo=adminMemberService.memberDetail(commandMap.getMap()); */
			mv.addObject("memberInfo", memberInfo);
			return mv;
			// 비회원이면
		} else {
			String n_Mem = "nonMem_" + SequenceUtils.getSeqNumber();
			session.setAttribute("MEMBER_ID", n_Mem);
			commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
			System.out.println(commandMap.getMap());
			mv.addObject("list", buy);
		}

		return mv;
	}
	/*
	 * @RequestMapping(value="/order/buy.do") public ModelAndView
	 * orderBuy(CommandMap commandMap, HttpServletRequest request) throws Exception{
	 * ModelAndView mv = new ModelAndView("order/orderForm"); HttpSession session =
	 * request.getSession(); String item_No[] =
	 * request.getParameterValues("ITEM_NO");
	 * 
	 * 
	 * 
	 * 
	 * @SuppressWarnings("rawtypes") Map mm = (Map)session.getAttribute("member");
	 * 
	 * if(session.getAttribute("member")!= null) { commandMap.put("MEMBER_ID",
	 * mm.get("MEMBER_ID"));
	 * 
	 * Map<String, Object> memberInfo = new HashMap<String, Object>(); memberInfo =
	 * memberService.memberInfo(commandMap.getMap());
	 * 
	 * //관리자 memberInfo=adminMemberService.memberDetail(commandMap.getMap());
	 * 
	 * mv.addObject("memberInfo", memberInfo); System.out.println(memberInfo); }
	 * else { //비회원 어케할거 String n_Mem="nonMem_"+SequenceUtils.getSeqNumber();
	 * System.out.println(n_Mem); session.setAttribute("MEMBER_ID", n_Mem);
	 * commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID")); } return mv;
	 * }
	 */

	@RequestMapping(value = "/order/orderSuccess.do")
	public ModelAndView orderSuccess(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("order/orderSuccess");
		HttpSession session = request.getSession();
		return mv;
	}

	@RequestMapping(value = "/order/orderInsert.do")
	public ModelAndView addInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		@SuppressWarnings("rawtypes")
		Map member = (Map) session.getAttribute("member");

		System.out.println(member);
		commandMap.put("cart_No", commandMap.get("cart_No"));
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
			/* System.out.println(commandMap.getMap()); */
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
		mv.addObject("TOTALPRICE", commandMap.get("TOTALPRICE2"));
		mv.addObject("TOTALSUM", commandMap.get("TOTALSUM2"));
		mv.addObject("DISCOUNT", commandMap.get("DISCOUNT2"));
		mv.addObject("DEPOSIT_", commandMap.get("DEPOSIT_"));
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
		ModelAndView mv = new ModelAndView("order/orderForm");

		return mv;
	}

}
