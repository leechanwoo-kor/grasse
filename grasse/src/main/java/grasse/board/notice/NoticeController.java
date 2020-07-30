package grasse.board.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class NoticeController {

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	// 공지사항 관리
	@RequestMapping(value = "/notice/noticeList.do")
	public ModelAndView selectNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/notice/list");

		List<Map<String, Object>> list = noticeService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

}
