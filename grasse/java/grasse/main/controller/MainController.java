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
    public ModelAndView main(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/main");
    	
    	log.debug("인터셉트 테스트");
    	
    	return mv;
    }
}
