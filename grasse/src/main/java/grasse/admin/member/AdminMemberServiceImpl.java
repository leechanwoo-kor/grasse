package grasse.admin.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

	@Resource(name = "adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;

	// 회원 관리
	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.selectMemberList(map);
	}

	// 회원정보 조회
	@Override
	public Map<String, Object> selectMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminMemberDAO.selectId(map);
	}

	// 회원정보 삭제
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminMemberDAO.deleteMember(map);
	}
	
	@Override
	public int memberTotalList(Map<String, Object >map) throws Exception{
		return adminMemberDAO.memberTotalList(map);
	}
}