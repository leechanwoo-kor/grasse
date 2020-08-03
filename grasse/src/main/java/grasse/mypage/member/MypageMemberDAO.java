package grasse.mypage.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("mypageMemberDAO")
public class MypageMemberDAO extends AbstractDAO {

	// 회원정보 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.memberInfo", map);
	}
	
	// 회원정보 수정
	public void updateMember(Map<String, Object> map)throws Exception {
		update("member.updateMember", map);
	}
	
	// 회원 탈퇴
	public void deleteMember(Map<String, Object> map) throws Exception {
		delete("member.deleteMember", map);
	}
}
