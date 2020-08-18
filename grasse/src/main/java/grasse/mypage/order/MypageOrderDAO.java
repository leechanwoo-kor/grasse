package grasse.mypage.order;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import grasse.common.dao.AbstractDAO;

@Repository("mypageOrderDAO")
public class MypageOrderDAO extends AbstractDAO {

	// 내 주문
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("order.selectMyOrderList", map);
	}

	// 주문상세
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyOrderDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("order.selectMyOrderDetail", map);
	}

}
