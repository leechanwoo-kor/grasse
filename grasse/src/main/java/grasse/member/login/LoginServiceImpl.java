package grasse.member.login;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;

	// 로그인
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		return loginDAO.selectId(map);
	}

	// 아이디 찾기
	@Override
	public List<Map<String, Object>> findIdWithEmail(Map<String, Object> map) throws Exception {

		return (List<Map<String, Object>>) loginDAO.findIdWithEmail(map);
	}

	/* 비밀번호 찾기 */
	public void changePw(Map<String, Object> map) throws Exception {
		
		loginDAO.changePw(map);
	}

	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	@Override
	public void keepLogin(Map<String, Object> map) throws Exception {
		loginDAO.keepLogin(map);
	}

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	@Override
	public Map<String, Object> checkUserWithSessionKey(String SESSIONKEY) {
		return loginDAO.checkUserWithSessionKey(SESSIONKEY);

	}

}
