package grasse.item.item;

import java.util.List;
import java.util.Map;

public interface ItemService {

	// 상품 목록
	List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception;

}
