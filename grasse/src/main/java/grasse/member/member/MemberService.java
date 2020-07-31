package grasse.member.member;

import java.util.List;
import java.util.Map;

public interface MemberService {

	public List<Map<String, Object>> memberInfoList(Map<String, Object> map) throws Exception;

	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception;
	
	/*
	 * public Map<String, Object> memberDetail(Map<String, Object> map) throws
	 * Exception;
	 */
}
