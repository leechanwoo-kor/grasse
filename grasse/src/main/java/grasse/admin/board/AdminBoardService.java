package grasse.admin.board;

import java.util.List;
import java.util.Map;

public interface AdminBoardService {

	// NOTICE 관리
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;

	// NOTICE 작성
	void insertNotice(Map<String, Object> map) throws Exception;

	// FAQ 관리
	List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception;
	
	// QNA 관리
	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;
}
