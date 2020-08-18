package grasse.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.common.paging.NoticeListPaging;

@Controller
public class NoticeController {

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	@Resource(name = "noticeListPaging")
	NoticeListPaging noticeListPaging;

	// 공지사항 관리
	@RequestMapping(value = "/notice/noticeList.do")
	public ModelAndView selectNoticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/notice");

		Map<String, Object> map = commandMap.getMap();
		String page = (String) commandMap.get("page");
		if (map.get("page") == null || map.get("page").equals("")) {
			page = "1";
		}
		int show = 5;
		int block = 5;
		int endNum = Integer.parseInt(page) * show;
		int startNum = endNum - (show - 1);

		commandMap.put("START_NUM", startNum);
		commandMap.put("END_NUM", endNum);

		int totalList = noticeService.getTotalList(map);
		noticeListPaging.setPath(request.getContextPath());
		noticeListPaging.setCurrentPage(page);
		noticeListPaging.setTotalList(totalList);
		noticeListPaging.setPageBlock(block);
		noticeListPaging.setPageSize(show);

		noticeListPaging.paging();
		mv.addObject("NoticeListPaging", noticeListPaging);

		List<Map<String, Object>> list = noticeService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// 공지사항 상세보기
	@RequestMapping(value = "/notice/noticeDetail.do")
	public ModelAndView selectNotice(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/noticeDetail");

		Map<String, Object> noticeInfo = new HashMap<String, Object>();
		noticeInfo = noticeService.selectNotice(commandMap.getMap());
		mv.addObject("noticeInfo", noticeInfo);

		return mv;
	}

}
