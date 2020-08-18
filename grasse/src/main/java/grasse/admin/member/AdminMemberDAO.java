package grasse.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO {

	// 회원 관리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.selectMemberList", map);
	}

	// 회원정보 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.memberInfo", map);
	}

	// 회원정보 삭제
	public void deleteMember(Map<String, Object> map) throws Exception {
		delete("member.deleteMember", map);
	}

	public int memberTotalList(Map<String, Object> map) throws Exception {
		return (Integer) selectOne("member.memberTotalList", map);
	}
}
