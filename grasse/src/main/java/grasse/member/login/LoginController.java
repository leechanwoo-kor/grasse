package grasse.member.login;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	/* 로그인 폼 */
	@RequestMapping(value = "/login/loginForm.do")
	public @ResponseBody ModelAndView loginForm(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/member/login/loginForm");

		return mv;
	}

	/* 로그인 */
	@SuppressWarnings({ "unchecked", "null" })
	@RequestMapping(value = "/login/login.do", method = RequestMethod.POST)
	public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		commandMap.put("MEMBER_ID", request.getParameter("MEMBER_ID"));
		commandMap.put("idSave", request.getParameter("idSave"));
		commandMap.put("autoLogin", request.getParameter("autoLogin"));
		Map<String, Object> member = loginService.login(commandMap.getMap());

		String PASSWD = request.getParameter("PASSWD");

		if (member != null && member.get("PASSWD").equals(PASSWD)) {
			session.setAttribute("member", member);
			session.setAttribute("MEMBER_ID", request.getParameter("MEMBER_ID"));
			mv.addObject("member", member);

			if (commandMap.get("autoLogin") != null) {
				Cookie autoLogin = new Cookie("autoLogin", session.getId());
				autoLogin.setPath("/");
				int amount = 60 * 60 * 24 * 7;
				autoLogin.setMaxAge(amount);
				response.addCookie(autoLogin);

				String SESSIONKEY = session.getId();
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

				commandMap.put("MEMBER_ID", commandMap.get("MEMBER_ID"));
				commandMap.put("SESSIONKEY", SESSIONKEY);
				commandMap.put("SESSIONLIMIT", sessionLimit);

				loginService.keepLogin(commandMap.getMap());
			}

			if (commandMap.get("MEMBER_ID").equals("admin")) {
				mv.setViewName(".tiles/admin/main/main");
			} else {
				mv.setViewName("redirect:/main.do");
			}

		} else {
			mv.addObject("errCode", 1);
			mv.setViewName(".tiles/member/login/loginForm");
		}

		return mv;
	}

	/* 로그아웃 */
	@RequestMapping("/login/logout.do")
	public ModelAndView logout(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main.do");
		HttpSession session = request.getSession(false);

		/* 세션삭제 */
		if (session != null) {
			session.invalidate();
		}

		return mv;
	}

	/* 아이디 찾기 폼 */
	@RequestMapping(value = "/login/findId.do")
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/member/login/findId");
		return mv;
	}

	/* 입력한 정보에 맞춰서 아이디를 찾아주는 거 */
	@RequestMapping(value = "/login/findIdResult.do", method = RequestMethod.POST)
	public ModelAndView findIdResult(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/member/login/findIdResult");

		String NAME = request.getParameter("NAME");
		String EMAIL = request.getParameter("EMAIL") + "@" + request.getParameter("E_DOMAIN");

		commandMap.put("NAME", NAME);
		commandMap.put("EMAIL", EMAIL);

		List<Map<String, Object>> list = loginService.findIdWithEmail(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("NAME", NAME);
		mv.addObject("EMAIL", EMAIL);
		return mv;
	}

	/* 비밀번호 찾기 폼 */
	@RequestMapping(value = "/login/findPw.do")
	public ModelAndView findPasswdForm() {
		ModelAndView mv = new ModelAndView(".tiles/member/login/findPw");

		return mv;
	}

	/* 비밀번호 찾기 폼에서 정보가 맞으면 새로운 비밀번호 작성하기 */
	@RequestMapping(value = "/login/changePw.do", method = RequestMethod.POST)
	public ModelAndView changePw(HttpServletRequest request, CommandMap commandMap, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/member/login/changePw");

		String NAME = request.getParameter("NAME");
		String MEMBER_ID = request.getParameter("MEMBER_ID");
		String EMAIL = request.getParameter("EMAIL");

		commandMap.put("NAME", NAME);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		commandMap.put("EMAIL", EMAIL);

		List<Map<String, Object>> list = loginService.findIdWithEmail(commandMap.getMap());

		mv.addObject("list", list);
		mv.addObject("NAME", NAME);
		mv.addObject("MEMBER_ID", MEMBER_ID);
		mv.addObject("EMAIL", EMAIL);

		return mv;
	}

	/* 비밀번호 변경 */
	@RequestMapping(value = "/login/changePwComplete.do", method = RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/main/main");

		Map<String, Object> PwMap = new HashMap<String, Object>();
		PwMap.put("NAME", request.getParameter("NAME"));
		PwMap.put("MEMBER_ID", request.getParameter("MEMBER_ID"));
		PwMap.put("EMAIL", request.getParameter("EMAIL"));
		PwMap.put("PASSWD2", request.getParameter("PASSWD2"));

		loginService.changePw(PwMap);

		return mv;
	}
}
