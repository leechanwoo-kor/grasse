package grasse.order;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface OrderService {
	public void insertOrder(Map<String, Object> map, HttpServletRequest request) throws Exception;

	public void insertOrderDetail(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectOrderInfo(Map<String, Object> map);

	public Map<String, Object> selectOrderMemberInfo(Map<String, Object> map);

}
