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
@RestController //선언시 @responsebody는 무력화됨(모두 비동기화방식으로 날림)
@RequestMapping("/rest")
@Slf4j
public class RestControllerTest {


	/*
	 @ResponseBody - method가 리턴하는 데이터를 viewresolver에게 전달하지않고
	 client에게 해당 데이터를 바로 응당하게함.
	 
	 -controller bean등록시 @restController사용시 
	 모든 매서드에 @responsebody를 붙인것 처럼 동작
	 
	 @RestController내에서 일반적인 jsp파일을 이용하여 응답하고 싶다면,
	 return type을 modelAndView 객체로 처리
	 
	 비동기 통신에서 주로 사용
	 */
	@GetMapping("/hello")	
	public String hello() {
		return "hello world";
	}
	
	@GetMapping("/hobby")
	public List<String> hobby() {
		
		List<String> hobby = Arrays.asList("축구","영화감상","수영");
		return hobby;
	}
	
	@GetMapping("/study")
	public Map<String,Object> study() {
		
		Map<String,Object> study = new HashMap<>();
		study.put("자바", "java");
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
	 -클라리언트 쪽에서 전송하는JSON데이터를 서버에서 사용하는 자바언어에 맞게 변환해 받을수 있게 해 주는 Annotation
	 */
	
//	@PostMapping("/getObject")
//	public Person getObject(@RequestBody Person p) {
//		log.info(p.toString());
//		p.setName("변경이름");
//		p.setAge(25);
//		
//		return p;
//	}
	
}
