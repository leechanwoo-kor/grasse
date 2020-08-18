package grasse.item.item;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("itemDAO")
public class ItemDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("item.selectAllItem", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCategoryList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("item.selectCategoryItem", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBestList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("item.selectBestItem", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("item.selectNewItem", map);
	}

}
