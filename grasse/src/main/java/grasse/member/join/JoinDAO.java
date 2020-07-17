package grasse.member.join;

import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	//회원가입
	public void insertMember(Map<String, Object> map) throws Exception{
		insert("member.insertMember", map);
	}
	//아이디 중복확인 체크
	public int checkId(String MEMBER_ID) throws Exception{
		return (int)selectOne("member.checkId", MEMBER_ID);
	}
}
