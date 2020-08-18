package grasse.mypage.order;

import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mypageOrderService")
public class MypageOrderServiceImpl implements MypageOrderService {
	@Resource(name = "mypageOrderDAO")
	private MypageOrderDAO mypageOrderDAO;

	// 내 주문
	public List<Map<String, Object>> selectMyOrderList(Map<String, Object> map) throws Exception {
		return mypageOrderDAO.selectMyOrderList(map);
		
		
	}

	// 주문상세
	public Map<String, Object> selectMyOrderDetail(Map<String, Object> map) throws Exception {
		return mypageOrderDAO.selectMyOrderDetail(map);
	}

}
