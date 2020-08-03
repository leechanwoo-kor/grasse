package grasse.admin.login;

import java.util.Map;

public interface AdminLoginService {

	// 로그인 하기
	Map<String, Object> login(Map<String, Object> map) throws Exception;
}
