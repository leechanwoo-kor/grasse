package grasse.admin.item;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminItemController {

	@Resource(name = "adminItemService")
	private AdminItemService adminItemService;

	@RequestMapping(value = "/admin/itemList.do")
	public ModelAndView selectItemList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/item/list");

		List<Map<String, Object>> list = adminItemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	@RequestMapping(value = "/admin/itemUpdateForm.do")
	public ModelAndView selectItemUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/item/write");

		return mv;
	}

}
