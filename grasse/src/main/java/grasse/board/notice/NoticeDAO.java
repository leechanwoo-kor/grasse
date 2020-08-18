package grasse.board.notice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notice.selectAllNotice", map);
	}

	// NOTICE 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNotice(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("notice.selectNotice", map);
	}

	public int getTotalList(Map<String, Object> map) {
		return (Integer) selectOne("notice.getTotalList", map);
	}
}
