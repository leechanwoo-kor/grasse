package grasse.admin.faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminFaqController {

	@Resource(name = "adminFaqService")
	private AdminFaqService adminFaqService;

	// 공지사항 관리
	@RequestMapping(value = "/admin/faqList.do")
	public ModelAndView selectFaqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/faq/list");

		List<Map<String, Object>> list = adminFaqService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
}
