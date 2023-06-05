package com.spring.JspSubway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.placeboard.service.IPlaceBoardService;
import com.spring.JspSubway.util.PageCreator;
import com.spring.JspSubway.util.PageVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class PlaceBoardController {

	@Autowired
	private IPlaceBoardService placeBoardService;
	
	//목록화면
	@GetMapping("/placeboard")
	public void list(PageVO vo, Model model) {
		PageCreator pc = new PageCreator(vo, placeBoardService.getTotal(vo));
		log.info(pc.toString());
		model.addAttribute("boardList",placeBoardService.getList(vo));
		model.addAttribute("pc",pc);
	}
	
	//글쓰기 페이지 열어주는 메서드
	@GetMapping("/write")
	public String regist() {
		return "board/write";
	}
	
	//글 등록
	@PostMapping("/write")
	public String regist(PlaceBoardVO vo) {
		placeBoardService.regist(vo);
		return "redirect:/board/placeboard"; //placeboard로 재요청
	}
	
}
