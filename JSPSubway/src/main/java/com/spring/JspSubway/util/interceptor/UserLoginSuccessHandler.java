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
	
	//preHandle�� ��Ʈ�ѷ��� ��û�� ������ ó���ؾ��� ������ �ۼ�
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		log.info("prehandler activate");
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
		
	//posthandle�� ��Ʈ�ѷ��� ������ ���� ó���ؾ��� ������ �ۼ�.
	// /userLogin�̶�� ��û�� ���������� viewresolver�� ���޵Ǳ��� �α��� ����/���� ���ο� ���� ó���� ����
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("�α��� ���ͼ��� ����!");
		log.info("��û ���: "+request.getMethod());
			
		if(request.getMethod().equals("POST")) {
				
			ModelMap map = modelAndView.getModelMap(); //�� ��ü ������
			String id = (String) map.get("user"); //�� ���� user��� �̸��� ������ ������
			String name = (String) map.get("name");
			log.info("맵에 넣을 name : " + name);
			//log.info("���ͼ�ó ���ο��� user Ȯ��: "+vo.toString()); //null���� ���ڵ� �غ��� �ڵ尡 ����
				
			if(id != null) { //�α��� ����
				log.info("login Success");
				//login ������ ȸ������ session������ �α��� �����ϰԲ� ��.
				HttpSession session = request.getSession();
				session.setAttribute("login",id);
				session.setAttribute("name",name);
				
				//posthandler���� �Ѿ������ redirect
				response.sendRedirect(request.getContextPath()+"/station/main"); 
			} else { //�α��� ����
				modelAndView.addObject("user","loginFail");
			}
		}
	}
}