package grasse.mypage.cart;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mypageCartService")
public class MypageCartServiceImpl implements MypageCartService {

	@Resource(name = "mypageCartDAO")
	private MypageCartDAO mypageCartDAO;

	@Override
	public int selectCartNo() {
		return mypageCartDAO.selectCartNo();
	}

	@Override
	public void addCart(Map<String, Object> map) throws Exception {
		mypageCartDAO.addCart(map);
	}

	@Override
	public Map<String, Object> selectOneItem(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) mypageCartDAO.selectOneItem(map);
	}

	@Override
	public void updateItemCount(Map<String, Object> map) throws Exception {
		mypageCartDAO.updateItemCount(map);
	}

	@Override
	public void deleteOneItem(Map<String, Object> map) throws Exception {
		mypageCartDAO.deleteOneItem(map);
	}

	@Override
	public List<Map<String, Object>> selectAllCartList(Map<String, Object> map) throws Exception {
		return mypageCartDAO.selectAllCartList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectAllCartListNULL(Map<String, Object> map) throws Exception {
		return mypageCartDAO.selectAllCartListNULL(map);
	}
}
