package grasse.admin.login;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminLoginController {

	@Resource(name = "adminLoginService")
	private AdminLoginService adminLoginService;

	// 관리자 로그인 폼
	@RequestMapping(value = "/admin/loginForm.do")
	public ModelAndView adminLoginForm(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/main/login");

		return mv;
	}

	// 관리자 로그인
	@SuppressWarnings({ "unchecked", "null" })
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.POST)
	public ModelAndView adminLoginComplete(CommandMap commandMap, HttpServletRequest request,
			HttpServletResponse reponse) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();

		commandMap.put("MEMBER_ID", request.getParameter("MEMBER_ID"));
		Map<String, Object> member = adminLoginService.login(commandMap.getMap());

		String PASSWD = request.getParameter("PASSWD");

		if (member != null && member.get("PASSWD").equals(PASSWD)) {
			session.setAttribute("member", member);
			mv.addObject("member", member);

			if (commandMap.get("MEMBER_ID").equals("admin")) {
				mv.setViewName(".tiles/admin/main/main");
			} else {
				mv.addObject("errCode", 2);
				mv.setViewName(".tiles/admin/main/login");
			}
		} else {
			mv.addObject("errCode", 1);
			mv.setViewName(".tiles/admin/main/login");
		}

		return mv;
	}

	// 로그아웃
	@RequestMapping("/admin/logout.do")
	public ModelAndView logout(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		HttpSession session = request.getSession(false);

		// 세션삭제
		if (session != null) {
			session.invalidate();
		}

		ModelAndView mv = new ModelAndView();
		mv.setViewName(".tiles/admin/main/main");

		return mv;
	}

}
