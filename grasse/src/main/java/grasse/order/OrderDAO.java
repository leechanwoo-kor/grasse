package grasse.order;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {

	public void insertOrder(Map<String, Object> map) throws Exception {
		insert("order.insertOrder", map);
	}

	public void insertOrderDetail(Map<String, Object> map) throws Exception {
		insert("order.insertOrderDetail", map);
	}

	public void addPoint(Map<String, Object> map) {
		update("order.addPoint", map);
	}

	public void subPoint(Map<String, Object> map) {
		update("order.subPoint", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderInfo(Map<String, Object> map) {
		return selectList("order.selectOrderInfo", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderMemberInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("order.selectOrderMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderNo() {
		return (Map<String, Object>) selectOne("order.order_no");
	}
}
