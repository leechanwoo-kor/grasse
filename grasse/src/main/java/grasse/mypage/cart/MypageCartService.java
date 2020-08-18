package grasse.mypage.cart;

import java.util.List;
import java.util.Map;

public interface MypageCartService {
	public int selectCartNo() throws Exception;

	public void addCart(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectOneItem(Map<String, Object> map) throws Exception;

	public void updateItemCount(Map<String, Object> map) throws Exception;

	public void deleteOneItem(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectAllCartList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectAllCartListNULL(Map<String, Object> map) throws Exception;
}
