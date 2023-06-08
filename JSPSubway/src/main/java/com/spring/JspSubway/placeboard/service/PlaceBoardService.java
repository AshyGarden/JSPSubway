package com.spring.JspSubway.placeboard.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.command.StationVO;
import com.spring.JspSubway.placeboard.mapper.IPlaceBoardMapper;
import com.spring.JspSubway.util.PageVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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

	@Override
	public List<StationVO> getSco() {
		System.out.println("서비스 ");
		return mapper.getSco();
		
	}
	
}