package grasse.board.qna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.selectAllQna", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminQnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.selectAdminAllQna", map);
	}

	// QNA 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQna(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qna.selectQna", map);
	}

	public int getTotalList(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("qna.qnaTotalList", map);
	}

}
