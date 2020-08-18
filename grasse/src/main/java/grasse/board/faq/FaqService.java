package grasse.board.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {

	// FAQ 조회
	List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception;

	// FAQ 조회
	Map<String, Object> selectFaq(Map<String, Object> map) throws Exception;

	int getTotalList(Map<String, Object> map);
}
