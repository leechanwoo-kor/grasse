package grasse.admin.item;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminItemService")
public class AdminItemServiceImpl implements AdminItemService{

	@Resource(name="adminItemDAO")
	private AdminItemDAO adminItemDAO;

	@Override
	public List<Map<String, Object>> selectItemList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminItemDAO.selectItemList(map);
	}
	
	
}
