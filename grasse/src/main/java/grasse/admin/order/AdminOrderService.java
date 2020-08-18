package grasse.admin.order;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {

	// 주문 관리
	List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception;
	
	int orderTotalList(Map<String, Object> map) throws Exception;
}
