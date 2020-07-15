package grasse.member.login;

import java.security.Key;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.common.util.RSAKeySet;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	/* 로그인 폼 */
	@RequestMapping(value = "/login/loginForm.do")
	public @ResponseBody ModelAndView loginForm(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/loginForm");

		return mv;
	}

	/* 로그인 */
	@SuppressWarnings({ "unchecked", "null" })
	@RequestMapping(value = "/login/login.do", method = RequestMethod.POST)
	public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		commandMap.put("MEMBER_ID", request.getParameter("id"));

		Map<String, Object> member = loginService.login(commandMap.getMap());

		String passwd = request.getParameter("passwd");

		if (member != null && member.get("PASSWD").equals(passwd)) {
			session.setAttribute("member", member);
			mv.addObject("member", member);
			mv.setViewName("/main");
		} else {
			mv.addObject("member", member);
			mv.addObject("errCode", 1);
			mv.setViewName("/login/loginForm");
		}
		return mv;
	}

	/* 로그아웃 */
	@RequestMapping("/login/logout.do")
	public ModelAndView logout(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		HttpSession session = request.getSession(false);

		/* 세션삭제 */
		if (session != null) {
			session.invalidate();
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main.do");

		return mv;
	}

	/* 비밀번호 찾기 폼 */
	@RequestMapping(value = "/login/findPw.do")
	public ModelAndView findPasswdForm() {
		ModelAndView mv = new ModelAndView("/login/findPw");

		return mv;
	}

	/* 비밀번호 찾기 폼에서 정보가 맞으면 새로운 비밀번호 작성하기 */
	@RequestMapping(value = "/login/changePw.do", method=RequestMethod.POST)
	public ModelAndView changePw(HttpServletRequest request, CommandMap commandMap, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView("/login/changePw");
		
		RSAKeySet keySet = new RSAKeySet();
		
		String Name = request.getParameter("Name");
		String MEMBER_ID = request.getParameter("MEMBER_ID");
		String EMAIL = request.getParameter("EMAIL");
		commandMap.put("Name", Name);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		commandMap.put("EMAIL", EMAIL);

		/* Front Side로 공개키 전달 */
		mv.addObject("Modulus", keySet.getPublicKeyModulus());
		mv.addObject("Exponent", keySet.getPublicKeyExponent());

		session.setAttribute("NAME", commandMap.get("NAME"));
		session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));
		session.setAttribute("EMAIL", commandMap.get("EMAIL"));

		/* 세션에 개인키 저장 */
		session.setAttribute("RSA_private", keySet.getPrivateKey());

		return mv;
	}

	/* 비밀번호 변경 */
	@RequestMapping(value = "/login/changePwComplete.do", method = RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView("/login/loginForm");

		/* System.out.println("맵!!" + commandMap.getMap()); */

		commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));

		if (session.getAttribute("RSA_private") != null) {
			loginService.findPasswd(commandMap.getMap(), (Key) session.getAttribute("RSA_private"));
			// if(memberService.regist(member, (Key)session.getAttribute("RSA_private")) >
			// 0)
			mv.addObject("Modulus", commandMap.get("modulus"));
			mv.addObject("Exponent", commandMap.get("exponent"));
		}

		session.removeAttribute("MEMBER_ID");

		return mv;
	}

}
