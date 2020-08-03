package grasse.member.member;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

}
