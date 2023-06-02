package com.spring.JspSubway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.JspSubway.command.StationVO;
import com.spring.JspSubway.subway.service.ISubwayService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/subway")
@Slf4j
public class SubwayController {
	
	@Autowired
	private ISubwayService subwayService;
	
	@GetMapping("/line2")
	public void getStation() {
		
	}
	
	
	@PostMapping("/{sno}")
	public String regist(int sno) {
		subwayService.getStation(sno);
		return "station/{sno}";
	}

}
