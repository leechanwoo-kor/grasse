package grasse.board.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.common.paging.FaqListPaging;

@Controller
public class FaqController {

	@Resource(name = "faqService")
	private FaqService faqService;

	@Resource(name = "faqListPaging")
	FaqListPaging faqListPaging;

	// FAQ 관리
	@RequestMapping(value = "/faq/faqList.do")
	public ModelAndView selectFaqList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/faq");
		Map<String, Object> map = commandMap.getMap();
		String page = (String) commandMap.get("page");
		if (map.get("page") == null) {
			page = "1";
		}
		int show = 5;
		int block = 5;
		int endNum = Integer.parseInt(page) * show;
		int startNum = endNum - (show - 1);

		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);

		int totalList = faqService.getTotalList(map);
		faqListPaging.setPath(request.getContextPath());
		faqListPaging.setCurrentPage(page);
		faqListPaging.setTotalList(totalList);
		faqListPaging.setPageBlock(block);
		faqListPaging.setPageSize(show);

		faqListPaging.paging();
		mv.addObject("FaqListPaging", faqListPaging);

		List<Map<String, Object>> list = faqService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// FAQ 상세보기
	@RequestMapping(value = "/faq/faqDetail.do")
	public ModelAndView selectFaq(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/faqDetail");

		Map<String, Object> faqInfo = new HashMap<String, Object>();
		faqInfo = faqService.selectFaq(commandMap.getMap());
		mv.addObject("faqInfo", faqInfo);

		return mv;
	}
}
