package grasse.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {
	
	/* BEST 리스트 */
	@RequestMapping(value = "/item/best.do")
	public @ResponseBody ModelAndView bestItem(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		return mv;
	}
	/* NEW 리스트 */
	@RequestMapping(value = "/item/new.do")
	public @ResponseBody ModelAndView newItem(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		return mv;
	}
	/* MAN 리스트 */
	@RequestMapping(value = "/item/man.do")
	public @ResponseBody ModelAndView manItem(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		return mv;
	}
	/* WOMAN 리스트 */
	@RequestMapping(value = "/item/woman.do")
	public @ResponseBody ModelAndView womanItem(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		return mv;
	}
	/* CONTAINER 리스트 */
	@RequestMapping(value = "/item/container.do")
	public @ResponseBody ModelAndView containerItem(HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/item/categoryList");

		return mv;
	}
}
