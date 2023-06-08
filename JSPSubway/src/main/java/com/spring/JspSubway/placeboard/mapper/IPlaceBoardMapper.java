package com.spring.JspSubway.placeboard.mapper;

import java.util.List;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.command.StationVO;
import com.spring.JspSubway.util.PageVO;

public interface IPlaceBoardMapper {

	//글 쓰기
	void write(PlaceBoardVO vo);
	
	//총 게시물 수 구하기
	int getTotal(PageVO vo);
	
	//글 목록
	List<PlaceBoardVO> getList(PageVO vo);
	
	//상세보기
	PlaceBoardVO getContent(int bno);
	
	//모든 역번호 보기
	List<StationVO> getSco();
		
}
