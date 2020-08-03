package grasse.admin.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminBoardService")
public class AdminBoardImpl implements AdminBoardService {

	// adminBoardDAO
	@Resource(name = "adminBoardDAO")
	private AdminBoardDAO adminBoardDAO;
	
	// NOTICE 관리
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectNoticeList(map);
	}

	// NOTICE 작성
	@Override
	public void insertNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBoardDAO.insertNotice(map);
	}

	// FAQ 관리
	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectFaqList(map);
	}
	
	// QNA 관리
	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBoardDAO.selectQnaList(map);
	}

}
