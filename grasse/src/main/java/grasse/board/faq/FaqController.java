package grasse.board.faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class FaqController {

	@Resource(name = "faqService")
	private FaqService faqService;

	// FAQ 관리
	@RequestMapping(value = "/faq/faqList.do")
	public ModelAndView selectFaqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/faq");

		List<Map<String, Object>> list = faqService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
}
