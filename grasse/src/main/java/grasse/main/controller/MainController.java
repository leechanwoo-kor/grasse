package grasse.main.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value="/main.do")
    public ModelAndView mainPage() {
    	ModelAndView mv = new ModelAndView("/main/main");
    	
    	return mv;
    }
}
