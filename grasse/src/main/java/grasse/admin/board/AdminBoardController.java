package grasse.admin.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminBoardController {

	// adminBoardService
	@Resource(name = "adminBoardService")
	private AdminBoardService adminBoardService;
	
	/* NOTICE */
	
	// NOTICE 관리
	@RequestMapping(value = "/admin/noticeList.do")
	public ModelAndView selectNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/noticeList");

		List<Map<String, Object>> list = adminBoardService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// NOTICE 작성 폼
	@RequestMapping(value = "/admin/noticeWriteForm.do")
	public ModelAndView selectNoticeWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/noticeWrite");

		return mv;
	}

	// NOTICE 작성
	@RequestMapping(value = "/admin/noticeWrite.do", method = RequestMethod.POST)
	public ModelAndView insertNotice(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/noticeList");

		adminBoardService.insertNotice(commandMap.getMap());
		return mv;
	}
	
	/* NOTICE */

	
	/* FAQ */
	
	// FAQ 관리
	@RequestMapping(value = "/admin/faqList.do")
	public ModelAndView selectFaqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/faqList");

		List<Map<String, Object>> list = adminBoardService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	/* FAQ */
	
	
	/* QNA */
	
	// QNA 관리
	@RequestMapping(value = "/admin/qnaList.do")
	public ModelAndView selectQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/qnaList");

		List<Map<String, Object>> list = adminBoardService.selectQnaList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	/* QNA */
}
