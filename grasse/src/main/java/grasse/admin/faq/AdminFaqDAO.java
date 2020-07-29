package grasse.admin.faq;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("adminFaqDAO")
public class AdminFaqDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.selectAllFaq", map);
	}
}
