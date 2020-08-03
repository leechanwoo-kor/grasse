package grasse.admin.board;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("adminBoardDAO")
public class AdminBoardDAO extends AbstractDAO {

	// NOTICE 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.selectAllNotice", map);
	}

	// NOTICE 등록
	public void insertNotice(Map<String, Object> map) throws Exception {
		insert("notice.insertNotice", map);
	}

	// FAQ 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.selectAllFaq", map);
	}
	
	// QNA 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.selectAllQna", map);
	}

}
