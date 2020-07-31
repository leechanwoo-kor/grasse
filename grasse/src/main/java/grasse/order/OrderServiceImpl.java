package grasse.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import grasse.common.util.OrderDetailUtils;
import grasse.item.item.ItemDAO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Resource(name = "orderDAO")
	private OrderDAO orderDAO;
	/*
	 * @Resource(name = "cartDAO") private CartDAO cartDAO;
	 */
	@Resource(name = "itemDAO")
	private ItemDAO itemDAO;

	@Resource(name = "orderDetailUtils")
	private OrderDetailUtils orderDetailUtils;

	// 주문입력
	@Override
	@Transactional
	public void insertOrder(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// 주문인서트
		orderDAO.insertOrder(map);

		Object order_no = (Object) orderDAO.selectOrderNo().get("ORDER_NO");
		map.put("ORDER_NO", order_no);
		// 주문디테일 인서트
		List<Map<String, Object>> detailList = OrderDetailUtils.parseInsertOrderDetail(map, request);

		for (int i = 0; i < detailList.size(); i++) {
			orderDAO.insertOrderDetail(detailList.get(i));
			/* ItemDAO.updateItemCnt(detailList.get(i)); */
		}

		// 포인트 적립
		if (map.get("ADDPOINT") != null)
			orderDAO.addPoint(map);

		// 포인트 사용
		if (map.get("USEPOINT") != null)
			orderDAO.subPoint(map);
	}

	// 주문상세 입력
	@Override
	public void insertOrderDetail(Map<String, Object> map) throws Exception {
		orderDAO.insertOrderDetail(map);
	}

	// 주문정보조회
	@Override
	public List<Map<String, Object>> selectOrderInfo(Map<String, Object> map) {
		return orderDAO.selectOrderInfo(map);
	}

	// 주문고객정보조회
	@Override
	public Map<String, Object> selectOrderMemberInfo(Map<String, Object> map) {
		return orderDAO.selectOrderMemberInfo(map);
	}
}
