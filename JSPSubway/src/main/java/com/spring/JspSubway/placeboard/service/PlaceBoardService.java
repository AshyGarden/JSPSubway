package com.spring.JspSubway.placeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.placeboard.mapper.IPlaceBoardMapper;
import com.spring.JspSubway.util.PageVO;

@Service
public class PlaceBoardService implements IPlaceBoardService {

	@Autowired
	private IPlaceBoardMapper mapper;
	
	@Override
	public void write(PlaceBoardVO vo) {
		mapper.write(vo);
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	@Override
	public List<PlaceBoardVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public PlaceBoardVO getContent(int bno) {

		return mapper.getContent(bno);
	}

}