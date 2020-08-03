package grasse.board.qa;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.board.faq.FaqService;
import grasse.common.map.CommandMap;

@Controller
public class QnaController {

	@Resource(name = "faqService")
	private FaqService faqService;

	// QNA 관리
	@RequestMapping(value = "/qna/qnaList.do")
	public ModelAndView selectQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/qna");

		List<Map<String, Object>> list = faqService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
}
