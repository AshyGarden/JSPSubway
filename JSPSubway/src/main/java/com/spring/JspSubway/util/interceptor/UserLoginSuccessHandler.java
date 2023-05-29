package com.spring.JspSubway.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserLoginSuccessHandler implements HandlerInterceptor{
	
	//preHandle은 컨트롤러로 요청이 들어가기전 처리해야할 로직을 작성
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		log.info("prehandler activate");
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
		
	//posthandle는 컨트롤러를 나갈때 공통 처리해야할 내용을 작성.
	// /userLogin이라는 요청이 마무리된후 viewresolver로 전달되기전 로그인 성공/실패 여부에 따라 처리할 로직
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("로그인 인터셉터 동작!");
		log.info("요청 방식: "+request.getMethod());
			
		if(request.getMethod().equals("POST")) {
				
			ModelMap map = modelAndView.getModelMap(); //모델 객체 꺼내기
			String id = (String) map.get("user"); //모델 내에 user라는 이름의 데이터 꺼내기
			//log.info("인터셉처 내부에서 user 확인: "+vo.toString()); //null오면 이코드 밑부터 코드가 죽음
				
			if(id != null) { //로그인 성공
				log.info("login Success");
				//login 성공한 회원에게 session생성후 로그인 유지하게끔 함.
				HttpSession session = request.getSession();
				session.setAttribute("login",id);
				
				//posthandler에게 넘어가기전에 redirect
				response.sendRedirect(request.getContextPath()+"/"); 
			} else { //로그인 실패
				modelAndView.addObject("user","loginFail");
			}
		}
	}

}
