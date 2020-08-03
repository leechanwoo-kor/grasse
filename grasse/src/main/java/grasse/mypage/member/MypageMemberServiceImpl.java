package grasse.mypage.member;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mypageMemberService")
public class MypageMemberServiceImpl implements MypageMemberService {

	@Resource(name = "mypageMemberDAO")
	private MypageMemberDAO mypageMemberDAO;

	// 회원정보 조회
	@Override
	public Map<String, Object> selectMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mypageMemberDAO.selectId(map);
	}

	// 회원정보 수정
	@Override
	public void updateMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mypageMemberDAO.updateMember(map);
	}

	// 회원 탈퇴
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mypageMemberDAO.deleteMember(map);
	}
	

}
