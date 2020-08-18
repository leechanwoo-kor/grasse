package grasse.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.admin.member.AdminMemberService;
import grasse.common.map.CommandMap;
import grasse.common.paging.AdminFaqListPaging;
import grasse.common.paging.AdminNoticeListPaging;
import grasse.common.paging.AdminQnaListPaging;

@Controller
public class AdminBoardController {

	// adminBoardService
	@Resource(name = "adminBoardService")
	private AdminBoardService adminBoardService;

	// adminMemberService
	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;

	@Resource(name = "adminNoticeListPaging")
	AdminNoticeListPaging adminNoticeListPaging;

	@Resource(name = "adminFaqListPaging")
	AdminFaqListPaging adminFaqListPaging;

	@Resource(name = "adminQnaListPaging")
	AdminQnaListPaging adminQnaListPaging;

	// NOTICE 관리
	@RequestMapping(value = "/admin/noticeList.do")
	public ModelAndView selectNoticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/noticeList");

		int show = 5;
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

		int totalList = adminBoardService.noticeTotalList(commandMap.getMap());
		adminNoticeListPaging.setPath(request.getContextPath());
		adminNoticeListPaging.setCurrentPage(page);
		adminNoticeListPaging.setTotalList(totalList);
		adminNoticeListPaging.setPageBlock(block);
		adminNoticeListPaging.setPageSize(show);

		adminNoticeListPaging.paging();

		mv.addObject("AdminNoticeListPaging", adminNoticeListPaging);

		List<Map<String, Object>> list = adminBoardService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// NOTICE 상세보기
	@RequestMapping(value = "/admin/noticeDetail.do")
	public ModelAndView selectNotice(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/noticeDetail");

		Map<String, Object> noticeInfo = new HashMap<String, Object>();
		noticeInfo = adminBoardService.selectNotice(commandMap.getMap());
		mv.addObject("noticeInfo", noticeInfo);

		return mv;
	}

	// NOTICE 작성 폼
	@RequestMapping(value = "/admin/noticeWriteForm.do")
	public ModelAndView selectNoticeWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/noticeWrite");
		HttpSession session = request.getSession();
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo = adminMemberService.selectMember(commandMap.getMap());
		mv.addObject("memberInfo", memberInfo);

