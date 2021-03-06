package grasse.admin.item;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminItemService")
public class AdminItemServiceImpl implements AdminItemService {

	@Resource(name = "adminItemDAO")
	private AdminItemDAO adminItemDAO;

	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.selectItemList(map);
	}

	// 상품 등록
	@Override
	public void insertItem(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminItemDAO.insertItem(map);
	}

	@Override
	public int getTotalList(Map<String, Object> map) throws Exception {
		return adminItemDAO.getTotalList(map);
	}
}
