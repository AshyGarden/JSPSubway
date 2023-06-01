package com.spring.JspSubway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.JspSubway.command.UserVO;
import com.spring.JspSubway.user.service.ISubwayUserService;
import com.spring.JspSubway.util.interceptor.MailSenderService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user")
@Slf4j
public class SubwayUserController {

	@Autowired
	private ISubwayUserService userService;
	private MailSenderService mailService;
	
	// 회원가입 페이지로 이동
	@GetMapping("/userJoin")
	public void userJoin() {}
	
	// 아이디 중복 확인(비동기)
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		log.info("userId : " + userId);
		int result = userService.idCheck(userId);
		if(result == 1) return "duplicated";
		else return "ok";
	}
	
	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		log.info("이메일 인증 요청 : " + email);
		return mailService.joinEmail(email);
	}
	
	// 회원 가입 처리
	@GetMapping("join")
	public String join(UserVO vo, RedirectAttributes ra) {
		userService.join(vo);
		ra.addFlashAttribute("msg", "joinSuccess");  // userLogin.jsp의 script에 작성할거임
		return "redirect:/user/userLogin";
	}
	

	//로그인 페이지로 이동
	@GetMapping("/userLogin")
	public void login() {}
	
	// 로그인 요청
	@PostMapping("/userLogin")
	public void login(String userId, String userPw, Model model) {
		log.info("나는 SubwayUserController의 login이다!");
		model.addAttribute("user", userService.login(userId,userPw));
	}	
}