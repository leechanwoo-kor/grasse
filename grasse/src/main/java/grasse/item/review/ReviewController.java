package grasse.item.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import grasse.common.map.CommandMap;

@Controller
public class ReviewController {
	@Resource(name = "reviewService")
	private ReviewService reviewService;

	// 리뷰 작성
	@RequestMapping(value = "/review.do", method = RequestMethod.POST)
	public @ResponseBody void create(@RequestBody Map<String, Object> jsonMap) throws Exception {
		
		for(String key:jsonMap.keySet()) {
			Object value = jsonMap.get(key);
			System.out.println(key +":" + value);
		}
		
		//reviewService.ReviewWrite(jsonMap);
	}

	// 리뷰 쓰기 폼
	@RequestMapping(value = "/review/writeForm.do")
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("itemDetail/review/write");
		mv.addObject("IDX", request.getSession().getAttribute("MEMBER_ID"));
		mv.addObject("ITEM_NO", commandMap.get("ITEM_NO"));
		return mv;
	}

	
	@RequestMapping(value = "/review/write.do")
	public ModelAndView reviewInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/itemDetail/item.do");
		
		System.out.println(commandMap);
		for(String key : commandMap.keySet()) {
			Object  value = commandMap.get(key);
			System.out.println(key + ":" + value);
		}
		
		String data = (String) commandMap.get("data");
		Gson gson = new Gson();
		Map<String, Object> dataMap = gson.fromJson(data, new TypeToken<Map<String, Object>>() {
	      }.getType());
		

		System.out.println(dataMap.get("action"));
		if(((String)dataMap.get("action")) == "수정하기") {
			reviewService.ReviewUpdate(dataMap);
			System.out.println("1");
		} else {
			reviewService.ReviewWrite(dataMap);
			System.out.println("2");
		}
		

		mv.addObject("ITEM_NO", dataMap.get("ITEM_NO"));
		mv.addObject("data", dataMap);
		return mv;
	}
	/*
	// 리뷰 쓰기 완료
	@RequestMapping(value = "/review/write.do")
	public ModelAndView reviewInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/itemDetail/item.do");
		commandMap.put("ITEM_NO", request.getParameter("ITEM_NO"));

		for(String key:commandMap.keySet()) {
			Object value = commandMap.get(key);
			System.out.println(key +":" + value);
		}

		reviewService.ReviewWrite(commandMap.getMap());

		mv.addObject("ITEM_NO", commandMap.get("ITEM_NO"));
		return mv;
	}
*/
	// 리뷰 상세보기
	@RequestMapping(value = "/review/detail.do", method=RequestMethod.POST)
	public @ResponseBody ModelAndView reviewDetail(@RequestBody Map<String, Object> jsonMap, 
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("review/detail");
		
		System.out.println("JSON" + jsonMap);
		for(String key:jsonMap.keySet()) {
			Object value = jsonMap.get(key);
			System.out.println(key +":" + value);
		}

		// 리뷰 상세보기 정보
		Map<String, Object> map = reviewService.ReviewDetail(jsonMap);
		System.out.println(map);
		// 리뷰 댓글 리스트
		List<Map<String, Object>> list = reviewService.ReviewCommentList(jsonMap);
		System.out.println(list);
		mv.addObject("ID", request.getSession().getAttribute("MEMBER_ID"));
		mv.addObject("map", map);
		mv.addObject("list", list);

		return mv;
	}

	// 리뷰 수정 폼
	@RequestMapping(value = "/review/updateForm.do")
	public ModelAndView reviewUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/review/write.do");

		Map<String, Object> map = reviewService.ReviewDetail(commandMap.getMap());
		mv.addObject("map", map);
		mv.addObject("IDX", request.getSession().getAttribute("MEMBER_ID"));

		return mv;
	}

	// 리뷰 수정 완료
	@RequestMapping(value = "/review/update.do")
	public ModelAndView reviewUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/itemDetail/item.do");
		
		System.out.println("UPDATE");
		String review = (String) commandMap.get("data");

		Gson gson = new Gson();

		Map<String, Object> data = gson.fromJson(review, new TypeToken<List<Map<String, Integer>>>() {
		}.getType());
		
		mv.addObject("ITEM_NO", data.get("ITEM_NO"));
		mv.addObject("REVIEW_NO", data.get("REVIEW_NO"));
		
		return mv;
	}

	// 리뷰 삭제
	@RequestMapping(value = "/review/delete.do")
	public ModelAndView reviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/itemDetail/item.do");
		commandMap.put("REVIEW_NO", request.getParameter("REVIEW_NO"));
		commandMap.put("ITEM_NO", request.getParameter("ITEM_NO"));

		System.out.println(commandMap.getMap());

		reviewService.ReviewDelete(commandMap.getMap());

		mv.addObject("ITEM_NO", commandMap.get("ITEM_NO"));

		return mv;
	}

	// 리뷰 댓글 쓰기
	@RequestMapping(value = "/review/writeComment.do")
	public ModelAndView reviewCommentInsert(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/review/detail.do");
		reviewService.ReviewCommentWrite(commandMap.getMap());

		// 리뷰 상세보기 정보
		reviewService.ReviewDetail(commandMap.getMap());
		// 리뷰 댓글 리스트
		reviewService.ReviewCommentList(commandMap.getMap());

		mv.addObject("REVIEW_NO", commandMap.get("REVIEW_NO"));
		mv.addObject("REVIEW_COMMENT_NO", commandMap.get("REVIEW_COMMENT_NO"));

		return mv;
	}

	// 리뷰 댓글 수정
	@RequestMapping(value = "/review/updateComment.do")
	public ModelAndView reviewCommentUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/review/detail.do");
		commandMap.put("REVIEW_COMMENT_NO", request.getParameter("REVIEW_COMMENT_NO"));

		reviewService.ReviewCommentUpdate(commandMap.getMap());

		mv.addObject("REVIEW_COMMENT_NO", commandMap.get("REVIEW_COMMENT_NO"));

		return mv;
	}

	// 리뷰 댓글 삭제
	@RequestMapping(value = "/review/commentDelete.do")
	public ModelAndView reviewCommentDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/review/detail.do");
		commandMap.put("REVIEW_COMMENT_NO", request.getParameter("REVIEW_COMMENT_NO"));

		reviewService.ReviewCommentDelete(commandMap.getMap());

		mv.addObject("REVIEW_NO", request.getParameter("REVIEW_NO"));
		return mv;
	}
}