		return mv;
	}

	// NOTICE 작성
	@RequestMapping(value = "/admin/noticeWrite.do", method = RequestMethod.POST)
	public ModelAndView insertNotice(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("CATEGORY", request.getParameter("CATEGORY"));
		boardMap.put("TITLE", request.getParameter("TITLE"));
		boardMap.put("CONTENT", request.getParameter("CONTENT"));
		boardMap.put("MEMBER_ID", member.get("MEMBER_ID"));

		adminBoardService.insertNotice(boardMap);

		return mv;
	}

	// NOTICE 수정
	@RequestMapping(value = "/admin/noticeUpdate.do", method = RequestMethod.POST)
	public ModelAndView updateNotice(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("CATEGORY", request.getParameter("CATEGORY"));
		boardMap.put("TITLE", request.getParameter("TITLE"));
		boardMap.put("CONTENT", request.getParameter("CONTENT"));
		boardMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		boardMap.put("NOTICE_NO", request.getParameter("NOTICE_NO"));

		adminBoardService.updateNotice(boardMap);

		return mv;
	}

	// NOTICE 삭제
	@RequestMapping(value = "/admin/noticeDelete.do", method = RequestMethod.POST)
	public ModelAndView deleteNotice(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticeList.do");

		commandMap.put("NOTICE_NO", request.getParameter("NOTICE_NO"));

		Map<String, Object> noticeInfo = new HashMap<String, Object>();
		noticeInfo = adminBoardService.selectNotice(commandMap.getMap());

		adminBoardService.deleteNotice(noticeInfo);

		return mv;
	}

	/* FAQ */

	// FAQ 관리
	@RequestMapping(value = "/admin/faqList.do")
	public ModelAndView selectFaqList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/faqList");

		int show = 5;
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

		int totalList = adminBoardService.faqTotalList(commandMap.getMap());
		adminFaqListPaging.setPath(request.getContextPath());
		adminFaqListPaging.setCurrentPage(page);
		adminFaqListPaging.setTotalList(totalList);
		adminFaqListPaging.setPageBlock(block);
		adminFaqListPaging.setPageSize(show);

		adminFaqListPaging.paging();
		mv.addObject("AdminFaqListPaging", adminFaqListPaging);
		List<Map<String, Object>> list = adminBoardService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// FAQ 상세보기
	@RequestMapping(value = "/admin/faqDetail.do")
	public ModelAndView selectFaq(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/faqDetail");

		Map<String, Object> faqInfo = new HashMap<String, Object>();
		faqInfo = adminBoardService.selectFaq(commandMap.getMap());
		mv.addObject("faqInfo", faqInfo);

		return mv;
	}

	// FAQ 작성 폼
	@RequestMapping(value = "/admin/faqWriteForm.do")
	public ModelAndView selectFaqWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/faqWrite");
		HttpSession session = request.getSession();
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo = adminMemberService.selectMember(commandMap.getMap());
		mv.addObject("memberInfo", memberInfo);

		return mv;
	}

	// FAQ 작성
	@RequestMapping(value = "/admin/faqWrite.do", method = RequestMethod.POST)
	public ModelAndView insertFaq(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("TITLE", request.getParameter("TITLE"));
		boardMap.put("CONTENT", request.getParameter("CONTENT"));
		boardMap.put("MEMBER_ID", member.get("MEMBER_ID"));

		adminBoardService.insertFaq(boardMap);

		return mv;
	}

	// FAQ 수정
	@RequestMapping(value = "/admin/faqUpdate.do", method = RequestMethod.POST)
	public ModelAndView updateFaq(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("CATEGORY", request.getParameter("CATEGORY"));
		boardMap.put("TITLE", request.getParameter("TITLE"));
		boardMap.put("CONTENT", request.getParameter("CONTENT"));
		boardMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		boardMap.put("FAQ_NO", request.getParameter("FAQ_NO"));

		adminBoardService.updateFaq(boardMap);

		return mv;
	}

	// FAQ 삭제
	@RequestMapping(value = "/admin/faqDelete.do", method = RequestMethod.POST)
	public ModelAndView deleteFaq(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do");

		commandMap.put("FAQ_NO", request.getParameter("FAQ_NO"));

		Map<String, Object> faqInfo = new HashMap<String, Object>();
		faqInfo = adminBoardService.selectFaq(commandMap.getMap());

		adminBoardService.deleteFaq(faqInfo);

		return mv;
	}

	/* QNA */

	// QNA 관리
	@RequestMapping(value = "/admin/qnaList.do")
	public ModelAndView selectQnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/qnaList");

		int show = 5;
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

		int totalList = adminBoardService.qnaTotalList(commandMap.getMap());
		adminQnaListPaging.setPath(request.getContextPath());
		adminQnaListPaging.setCurrentPage(page);
		adminQnaListPaging.setTotalList(totalList);
		adminQnaListPaging.setPageBlock(block);
		adminQnaListPaging.setPageSize(show);

		adminQnaListPaging.paging();

		mv.addObject("AdminQnaListPaging", adminQnaListPaging);
		List<Map<String, Object>> list = adminBoardService.selectQnaList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// QNA 상세보기
	@RequestMapping(value = "/admin/qnaDetail.do")
	public ModelAndView selectQna(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/qnaDetail");

		Map<String, Object> qnaInfo = new HashMap<String, Object>();
		qnaInfo = adminBoardService.selectQna(commandMap.getMap());
		mv.addObject("qnaInfo", qnaInfo);

		return mv;
	}

	// QNA 작성 폼
	@RequestMapping(value = "/admin/qnaWriteForm.do")
	public ModelAndView selectQnaWriteForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/board/qnaWrite");
		HttpSession session = request.getSession();
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo = adminMemberService.selectMember(commandMap.getMap());
		mv.addObject("memberInfo", memberInfo);

		return mv;
	}

	// QNA 작성
	@RequestMapping(value = "/admin/qnaWrite.do", method = RequestMethod.POST)
	public ModelAndView insertQna(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("CATEGORY", request.getParameter("CATEGORY"));
		boardMap.put("TITLE", request.getParameter("TITLE"));
		boardMap.put("CONTENT", request.getParameter("CONTENT"));
		boardMap.put("MEMBER_ID", member.get("MEMBER_ID"));

		adminBoardService.insertQna(boardMap);

		return mv;
	}

	// QNA 수정
	@RequestMapping(value = "/admin/qnaUpdate.do", method = RequestMethod.POST)
	public ModelAndView updateQna(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		Map<String, Object> boardMap = new HashMap<String, Object>();
		boardMap.put("CATEGORY", request.getParameter("CATEGORY"));
		boardMap.put("TITLE", request.getParameter("TITLE"));
		boardMap.put("CONTENT", request.getParameter("CONTENT"));
		boardMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		boardMap.put("QNA_NO", request.getParameter("QNA_NO"));

		adminBoardService.updateQna(boardMap);

		return mv;
	}

	// QNA 삭제
	@RequestMapping(value = "/admin/qnaDelete.do", method = RequestMethod.POST)
	public ModelAndView deleteQna(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");

		commandMap.put("QNA_NO", request.getParameter("QNA_NO"));

		Map<String, Object> qnaInfo = new HashMap<String, Object>();
		qnaInfo = adminBoardService.selectQna(commandMap.getMap());

		adminBoardService.deleteQna(qnaInfo);

		return mv;
	}
}
