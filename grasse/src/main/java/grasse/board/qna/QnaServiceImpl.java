package grasse.board.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Resource(name = "qnaDAO")
	private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaList(map);
	}

	@Override
	public List<Map<String, Object>> selectAdminQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectAdminQnaList(map);
	}

	// QNA 조회
	@Override
	public Map<String, Object> selectQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectQna(map);
	}

	@Override
	public int getTotalList(Map<String, Object> map) throws Exception {
		return qnaDAO.getTotalList(map);
	}
}
