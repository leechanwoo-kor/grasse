package grasse.board.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.common.paging.QnaListPaging;

@Controller
public class QnaController {

	@Resource(name = "qnaService")
	private QnaService qnaService;

	@Resource(name = "qnaListPaging")
	QnaListPaging qnaListPaging;

	// QNA 관리
	@RequestMapping(value = "/qna/qnaList.do")
	public ModelAndView selectQnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/qna");
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

		int totalList = qnaService.getTotalList(map);
		qnaListPaging.setPath(request.getContextPath());
		qnaListPaging.setCurrentPage(page);
		qnaListPaging.setTotalList(totalList);
		qnaListPaging.setPageBlock(block);
		qnaListPaging.setPageSize(show);

		qnaListPaging.paging();
		mv.addObject("QnaListPaging", qnaListPaging);
		List<Map<String, Object>> list = qnaService.selectQnaList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// QNA 상세보기
	@RequestMapping(value = "/qna/qnaDetail.do")
	public ModelAndView selectQna(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/board/qnaDetail");

		Map<String, Object> qnaInfo = new HashMap<String, Object>();
		qnaInfo = qnaService.selectQna(commandMap.getMap());
		mv.addObject("qnaInfo", qnaInfo);

		return mv;
	}
}
