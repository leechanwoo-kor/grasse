package grasse.admin.notice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("adminNoticeDAO")
public class AdminNoticeDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.selectAllNotice", map);
	}
	
	// 공지사항 등록
	public void insertNotice(Map<String, Object> map) throws Exception{
		insert("notice.insertNotice", map);
	}
}
