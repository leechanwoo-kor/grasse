package grasse.admin.faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService {

	@Resource(name = "adminFaqDAO")
	private AdminFaqDAO adminFaqDAO;

	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminFaqDAO.selectFaqList(map);
	}

}
