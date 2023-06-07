package com.spring.JspSubway.station.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.JspSubway.command.StationVO;
import com.spring.JspSubway.station.mapper.IStationMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StationService implements IStationService {

	@Autowired
	private IStationMapper mapper;
	
	//역 정보를 반환하는 서비스
	@Override
	public StationVO getStationInfo(int sno) {		
		log.info(sno+"번 getStationInfo 진행중. 현재 서비스 도달");
		return mapper.getStationInfo(sno);
	}

	@Override
	public void prevStation(int sno) {
		mapper.prevStation(sno);
	}

	@Override
	public void nextStation(int sno) {
		mapper.nextStation(sno);
	}

	@Override
	public void sindorimStation(int sno) {
		mapper.sindorimStation(sno);
		
	}

	@Override
	public void seongsuStation(int sno) {
		mapper.seongsuStation(sno);		
	}

	
	@Override
	public List<String> getLookup(String sql) {
		log.info("서비스 도달");
		return mapper.getLookup(sql);
	}

	
	
	
	

}
