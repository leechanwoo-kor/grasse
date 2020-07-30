package grasse.item.itemDetail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("itemDetailService")
public class ItemDetailServiceImpl implements ItemDetailService {
	@Resource(name = "itemDetailDAO")
	private ItemDetailDAO itemDetailDAO;

	// 상세보기
	@Override
	public Map<String, Object> selectOneItem(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = itemDetailDAO.selectOneItem(map);
		resultMap.put("map", tempMap);

		return resultMap;
	}

	@Override
	public void updateReadcnt(Map<String, Object> map) throws Exception {
		itemDetailDAO.updateReadcnt(map);
	}

	@Override
	public List<Map<String, Object>> selectItemAttribute(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) itemDetailDAO.selectItemAttribute(map);
	}
}