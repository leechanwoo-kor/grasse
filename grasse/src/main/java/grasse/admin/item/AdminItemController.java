package grasse.admin.item;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.common.paging.AdminItemListPaging;

@Controller
public class AdminItemController {

	@Resource(name = "adminItemService")
	private AdminItemService adminItemService;

	@Resource(name = "adminItemListPaging")
	AdminItemListPaging adminItemListPaging;

	// 상품 관리
	@RequestMapping(value = "/admin/itemList.do")
	public ModelAndView selectItemList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/item/list");

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

		int totalList = adminItemService.getTotalList(commandMap.getMap());
		adminItemListPaging.setPath(request.getContextPath());
		adminItemListPaging.setCurrentPage(page);
		adminItemListPaging.setTotalList(totalList);
		adminItemListPaging.setPageBlock(block);
		adminItemListPaging.setPageSize(show);

		adminItemListPaging.paging();

		mv.addObject("AdminItemListPaging", adminItemListPaging);
		List<Map<String, Object>> list = adminItemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// 상품 등록 폼
	@RequestMapping(value = "/admin/itemWriteForm.do")
	public ModelAndView selectItemUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/item/write");

		return mv;
	}

	// 상품 등록
	@RequestMapping(value = "/admin/itemWrite.do", method = RequestMethod.POST)
	public ModelAndView insertItem(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/item/list");

		adminItemService.insertItem(commandMap.getMap());
		return mv;
	}

}
