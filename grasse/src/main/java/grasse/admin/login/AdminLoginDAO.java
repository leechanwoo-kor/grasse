package grasse.admin.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("adminLoginDAO")
public class AdminLoginDAO extends AbstractDAO {

	// 로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.memberInfo", map);
	}
}
