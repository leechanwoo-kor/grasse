package grasse.member.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	@Override
	public List<Map<String, Object>> memberInfoList(Map<String, Object> map) throws Exception {
		return memberDAO.memberInfoList(map);
	}

	@Override
	public Map<String, Object> memberInfo(Map<String, Object> map) throws Exception {
		return memberDAO.memberInfo(map);
	}

	/*
	 * @Override public Map<String, Object> memberDetail(Map<String, Object> map)
	 * throws Exception{ return MemberDAO.memberDetail(map); }
	 */
}
