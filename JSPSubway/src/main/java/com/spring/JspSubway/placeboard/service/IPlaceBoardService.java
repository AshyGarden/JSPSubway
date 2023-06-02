package com.spring.JspSubway.placeboard.service;

import java.util.List;

import com.spring.JspSubway.command.PlaceBoardVO;

public interface IPlaceBoardService {
		
	//글 쓰기
	void write(PlaceBoardVO vo);
	
	//글 목록
	List<PlaceBoardVO> getList();
	
	//상세보기
	PlaceBoardVO getContent(int bno);
}
