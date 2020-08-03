package grasse.mypage.member;

import java.util.Map;

public interface MypageMemberService {

	// 회원정보 조회
	Map<String, Object> selectMember(Map<String,Object> map) throws Exception;
	
	// 회원정보 수정
	void updateMember(Map<String, Object> map) throws Exception;
	
	// 회원 탈퇴
	void deleteMember(Map<String, Object> map) throws Exception;
}
