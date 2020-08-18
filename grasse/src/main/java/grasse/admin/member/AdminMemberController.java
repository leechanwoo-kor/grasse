package grasse.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.common.paging.AdminMemberListPaging;

@Controller
public class AdminMemberController {

	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;

	@Resource(name = "adminMemberListPaging")
	AdminMemberListPaging adminMemberListPaging;

	// 회원관리
	@RequestMapping(value = "/admin/memberList.do")
	public ModelAndView selectMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/member/list");

		int show = 10;
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

		int totalList = adminMemberService.memberTotalList(commandMap.getMap());
		adminMemberListPaging.setPath(request.getContextPath());
		adminMemberListPaging.setCurrentPage(page);
		adminMemberListPaging.setTotalList(totalList);
		adminMemberListPaging.setPageBlock(block);
		adminMemberListPaging.setPageSize(show);

		adminMemberListPaging.paging();

		mv.addObject("AdminMemberListPaging", adminMemberListPaging);

		List<Map<String, Object>> list = adminMemberService.selectMemberList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	// 회원정보 조회
	@RequestMapping(value = "/admin/memberDetail.do")
	public ModelAndView memberDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/member/detail");

		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo = adminMemberService.selectMember(commandMap.getMap());
		mv.addObject("memberInfo", memberInfo);

		return mv;
	}

	// 회원탈퇴
	@RequestMapping(value = "/admin/memberDelete.do", method = RequestMethod.POST)
	public ModelAndView memberDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/memberList.do");

		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo = adminMemberService.selectMember(commandMap.getMap());

		adminMemberService.deleteMember(memberInfo);

		return mv;
	}
}
