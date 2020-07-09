package grasse.join;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;


@Service("joinService")
public class JoinServiceImpl implements JoinService{

    @Resource(name="joinDAO")
	private JoinDAO joinDAO  ;
	
	
  //회원가입
	@Override
	public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		joinDAO.insertMember(map);
	}
		
	// 이메일인증시, ID중복체크
	@Override
	public int checkMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.checkMember(map);
	}
	
	//회원가입 id중복체크
	@Override
	public int chekcId(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.checkId(MEMBER_ID);
	}

}