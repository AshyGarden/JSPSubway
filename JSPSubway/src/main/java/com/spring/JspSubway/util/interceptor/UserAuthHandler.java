package com.spring.JspSubway.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class UserAuthHandler implements HandlerInterceptor{
	
	 //ȸ�� ��ȯ�� �ʿ��� ������ ��û�� ������ ��, ��Ʈ�ѷ����� ���� ��û�� ����ä��
    //Ȯ���� ���ͼ��ͷ� ����մϴ�.
    //�۾��� ȭ��, ���������� ȭ������ ���� ��û�� ����ä �˻��ϵ��� �սô�.
    //������ ���ٸ� �α��� �������� ���������ڽ��ϴ�.
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        //���ǿ��� �α��� �����͸� ���� �� Ȯ���� ���ڽ��ϴ�.
        HttpSession session = request.getSession();
        
        if(session.getAttribute("login") == null) {
            response.sendRedirect(request.getContextPath() + "/user/userLogin");
            //false�� ���ϵǸ� ��Ʈ�ѷ��� ��û�� ���޵��� �ʽ��ϴ�.
            return false;
        }
        
        //�α����� �ߴٸ� ���
        return true;
    }
}
