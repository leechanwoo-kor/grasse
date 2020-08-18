package grasse.admin.board;

import java.util.List;
import java.util.Map;

public interface AdminBoardService {

	/* NOTICE */

	// NOTICE 관리
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;

	// NOTICE 조회
	Map<String, Object> selectNotice(Map<String, Object> map) throws Exception;

	// NOTICE 작성
	void insertNotice(Map<String, Object> map) throws Exception;

	// NOTICE 수정
	void updateNotice(Map<String, Object> map) throws Exception;

	// NOTICE 삭제
	void deleteNotice(Map<String, Object> map) throws Exception;

	int noticeTotalList(Map<String, Object> map) throws Exception;

	/* FAQ */

	// FAQ 관리
	List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception;

	// FAQ 조회
	Map<String, Object> selectFaq(Map<String, Object> map) throws Exception;

	// FAQ 작성
	void insertFaq(Map<String, Object> map) throws Exception;

	// FAQ 수정
	void updateFaq(Map<String, Object> map) throws Exception;

	// FAQ 삭제
	void deleteFaq(Map<String, Object> map) throws Exception;

	int faqTotalList(Map<String, Object> map) throws Exception;

	// QNA 관리
	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

	// QNA 조회
	Map<String, Object> selectQna(Map<String, Object> map) throws Exception;

	// QNA 작성
	void insertQna(Map<String, Object> map) throws Exception;

	// QNA 수정
	void updateQna(Map<String, Object> map) throws Exception;

	// QNA 삭제
	void deleteQna(Map<String, Object> map) throws Exception;

	int qnaTotalList(Map<String, Object> map) throws Exception;
}
