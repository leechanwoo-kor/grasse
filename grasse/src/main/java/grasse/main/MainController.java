package grasse.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.item.item.ItemServiceImpl;

@Controller
public class MainController {

	@Resource(name = "itemService")
	private ItemServiceImpl itemService;

	@RequestMapping(value = "/main.do")
	public ModelAndView mainPage(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/main/main");
		
		List<Map<String, Object>> bestItem = itemService.selectBestList(commandMap.getMap());
		List<Map<String, Object>> newItem = itemService.selectNewList(commandMap.getMap());

		mv.addObject("bestItem", bestItem);
		mv.addObject("newItem", newItem);

		return mv;
	}

}
