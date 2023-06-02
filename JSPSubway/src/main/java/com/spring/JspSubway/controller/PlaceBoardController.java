package com.spring.JspSubway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.placeboard.service.IPlaceBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class PlaceBoardController {

	@Autowired
	private IPlaceBoardService placeBoardService;
	
	//목록화면 열어주는 메서드
	@GetMapping("/placeboard")
	public void placeboard() {
		
	}
	
	//글쓰기 페이지 열어주는 메서드
	@GetMapping("/write")
	public String write() {
		return "board/write";
	}
	
	//글 쓰기
	@PostMapping("/write")
	public String write(PlaceBoardVO vo) {
		log.info("글정보"+vo.toString());
		placeBoardService.write(vo);
		return "redirect:/board/placeboard"; //placeboard로 재요청
	}

	
}
