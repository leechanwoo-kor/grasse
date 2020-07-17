package grasse.member.join;

import java.util.Map;

public interface JoinService {

	// 회원가입 폼으로 이동
	// 회원가입시, ID중복체크 폼으로 이동

	// 회원정보를 DB에 등록(회원가입)
	void insertMember(Map<String, Object> map) throws Exception;

	// 회원가입 id중복체크
	int checkId(String MEMBER_ID) throws Exception;

	// 메일 인증
	public boolean send(String subject, String text, String from, String to, String filePath);

}
