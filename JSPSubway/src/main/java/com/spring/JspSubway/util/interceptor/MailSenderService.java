package com.spring.JspSubway.util.interceptor;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class MailSenderService {
	
	@Autowired
	private JavaMailSender mailSender;
	private int authNum;
	
	public int makeRandomNumber() {
		Random rn = new Random();
		int checkNum = rn.nextInt(888888) + 111111;
		log.info("인증번호 : " + checkNum);
		return checkNum;
	}
	
	// 회원가입 시 사용할 이메일 양식
	public String joinEmail(String email) {
		authNum = makeRandomNumber();
		
		String setFrom = ""; // email-config에 설정한 발신용 이메일 주소
		String toMail = email;
		String title = "회원가입 인증 이메일입니다.";
		String content = "홈페이지를 방문해 주셔서 감사합니다." + 
				"<br><br>" + 
				 "인증 번호는 <strong>" + authNum + "</strong> 입니다." +
				 "<br>" +
				 "해당 인증 번호를 인증번호 확인란에 기입해 주세요.";
		
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNum);
	}
	
	// 이메일 전송 메서드
	private void mailSend(String setFrom, String toMail, String title, String content) {
	
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}