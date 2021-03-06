package grasse.board.faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("faqService")
public class FaqServiceImpl implements FaqService {

	@Resource(name = "faqDAO")
	private FaqDAO faqDAO;

	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.selectFaqList(map);
	}

	// FAQ 조회
	@Override
	public Map<String, Object> selectFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return faqDAO.selectFaq(map);
	}

	@Override
	public int getTotalList(Map<String, Object> map) {
		return faqDAO.getTotalList(map);
	}

}
