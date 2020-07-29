package grasse.admin.notice;

import java.util.List;
import java.util.Map;

public interface AdminNoticeService {

	// 공지사항 관리
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
	
	// 공지사항 작성
	void insertNotice(Map<String, Object> map) throws Exception;
}
