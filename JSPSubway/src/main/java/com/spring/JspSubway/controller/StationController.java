package com.spring.JspSubway.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/station")
@Slf4j
public class StationController {

	@GetMapping("/{sno}")
	public void stationInfo() {
		log.info("station info");
	}
	
	
	
	@GetMapping("/userJoin")
	public void join() {
		log.info("회원가입 페이지 GET 요청(jsp시험용)");
	}
	@GetMapping("/login")
	public void	login() {
		log.info("회원가입 페이지 GET 요청(jsp시험용)");
	}
	@GetMapping("/detail")
	public void	detail() {
		log.info("상세보기 페이지 GET 요청(jsp시험용)");
	}
	
	
}
