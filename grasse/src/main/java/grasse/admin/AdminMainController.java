package grasse.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminMainController {

	@RequestMapping(value = "/admin.do")
	public ModelAndView mainPage(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView(".tiles/admin/main/main");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");

		if (member != null && !member.get("MEMBER_ID").equals("admin")) {

			/* 세션삭제 */
			if (session != null) {
				session = request.getSession(false);
				session.invalidate();
			}

			mv.setViewName(".tiles/admin/main/login");
		} else {

			mv.setViewName(".tiles/admin/main/main");
		}

		return mv;
	}
}
