package com.spring.JspSubway.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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
	public String write(Model model) {
		model.addAttribute("scoList", placeBoardService.getSco());
		System.out.println("글쓰기 들어오기");
		return "board/write";
	}
	
	//글 쓰기
	@PostMapping("/write")
	public String write(PlaceBoardVO vo) {
		log.info("글정보"+vo.toString());
		placeBoardService.write(vo);
		return "redirect:/board/placeboard"; //placeboard로 재요청
	}
	
	//글 상세보기(모달)
	@ResponseBody
	@GetMapping("/content/{bno}")
	public PlaceBoardVO getContent(@PathVariable int bno) {
		return placeBoardService.getContent(bno);
		
	}	
}