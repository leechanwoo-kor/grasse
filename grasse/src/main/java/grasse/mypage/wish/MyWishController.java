package grasse.mypage.wish;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class MyWishController {
	@Resource(name = "myWishService")
	MyWishService myWishService;

	// WISH 조회
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/mypage/wishList.do")
	public ModelAndView wishList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/mypage/wish/list");
		HttpSession session = request.getSession();

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
		commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		List<Map<String, Object>> wishList = myWishService.selectMyWishList(commandMap.getMap());
		mv.addObject("wishList", wishList);

		return mv;
	}

	// WISH 추가
	@RequestMapping(value = "/myWish/addWish.do")
	public @ResponseBody void addWish(@RequestBody Map<String,Object> jsonMap) throws Exception {
		myWishService.addWish(jsonMap);
	}

	/*
	 * // WISH 조회
	 * 
	 * @RequestMapping(value = "/mypage/wishList.do") public ModelAndView
	 * myWishList(CommandMap commandMap, HttpServletRequest request) throws
	 * Exception { ModelAndView mv = new ModelAndView(".tiles/mypage/wish/list");
	 * 
	 * HttpSession session = request.getSession(); Map<String, Object> member =
	 * (Map<String, Object>) session.getAttribute("member");
	 * System.out.println(member);
	 * 
	 * commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
	 * System.out.println(member.get("MEMBER_ID"));
	 * 
	 * List<Map<String, Object>> WishList =
	 * myWishService.selectMyWishList(commandMap.getMap());
	 * 
	 * mv.addObject("WishList", WishList); System.out.println(WishList); return mv;
	 * }
	 */
	// WISH 삭제
	@RequestMapping(value = "/myWish/myWishDelete.do")
	public ModelAndView myWishDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mypage/wishList.do");

		System.out.println(commandMap);
		commandMap.put("WISH_NO", request.getParameter("WISH_NO"));
		for(String key : commandMap.keySet()) {
			Object value = commandMap.get(key);
			System.out.println(key+":"+value);
		}
		myWishService.deleteMyWish(commandMap.getMap());
		
		//mv.addObject("WISH_NO", commandMap.get("WISH_NO"));
		return mv;
	}

}
