package grasse.member.login;

import java.security.Key;
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
import grasse.common.util.RSAKeySet;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	/* 로그인 폼 */
	@RequestMapping(value = "/login/loginForm.do")
	public @ResponseBody ModelAndView loginForm(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/login/loginForm");

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
		commandMap.put("idSave", request.getParameter("idSave"));
		commandMap.put("autoLogin", request.getParameter("autoLogin"));
		Map<String, Object> member = loginService.login(commandMap.getMap());

		String passwd = request.getParameter("passwd");

		if (member != null && member.get("PASSWD").equals(passwd)) {
			session.setAttribute("member", member);
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

			if (commandMap.get("MEMBER_ID").equals("ADMIN")) {
				mv.setViewName(".tiles/admin/adminMain");
			} else {
				mv.setViewName(".tiles/main/main");
			}

		} else {
			mv.addObject("errCode", 1);
			mv.setViewName(".tiles/login/loginForm");
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
		mv.setViewName(".tiles/main/main");

		return mv;
	}

	/* 비밀번호 찾기 폼 */
	@RequestMapping(value = "/login/findPw.do")
	public ModelAndView findPasswdForm() {
		ModelAndView mv = new ModelAndView(".tiles/login/findPw");

		return mv;
	}

	/* 비밀번호 찾기 폼에서 정보가 맞으면 새로운 비밀번호 작성하기 */
	@RequestMapping(value = "/login/changePw.do", method = RequestMethod.POST)
	public ModelAndView changePw(HttpServletRequest request, CommandMap commandMap, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/login/changePw");

		RSAKeySet keySet = new RSAKeySet();

		String Name = request.getParameter("Name");
		String MEMBER_ID = request.getParameter("MEMBER_ID");
		String EMAIL = request.getParameter("EMAIL");
		commandMap.put("Name", Name);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		commandMap.put("EMAIL", EMAIL);

		session.setAttribute("member", commandMap.getMap());

		return mv;
	}

	/* 비밀번호 변경 */
	@RequestMapping(value = "/login/changePwComplete.do", method = RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/main/main");

		Map<String, Object> PwMap = (Map<String, Object>) session.getAttribute("member");
		PwMap.put("PASSWD2", request.getParameter("PASSWD2"));

		loginService.changePw(PwMap);

		/* 세션삭제 */
		if (session != null) {
			session.invalidate();
		}

		return mv;
	}

	@RequestMapping(value = "/login/findId.do") // 아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/login/findId");
		return mv;
	}

	@RequestMapping(value = "/login/findIdResult.do", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findIdResult(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/login/findIdResult");

		String name = request.getParameter("name");
		String email = request.getParameter("email") + "@" + request.getParameter("e_domain");

		commandMap.put("NAME", name);
		commandMap.put("EMAIL", email);

		List<Map<String, Object>> list = loginService.findIdWithEmail(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("name", name);
		mv.addObject("email", email);
		return mv;
	}

}
