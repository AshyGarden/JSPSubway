package com.spring.JspSubway.placeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.placeboard.mapper.IPlaceBoardMapper;

@Service
public class PlaceBoardService implements IPlaceBoardService {

	@Autowired
	private IPlaceBoardMapper mapper;
	
	@Override
	public void regist(PlaceBoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<PlaceBoardVO> getList() {

		return null;
	}

	@Override
	public PlaceBoardVO getContent(int bno) {

		return null;
	}

}
