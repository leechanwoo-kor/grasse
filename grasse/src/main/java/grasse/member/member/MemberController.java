package grasse.member.member;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "memberService")
	private MemberService memberService;

	@RequestMapping(value = "/member/join.do")
	public ModelAndView openSampleBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/sample/boardList");

		return mv;
	}
}
