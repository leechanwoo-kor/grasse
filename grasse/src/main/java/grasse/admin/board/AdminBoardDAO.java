package grasse.admin.board;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("adminBoardDAO")
public class AdminBoardDAO extends AbstractDAO {

	/* NOTICE */

	// NOTICE 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.selectAllNotice", map);
	}

	// NOTICE 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNotice(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("notice.selectNotice", map);
	}

	// NOTICE 등록
	public void insertNotice(Map<String, Object> map) throws Exception {
		insert("notice.insertNotice", map);
	}

	// NOTICE 수정
	public void updateNotice(Map<String, Object> map) throws Exception {
		update("notice.updateNotice", map);
	}

	// NOTICE 삭제
	public void deleteNotice(Map<String, Object> map) throws Exception {
		delete("notice.deleteNotice", map);
	}
	
	public int noticeTotalList(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("notice.getTotalList", map);
	}

	/* FAQ */

	// FAQ 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.selectAllFaq", map);
	}

	// FAQ 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFaq(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("faq.selectFaq", map);
	}

	// FAQ 등록
	public void insertFaq(Map<String, Object> map) throws Exception {
		insert("faq.insertFaq", map);
	}

	// FAQ 수정
	public void updateFaq(Map<String, Object> map) throws Exception {
		update("faq.updateFaq", map);
	}

	// FAQ 삭제
	public void deleteFaq(Map<String, Object> map) throws Exception {
		delete("faq.deleteFaq", map);
	}
	
	public int faqTotalList(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("faq.getTotalList", map);
	}

	// QNA 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.selectAllQna", map);
	}

	// NOTICE 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQna(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qna.selectQna", map);
	}

	// NOTICE 등록
	public void insertQna(Map<String, Object> map) throws Exception {
		insert("qna.insertQna", map);
	}

	// NOTICE 수정
	public void updateQna(Map<String, Object> map) throws Exception {
		update("qna.updateQna", map);
	}

	// NOTICE 삭제
	public void deleteQna(Map<String, Object> map) throws Exception {
		delete("qna.deleteQna", map);
	}
	
	public int qnaTotalList(Map<String, Object> map) throws Exception{
		return (Integer) selectOne("qna.qnaTotalList", map);
	}

}
