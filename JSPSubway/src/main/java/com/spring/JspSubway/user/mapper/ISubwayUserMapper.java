package com.spring.JspSubway.user.mapper;

import com.spring.JspSubway.command.UserVO;

public interface ISubwayUserMapper {

	// 회원 가입
	void join(UserVO vo);
	
	// 로그인 요청 
	String login(String id);
	
	// 아이디 중복 확인
	int idCheck(String id);
	
	// 이름 불러오기
	String getUserName(String id);
	
}
