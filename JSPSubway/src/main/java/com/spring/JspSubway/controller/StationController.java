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
	
	
	
	//상세 보기 페이지로 이동
	@GetMapping("/detail")
	public void	detail() {
		log.info("상세보기 페이지 GET 요청(jsp시험용)");
	}
	
	
}
