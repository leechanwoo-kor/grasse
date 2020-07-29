package grasse.admin.item;

import java.util.List;
import java.util.Map;

public interface AdminItemService {

	// 상품 관리
	List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception;
	
	// 상품 등록
	void insertItem(Map<String, Object> map) throws Exception;
}
