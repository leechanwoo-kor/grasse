package grasse.admin.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {

	@Resource(name = "adminOrderDAO")
	private AdminOrderDAO adminOrderDAO;

	// 주문 관리
	@Override
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminOrderDAO.selectOrderList(map);
	}

	@Override
	public int orderTotalList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminOrderDAO.orderTotalList(map);
	}

}
