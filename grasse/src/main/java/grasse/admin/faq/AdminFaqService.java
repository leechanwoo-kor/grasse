package grasse.admin.faq;

import java.util.List;
import java.util.Map;

public interface AdminFaqService {

	// 공지사항 관리
	List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception;
}
