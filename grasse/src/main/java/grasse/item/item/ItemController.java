package grasse.item.item;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class ItemController {

	@Resource(name = "itemService")
	private ItemService itemService;

	/* BEST 리스트 */
	@RequestMapping(value = "/item/best.do")
	public ModelAndView bestItem(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		List<Map<String, Object>> list = itemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	/* NEW 리스트 */
	@RequestMapping(value = "/item/new.do")
	public ModelAndView newItem(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		List<Map<String, Object>> list = itemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	/* MAN 리스트 */
	@RequestMapping(value = "/item/man.do")
	public ModelAndView manItem(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		List<Map<String, Object>> list = itemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	/* WOMAN 리스트 */
	@RequestMapping(value = "/item/woman.do")
	public ModelAndView womanItem(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		List<Map<String, Object>> list = itemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	/* CONTAINER 리스트 */
	@RequestMapping(value = "/item/container.do")
	public ModelAndView containerItem(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");
		
		List<Map<String, Object>> list = itemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
}
