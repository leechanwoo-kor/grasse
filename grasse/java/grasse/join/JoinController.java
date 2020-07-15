package grasse.join;

import java.io.PrintWriter;
import java.security.Key;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;


@Controller

public class JoinController {
	
	String authNum = "";

	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping(value="/join/joinForm.do")
	public ModelAndView joinForm() {
		ModelAndView mv = new ModelAndView("/join/joinForm");
		
		return mv;
	}
	
	@RequestMapping(value="/joinStep1")
	public ModelAndView joinStep1(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/joinStep1");
		return mv;
	}
	
	@RequestMapping(value="/joinStep1Email")
	public ModelAndView modal_email(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/joinEmail");
		return mv;
	}
	
	/*@RequestMapping("/join/privacy")
	public String privacyForm() throws Exception {
		return "member/privacy";
	}*/
	
	//회원가입 폼으로
	@RequestMapping(value="/joinStep2")
	public ModelAndView joinStep2(Model model,HttpSession session,HttpServletResponse response, HttpServletRequest request,CommandMap Map)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		/*if(! request.getHeader("Referer").equals("http://3T/join/privacy")) {
			mv.addObject("/error");
			return mv;
		}*/
		
		
		//이메일 인증한값 폼으로 넘겨주기위해.
		String email1 = (String) Map.getMap().get("email1");
		String email2 = (String) Map.getMap().get("email2");
		
		mv.setViewName("member/joinStep222");
		session.setAttribute("email1",email1);
		session.setAttribute("email2",email2);
		
		return mv;
	}
	
	//회원가입 성공시
	@RequestMapping(value="/joinComplete", method=RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String EMAIL = request.getParameter("EMAIL1")+"@"+request.getParameter("EMAIL2");
		commandMap.getMap().put("EMAIL", EMAIL);
			
		
		if(session.getAttribute("RSA_private") != null) {
			
			System.out.println("(Key)session.getAttribute(\"RSA_private\")="+(Key)session.getAttribute("RSA_private"));
			//(Key)session.getAttribute("RSA_private")=sun.security.rsa.RSAPrivateCrtKeyImpl@fff09455
			
			return mv;
		}

		session.removeAttribute("RSA_private");
		
		
		joinService.insertMember(commandMap.getMap(), request);
		mv.setViewName("member/loginForm");
		return mv;
		
	}
	
	//회원가입시 아이디 중폭체크.
	@RequestMapping(value="/checkId")
	@ResponseBody
	public void checkId(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception{
		PrintWriter out = response.getWriter();
		String paramId= (request.getParameter("MEMBER_ID") == null)?"":String.valueOf(request.getParameter("MEMBER_ID"));
		int checkId = joinService.chekcId(paramId);

		out.print(checkId);
		out.flush();
		out.close();
	}
	
}