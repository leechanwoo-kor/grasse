package grasse.item.itemDetail;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
import grasse.item.review.ReviewService;

@Controller
public class ItemDetailController {

	@Resource(name = "itemDetailService")
	private ItemDetailService itemDetailService;
	@Resource(name = "reviewService")
	private ReviewService reviewService;

	@RequestMapping(value = "/itemDetail/item.do")
	public ModelAndView itemDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/itemDetail/itemDetail");

		itemDetailService.updateReadcnt(commandMap.getMap());
		Map<String, Object> map = itemDetailService.selectOneItem(commandMap.getMap());
		List<Map<String, Object>> itemAttribute = itemDetailService.selectItemAttribute(commandMap.getMap());
		List<Map<String, Object>> reviewList = reviewService.ReviewList(commandMap.getMap());

		mv.addObject("map", map.get("map"));
		mv.addObject("itemAttribute", itemAttribute);
		mv.addObject("reviewList", reviewList);
		return mv;
	}

}