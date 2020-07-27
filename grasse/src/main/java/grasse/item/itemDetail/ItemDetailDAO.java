package grasse.item.itemDetail;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("itemDetailDAO")
public class ItemDetailDAO extends AbstractDAO {
	public Map<String, Object> selectOneItem(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("item.selectOneItem", map);
	}

	public void updateReadcnt(Map<String, Object> map) {
		update("item.updateReadcnt", map);
	}

	public List<Map<String, Object>> selectItemAttribute(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("item.selectItemAttribute", map);
	}
}