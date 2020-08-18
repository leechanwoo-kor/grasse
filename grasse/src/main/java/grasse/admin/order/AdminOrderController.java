package grasse.admin.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.common.paging.AdminMemberListPaging;
import grasse.common.paging.AdminOrderListPaging;

@Controller
public class AdminOrderController {

	// adminOrderService
	@Resource(name = "adminOrderService")
	private AdminOrderService adminOrderService;

	// adminOrderListPaging
	@Resource(name = "adminOrderListPaging")
	AdminOrderListPaging adminOrderListPaging;

	// 주문관리
	@RequestMapping(value = "/admin/orderList.do")
	public ModelAndView selectOrderList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/order/list");

		int show = 10;
		int block = 5;
		int page;
		if (commandMap.get("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt((String) commandMap.get("page"));
		}
		int endNum = page * show;
		int startNum = endNum - (show - 1);

		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);

		int totalList = adminOrderService.orderTotalList(commandMap.getMap());
		adminOrderListPaging.setPath(request.getContextPath());
		adminOrderListPaging.setCurrentPage(page);
		adminOrderListPaging.setTotalList(totalList);
		adminOrderListPaging.setPageBlock(block);
		adminOrderListPaging.setPageSize(show);

		adminOrderListPaging.paging();

		mv.addObject("AdminOrderListPaging", adminOrderListPaging);

		List<Map<String, Object>> list = adminOrderService.selectOrderList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
}
