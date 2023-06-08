package com.spring.JspSubway.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.JspSubway.command.StationVO;
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
		StationVO vo = service.getStationInfo(sco);
//		StationVO voPrev;
//		StationVO voNext;
//		if(sco==2010) {
//			voPrev = service.getStationInfo(2430);
//			voNext = service.getStationInfo(sco+10);
//		} else if(sco==2430) {
//			voPrev = service.getStationInfo(sco-10);
//			voNext = service.getStationInfo(2010);
//		} else {
//			voPrev = service.getStationInfo(sco-10);
//			voNext = service.getStationInfo(sco+10);
//		}
//			
		log.info(vo.toString());
		model.addAttribute("station", vo);	
//		model.addAttribute("stnPrev", voPrev);	
//		model.addAttribute("stnNext", voNext);	
//		log.info(model.getAttribute("station").toString());
		log.info("/detail/{"+sco+"}");
		return "/station/detail";
	}
	
	@ResponseBody
	@PostMapping("/lookup")
	public List<String> getLookup(@RequestBody String sqltext) {
		log.info("가져온 sql문: "+sqltext);
		List<String> lookupCodes = service.getLookup(sqltext);
		return lookupCodes;
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
