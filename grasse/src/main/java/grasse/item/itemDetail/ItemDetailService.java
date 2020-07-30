package grasse.item.itemDetail;

import java.util.List;
import java.util.Map;

public interface ItemDetailService {
	public Map<String, Object> selectOneItem(Map<String, Object> map) throws Exception;

	public void updateReadcnt(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectItemAttribute(Map<String, Object> map) throws Exception;
}
