package com.spring.JspSubway.test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RestController //����� @responsebody�� ����ȭ��(��� �񵿱�ȭ������� ����)
@RequestMapping("/rest")
@Slf4j
public class RestControllerTest {


	/*
	 @ResponseBody - method�� �����ϴ� �����͸� viewresolver���� ���������ʰ�
	 client���� �ش� �����͸� �ٷ� �����ϰ���.
	 
	 -controller bean��Ͻ� @restController���� 
	 ��� �ż��忡 @responsebody�� ���ΰ� ó�� ����
	 
	 @RestController������ �Ϲ����� jsp������ �̿��Ͽ� �����ϰ� �ʹٸ�,
	 return type�� modelAndView ��ü�� ó��
	 
	 �񵿱� ��ſ��� �ַ� ���
	 */
	@GetMapping("/hello")	
	public String hello() {
		return "hello world";
	}
	
	@GetMapping("/hobby")
	public List<String> hobby() {
		
		List<String> hobby = Arrays.asList("�౸","��ȭ����","����");
		return hobby;
	}
	
	@GetMapping("/study")
	public Map<String,Object> study() {
		
		Map<String,Object> study = new HashMap<>();
		study.put("�ڹ�", "java");
		study.put("jsp", "java Spring");
		study.put("spring", "Spring framework");
		
		return study;
	}
	
	@GetMapping("/mv")
	public ModelAndView mv() {
		ModelAndView model = new ModelAndView();
		model.setViewName("temp/test");
		return model;
	}
	
	@GetMapping("/view")
	public ModelAndView viewPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test/test1");
		return mv;
	}
	
	/*
	 @RequestBody
	 -Ŭ�󸮾�Ʈ �ʿ��� �����ϴ�JSON�����͸� �������� ����ϴ� �ڹپ� �°� ��ȯ�� ������ �ְ� �� �ִ� Annotation
	 */
	
//	@PostMapping("/getObject")
//	public Person getObject(@RequestBody Person p) {
//		log.info(p.toString());
//		p.setName("�����̸�");
//		p.setAge(25);
//		
//		return p;
//	}
	
}
