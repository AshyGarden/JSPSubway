package com.spring.JspSubway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.JspSubway.command.StationVO;
import com.spring.JspSubway.subway.service.ISubwayService;

@Controller
@RequestMapping("/subway")
public class SubwayController {
	
	@Autowired
	private ISubwayService subwayService;
	
//	@GetMapping("/line2")
//	public void getStation() {
//		
//	}
//	
//	//역 상세정보 페이지 열어주는 메서드
//	@PostMapping("/station/{sno}")
//	public String regist(int sno) {
//		subwayService.getStation(sno);
//		return "station/{sno}";
//	}

}
