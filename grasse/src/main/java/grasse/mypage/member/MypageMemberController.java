package grasse.mypage.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class MypageMemberController {

	@Resource(name = "mypageMemberService")
	private MypageMemberService mypageMemberService;

	// 회원정보 조회
	@SuppressWarnings({ "unchecked", "null" })
	@RequestMapping(value = "/mypage/memberList.do")
	public ModelAndView memberList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/mypage/member/list");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo = mypageMemberService.selectMember(commandMap.getMap());
		mv.addObject("memberInfo", memberInfo);

		return mv;
	}

	// 회원정보 수정 폼
	@RequestMapping(value = "/mypage/memberDetail.do")
	public ModelAndView memberDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/mypage/member/detail");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo = mypageMemberService.selectMember(commandMap.getMap());
		mv.addObject("memberInfo", memberInfo);

		return mv;
	}

	// 회원정보 수정
	@RequestMapping(value = "/mypage/memberModify.do", method = RequestMethod.POST)
	public ModelAndView memberModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mypage/memberList.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		Map<String, Object> newMember = new HashMap<String, Object>();
		newMember.put("EMAIL", request.getParameter("EMAIL"));
		newMember.put("PHONE", request.getParameter("PHONE"));
		newMember.put("ZIPCODE", request.getParameter("ZIPCODE"));
		newMember.put("ADDR1", request.getParameter("ADDR1"));
		newMember.put("ADDR2", request.getParameter("ADDR2"));
		newMember.put("EXTRAADDR", request.getParameter("EXTRAADDR"));
		newMember.put("MEMBER_ID", member.get("MEMBER_ID"));

		mypageMemberService.updateMember(newMember);

		return mv;
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/mypage/memberDelete.do", method = RequestMethod.POST)
	public ModelAndView memberDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main.do");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		mypageMemberService.deleteMember(member);
		
		/* 세션삭제 */
		if (session != null) {
			session.invalidate();
		}

		return mv;
	}
}
