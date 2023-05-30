package com.spring.JspSubway.user.service;

import com.spring.JspSubway.command.UserVO;

public interface ISubwayUserService {

	// 회원 가입
	void join(UserVO vo);

	// 로그인
	String login(String id, String pw);

	// 아이디 중복 확인
	int idCheck(String id);
	
}
