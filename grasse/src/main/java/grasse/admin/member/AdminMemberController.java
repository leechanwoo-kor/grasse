package grasse.admin.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller
public class AdminMemberController {

	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value = "/admin/memberList.do")
	public ModelAndView selectMemberList(CommandMap commnadMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/member/list");

		List<Map<String, Object>> list = adminMemberService.selectMemberList(commnadMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
}
