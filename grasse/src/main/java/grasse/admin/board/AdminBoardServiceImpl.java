package grasse.admin.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminBoardService")
public class AdminBoardServiceImpl implements AdminBoardService {

	// adminBoardDAO
	@Resource(name = "adminBoardDAO")
	private AdminBoardDAO adminBoardDAO;

	/* NOTICE */

	// NOTICE 관리
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectNoticeList(map);
	}

	// NOTICE 조회
	@Override
	public Map<String, Object> selectNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectNotice(map);
	}

	// NOTICE 작성
	@Override
	public void insertNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.insertNotice(map);
	}

	// NOTICE 수정
	@Override
	public void updateNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.updateNotice(map);
	}

	// NOTICE 삭제
	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.deleteNotice(map);
	}

	@Override
	public int noticeTotalList(Map<String, Object> map) throws Exception {
		return adminBoardDAO.noticeTotalList(map);
	}
	/* FAQ */

	// FAQ 관리
	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectFaqList(map);
	}

	// FAQ 조회
	@Override
	public Map<String, Object> selectFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectFaq(map);
	}

	// FAQ 작성
	@Override
	public void insertFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.insertFaq(map);
	}

	// FAQ 수정
	@Override
	public void updateFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.updateFaq(map);
	}

	// FAQ 삭제
	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.deleteFaq(map);
	}

	@Override
	public int faqTotalList(Map<String, Object> map) throws Exception {
		return adminBoardDAO.faqTotalList(map);
	}
	/* QNA */

	// QNA 관리
	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectQnaList(map);
	}

	// QNA 조회
	@Override
	public Map<String, Object> selectQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectQna(map);
	}

	// QNA 작성
	@Override
	public void insertQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.insertQna(map);
	}

	// QNA 수정
	@Override
	public void updateQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.updateQna(map);
	}

	// QNA 삭제
	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.deleteQna(map);
	}

	@Override
	public int qnaTotalList(Map<String, Object> map) throws Exception {
		return adminBoardDAO.qnaTotalList(map);
	}
}
