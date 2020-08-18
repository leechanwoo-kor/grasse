package grasse.admin.order;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("adminOrderDAO")
public class AdminOrderDAO extends AbstractDAO {

	// 주문 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectOrderList", map);
	}

	// 주문 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrder(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.orderInfo", map);
	}

	// 회원정보 삭제
	public void deleteOrder(Map<String, Object> map) throws Exception {
		delete("order.deleteOrder", map);
	}

	public int orderTotalList(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("order.orderTotalList", map);
	}
}
