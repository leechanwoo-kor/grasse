package grasse.item.itemDetail;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("itemDetailService")
public class ItemDetailServiceImpl implements ItemDetailService {
	@Resource(name = "itemDetailDAO")
	private ItemDetailDAO itemDetailDAO;

	@Override
	public Map<String, Object> selectOneItem(Map<String, Object> map) {
		return itemDetailDAO.selectOneItem(map);
	}

	@Override
	public void updateReadcnt(Map<String, Object> map) {
		itemDetailDAO.updateReadcnt(map);
	}

	@Override
	public List<Map<String, Object>> selectItemAttribute(Map<String, Object> map) {
		return (List<Map<String, Object>>) itemDetailDAO.selectItemAttribute(map);
	}
}