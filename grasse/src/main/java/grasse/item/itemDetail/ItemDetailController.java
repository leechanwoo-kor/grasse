package grasse.item.itemDetail;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;
//import grasse.itemDetail.review.ReviewService;

@Controller
public class ItemDetailController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="itemDetailService")
	private ItemDetailService itemDetailService;
	//@Resource(name="reviewService")
	//private ReviewService reviewService;
	
	@RequestMapping(value="/itemDetail/item.do", method=RequestMethod.POST)
	public ModelAndView itemDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/itemDetail/itemDetail");
		
		commandMap.put("ITEM_NO", request.getParameter("ITEM_NO"));
		itemDetailService.updateReadcnt(commandMap.getMap());
		Map<String,Object> item = itemDetailService.selectOneItem(commandMap.getMap());

		List<Map<String,Object>> itemAttribute = itemDetailService.selectItemAttribute(commandMap.getMap());
		
		//이미지 저장
		String images = (String)item.get("CONTENT");
		String[] imageArray = images.split(",");
		
		mv.addObject("images", imageArray);
		mv.addObject("item", item);
		mv.addObject("itemAttribute", itemAttribute);
		
		System.out.println(commandMap.getMap());
		//List<Map<String, Object>> list =reviewService.ReviewList(commandMap.getMap());
		//System.out.println(list);
		//mv.addObject("reviewList",list);
		return mv;
	}
	
	
	
}