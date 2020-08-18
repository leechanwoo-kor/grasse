package grasse.mypage.order;

import java.util.List;
import java.util.Map;

public interface MypageOrderService {

	// 내 리뷰
	List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) throws Exception;

	// 리뷰상세
	Map<String, Object> selectMyOrderDetail(Map<String, Object> map) throws Exception;

}
