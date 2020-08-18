package grasse.board.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {

	// 공지사항 조회
	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

	// 공지사항 조회
	List<Map<String, Object>> selectAdminQnaList(Map<String, Object> map) throws Exception;

	// QNA 조회
	Map<String, Object> selectQna(Map<String, Object> map) throws Exception;

	int getTotalList(Map<String, Object> map) throws Exception;
}
