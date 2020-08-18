package grasse.board.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name = "noticeDAO")
	private NoticeDAO noticeDAO;

	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.selectNoticeList(map);
	}

	// NOTICE 조회
	@Override
	public Map<String, Object> selectNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.selectNotice(map);
	}

	@Override
	public int getTotalList(Map<String, Object> map) throws Exception {
		return noticeDAO.getTotalList(map);
	}

}
