package grasse.item.itemDetail;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("itemDetailDAO")
public class ItemDetailDAO extends AbstractDAO {

	// 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneItem(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("item.selectOneItem", map);
	}

	public void updateReadcnt(Map<String, Object> map) throws Exception {
		update("item.updateReadcnt", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectItemAttribute(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("item.selectItemAttribute", map);
	}
}