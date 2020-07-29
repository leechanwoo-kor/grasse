package grasse.admin.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminNoticeController {

	@Resource(name = "adminNoticeService")
	private AdminNoticeService adminNoticeService;

	// 공지사항 관리
	@RequestMapping(value = "/admin/noticeList.do")
	public ModelAndView selectNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/notice/list");

		List<Map<String, Object>> list = adminNoticeService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// 공지사항 작성 폼
	@RequestMapping(value = "/admin/noticeWriteForm.do")
	public ModelAndView selectNoticeWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/notice/write");

		return mv;
	}

	// 공지사항 작성
	@RequestMapping(value = "/admin/noticeWrite.do", method = RequestMethod.POST)
	public ModelAndView insertNotice(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/notice/list");

		adminNoticeService.insertNotice(commandMap.getMap());
		return mv;
	}

}
