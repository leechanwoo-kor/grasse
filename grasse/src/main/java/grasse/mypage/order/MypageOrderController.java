package grasse.mypage.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class MypageOrderController {
	@Resource(name = "mypageOrderService")
	MypageOrderService mypageOrderService;

	// 내 주문
	@RequestMapping(value = "/mypage/orderList.do")
	public ModelAndView myOrderList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/mypage/order/list");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
		commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));

		List<Map<String, Object>> list = mypageOrderService.selectMyOrderList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}

	// 주문 상세
	@RequestMapping(value = "/mypage/orderDetail.do")
	public ModelAndView myOrderDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/mypage/order/detail");
		Map<String, Object> map = mypageOrderService.selectMyOrderDetail(commandMap.getMap());
		mv.addObject("myOrder", map);
		return mv;
	}
}
