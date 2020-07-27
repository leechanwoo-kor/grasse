package grasse.admin.item;

import java.util.List;
import java.util.Map;

public interface AdminItemService {

	List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception;
}
