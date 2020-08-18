package grasse.board.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	// 공지사항 조회
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;

	// 공지사항 조회
	Map<String, Object> selectNotice(Map<String, Object> map) throws Exception;

	int getTotalList(Map<String, Object> map) throws Exception;
}
