package grasse.mypage.cart;

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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import grasse.common.map.CommandMap;

@Controller
public class MypageCartController {

	@Resource(name = "mypageCartService")
	private MypageCartService mypageCartService;

	@SuppressWarnings("unchecked")
	@RequestMapping("/mypage/cartList.do")
	public ModelAndView cartList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/mypage/cart/list");
		HttpSession session = request.getSession();
		
		List<Map<String, Object>> cartList;

		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
		if (member != null) {
			commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
			cartList = mypageCartService.selectAllCartList(commandMap.getMap());
		}
			
		else {
			commandMap.put("MEMBER_ID", "");
			cartList = mypageCartService.selectAllCartListNULL(commandMap.getMap());
		}


		mv.addObject("cartList", cartList);
		return mv;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cart/addCart.do")
	public ModelAndView addCart(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/mypage/cartList.do");

		String attr = (String) commandMap.get("ATTRIBUTE");

		Gson gson = new Gson();

		List<Map<String, Object>> attributeList = gson.fromJson(attr, new TypeToken<List<Map<String, Object>>>() {
		}.getType());
		/*
		 * for(int i=0; i<attributeList.size(); i++) { Map<String,Object> attribute =
		 * attributeList.get(i); System.out.println(attribute);
		 * 
		 * for(String key : attribute.keySet()){
		 * 
		 * Object value = attribute.get(key);
		 * 
		 * System.out.println(key+" : "+value);
		 * 
		 * } }
		 */
		HttpSession session = request.getSession();
		// 로그인 된 상태면 MEMBER_ID 저장
		Map<String, Object> member = (Map<String, Object>) session.getAttribute("member");
		if (member != null)
			commandMap.put("MEMBER_ID", member.get("MEMBER_ID"));
		else
			commandMap.put("MEMBER_ID", "");

		for (Map<String, Object> attributeMap : attributeList) {
			commandMap.put("COUNT", attributeMap.get("COUNT"));
			commandMap.put("ATTRIBUTE_NO", attributeMap.get("ATTRIBUTE_NO"));

			// ITEM_NO, MEMBER_NO, ATTRIBUTE_NO가 동일한 데이터가 존재하면 COUNT 증가시켜줌.
			Map<String, Object> cartItem = mypageCartService.selectOneItem(commandMap.getMap());
			if (cartItem != null) {
				commandMap.put("CART_NO", cartItem.get("CART_NO"));
				mypageCartService.updateItemCount(commandMap.getMap());
			}

			// 존재하지 않으면 cart에 데이터 추가
			else {
				// CART_NO_SEQ.NEXTVAL()값 받아와서 CART_NO로 저장
				commandMap.put("CART_NO", mypageCartService.selectCartNo());
				mypageCartService.addCart(commandMap.getMap());
			}
		}

		return mv;
	}

	@RequestMapping("/cart/cartUpdate.do")
	public @ResponseBody void cartUpdate(@RequestBody Map<String, Object> jsonMap) throws Exception {

		for(String key : jsonMap.keySet()) {
			Object value = jsonMap.get(key);
			System.out.println(key + ":" + value);
		}
		
		int index = (int) jsonMap.get("index");

		// 수량증가
		if (index == 0) {
			jsonMap.put("COUNT", 1);
		} else { // 감소
			jsonMap.put("COUNT", -1);
		}
		mypageCartService.updateItemCount(jsonMap);
	}

	@RequestMapping("/cart/cartDelete.do")
	public @ResponseBody void cartDelete(@RequestBody Map<String, Object> jsonMap) throws Exception {

		for(String key : jsonMap.keySet()) {
			Object value = jsonMap.get(key);
			System.out.println(key + ":" + value);
		}
		int index = (int) jsonMap.get("index");
		// 아이템 하나 삭제
		if (index == 1) {
			mypageCartService.deleteOneItem(jsonMap);
		} else { // 체크박스로 선택한 아이템 삭제
			List<Integer> CART_NO_LIST = (List<Integer>) jsonMap.get("CART_NO_LIST");
			for (int i : CART_NO_LIST) {
				jsonMap.put("CART_NO", i);
				mypageCartService.deleteOneItem(jsonMap);
			}
		}

	}

	@RequestMapping("/cart/cartOrder.do")
	public ModelAndView cartOrder(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/cart/cart");
		return mv;

	}
}
