package grasse.item.item;

import java.util.List;
import java.util.Map;

public interface ItemService {

	// 상품 목록
	List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception;

	// 카테고리별 목록
	List<Map<String, Object>> selectCategoryList(Map<String, Object> map) throws Exception;

	// BEST 목록
	List<Map<String, Object>> selectBestList(Map<String, Object> map) throws Exception;

	// NEW 목록
	List<Map<String, Object>> selectNewList(Map<String, Object> map) throws Exception;

}
