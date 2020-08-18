package grasse.admin.member;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {

	// 회원 관리
	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;

	// 회원정보 조회
	Map<String, Object> selectMember(Map<String, Object> map) throws Exception;

	// 회원정보 삭제
	void deleteMember(Map<String, Object> map) throws Exception;

	int memberTotalList(Map<String, Object> map) throws Exception;
}
