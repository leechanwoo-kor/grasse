package grasse.admin.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService{

	@Resource(name="adminNoticeDAO")
	private AdminNoticeDAO adminNoticeDAO;
	
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminNoticeDAO.selectNoticeList(map);
	}

	// 공지사항 작성
	@Override
	public void insertNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminNoticeDAO.insertNotice(map);
	}
	
	
	
}
