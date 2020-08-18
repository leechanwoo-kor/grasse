package grasse.item.item;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("itemService")
public class ItemServiceImpl implements ItemService {

	@Resource(name = "itemDAO")
	private ItemDAO itemDAO;

	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.selectItemList(map);
	}

	// 카테고리별 목록
	@Override
	public List<Map<String, Object>> selectCategoryList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.selectCategoryList(map);
	}

	// BEST 목록
	@Override
	public List<Map<String, Object>> selectBestList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.selectBestList(map);
	}

	// NEW 목록
	@Override
	public List<Map<String, Object>> selectNewList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return itemDAO.selectNewList(map);
	}

}
