package grasse.admin.item;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminItemController {

	@Resource(name = "adminItemService")
	private AdminItemService adminItemService;

	// 상품 관리
	@RequestMapping(value = "/admin/itemList.do")
	public ModelAndView selectItemList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/item/list");

		List<Map<String, Object>> list = adminItemService.selectItemList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	// 상품 등록 폼
	@RequestMapping(value = "/admin/itemWriteForm.do")
	public ModelAndView selectItemUpdateForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/item/write");

		return mv;
	}
	
	// 상품 등록
	@RequestMapping(value="/admin/itemWrite.do", method=RequestMethod.POST)
	public ModelAndView insertItem(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/item/list");

		adminItemService.insertItem(commandMap.getMap());
		return mv;
	}
	

}
