package grasse.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping(value = "/main.do")
	public ModelAndView mainPage() {
		ModelAndView mv = new ModelAndView(".tiles/main/main");

		return mv;
	}
}
