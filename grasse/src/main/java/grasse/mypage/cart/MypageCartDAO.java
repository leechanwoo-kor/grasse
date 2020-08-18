package grasse.mypage.cart;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("mypageCartDAO")
public class MypageCartDAO extends AbstractDAO {

	// CART_NO_SEQ 값 가져오기
	public int selectCartNo() {
		return selectInt("cart.selectCartNo");
	}

	// 카트에 상품 추가
	public void addCart(Map<String, Object> map) {
		insert("cart.insertOneItem", map);
	}

	// 장바구니에 있는 상품 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneItem(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("cart.selectOneItem", map);
	}

	// 상품 수량 변경
	public void updateItemCount(Map<String, Object> map) {
		update("cart.updateItemCount", map);
	}

	public void deleteOneItem(Map<String, Object> map) {
		delete("cart.deleteOneItem", map);
	}

	// 장바구니 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllCartList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("cart.selectAllCartList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllCartListNULL(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("cart.selectAllCartListNULL", map);
	}
}
