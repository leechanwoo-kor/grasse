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

}
