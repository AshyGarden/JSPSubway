package com.spring.JspSubway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.JspSubway.station.service.IStationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/station")
@Slf4j
public class StationController {

	@Autowired
	private IStationService service;
	
	
	@GetMapping("/detail/{sco}")
	public String stationInfo(@PathVariable int sco, Model model) {	
		model.addAttribute("group", service.getStationInfo(sco));
		return "/station/detail";
	}
	
	

	//상세 보기 페이지로 이동
	@GetMapping("/detail")
	public void	detail() {
		log.info("상세보기 페이지 GET 요청(jsp시험용)");
	}
	
	//메인 페이지로 이동
	@GetMapping("/main")
	public void	main() {
		log.info("메인 페이지 GET 요청(jsp시험용)");
	}
	
	
	
	
	
	
}
