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
	
	
	
}
