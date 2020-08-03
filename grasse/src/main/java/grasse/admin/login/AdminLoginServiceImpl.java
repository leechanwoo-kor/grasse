package grasse.admin.login;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService {

	@Resource(name = "adminLoginDAO")
	private AdminLoginDAO adminLoginDAO;

	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminLoginDAO.selectId(map);
	}

}
