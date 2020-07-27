package grasse.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainController {

	@RequestMapping(value = "/admin.do")
	public ModelAndView mainPage() {
		ModelAndView mv = new ModelAndView(".tiles/admin/main/main");

		return mv;
	}
}
