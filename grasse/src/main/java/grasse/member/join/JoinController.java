package grasse.member.join;

import java.io.PrintWriter;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import grasse.common.map.CommandMap;

@Controller

public class JoinController {

	String sendEmailId = "grasseeeeee@gmail.com";

	@Resource(name = "joinService")
	private JoinService joinService;

	// 회원가입
	@RequestMapping(value = "/join/joinForm.do")
	public ModelAndView memberJoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/member/join/joinForm");

		return mv;
	}

	@RequestMapping(value = "/join/joinComplete.do", method = RequestMethod.POST)
	public ModelAndView joinComplete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/main/main");

		joinService.insertMember(commandMap.getMap());
		return mv;
	}

	// 회원가입시 아이디 중복체크.
	@RequestMapping(value = "/checkId.do")
	@ResponseBody
	public void checkId(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)
			throws Exception {
		PrintWriter out = response.getWriter();
		String paramId = (request.getParameter("MEMBER_ID") == null) ? ""
				: String.valueOf(request.getParameter("MEMBER_ID"));

		int checkId = joinService.checkId(paramId);
		out.print(checkId);
		out.flush();
		out.close();
	}

	// 이메일 인증메일발송
	@RequestMapping(value = "/join/joinEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean joinEmailCheck(@RequestParam String userEmail, @RequestParam int random,
			HttpServletRequest request) {

		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		session.setAttribute("userEmail", userEmail);
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증코드는 " + authCode + "입니다.");

		return joinService.send(subject, sb.toString(), sendEmailId, userEmail, null);
	}

	// 이메일 인증번호 확인
	@RequestMapping(value = "/join/emailAuth.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random,
			HttpSession session) {
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((Integer) session.getAttribute("random"));

		if (originalJoinCode.equals(authCode) && originalRandom.equals(random))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else
			return new ResponseEntity<String>("false", HttpStatus.OK);
	}

}