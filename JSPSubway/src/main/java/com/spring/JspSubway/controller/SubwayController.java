package com.spring.JspSubway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.JspSubway.subway.service.ISubwayService;

@Controller
@RequestMapping("/subway")
public class SubwayController {
	
	@Autowired
	private ISubwayService service;
	
	
	
	

}
