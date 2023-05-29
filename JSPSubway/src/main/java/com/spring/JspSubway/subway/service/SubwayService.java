package com.spring.JspSubway.subway.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.JspSubway.command.SubwayVO;
import com.spring.JspSubway.subway.mapper.ISubwayMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SubwayService implements ISubwayService{
	
	@Autowired
	private ISubwayMapper mapper;

	@Override
	public SubwayVO getStation(int sno) {	
		return mapper.getStation(sno);
	}

	@Override
	public List<SubwayVO> getStations(SubwayVO vo) {	
		return mapper.getStations(vo);
	}
	
	
}
