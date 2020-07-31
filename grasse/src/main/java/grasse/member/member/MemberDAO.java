package grasse.member.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import grasse.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{
	
	//회원정보 리스트로 불러오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> memberInfoList(Map<String, Object> map) throws Exception{
		return selectList("member.memberInfoList", map);
	}
	//회원정보 맵으로 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("member.memberInfo", map);
	}
	
	/*
	 * @SuppressWarnings("unchecked") public Map<String, Object>
	 * memberDetail(Map<String, Object> map) throws Exception{ return (Map<String,
	 * Object>) selectOne("member.memberInfo", map); }
	 */
}
