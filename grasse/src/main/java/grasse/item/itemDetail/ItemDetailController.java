package grasse.item.itemDetail;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class ItemDetailController {
	@Resource(name = "itemDetailService")
	private ItemDetailService itemDetailService;

	@RequestMapping(value = "/itemDetail/item.do", method = RequestMethod.POST)
	public ModelAndView itemDetail(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView(".tiles/itemDetail/itemDetail");

		commandMap.put("ITEM_NO", request.getParameter("ITEM_NO"));
		itemDetailService.updateReadcnt(commandMap.getMap());
		Map<String, Object> item = itemDetailService.selectOneItem(commandMap.getMap());

		List<Map<String, Object>> itemAttribute = itemDetailService.selectItemAttribute(commandMap.getMap());

		// 이미지 저장
		String images = (String) item.get("CONTENT");
		String[] imageArray = images.split(",");

		mv.addObject("images", imageArray);
		mv.addObject("item", item);
		mv.addObject("itemAttribute", itemAttribute);
		System.out.println(itemAttribute);
		return mv;
	}

}