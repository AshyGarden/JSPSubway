package com.spring.JspSubway.station.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.command.StationVO;
import com.spring.JspSubway.station.mapper.IStationMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StationService implements IStationService {

	@Autowired
	private IStationMapper stationMapper;
	
	//역 정보를 반환하는 서비스
	@Override
	public StationVO getStationInfo(int sco) {		
		log.info(sco+"번 getStationInfo 진행중. 현재 서비스 도달");
		return stationMapper.getStationInfo(sco);
	}

	@Override
	public void prevStation(int sco) {
		stationMapper.prevStation(sco);
	}

	@Override
	public void nextStation(int sco) {
		stationMapper.nextStation(sco);
	}

	@Override
	public void sindorimStation(int sco) {
		stationMapper.sindorimStation(sco);
		
	}

	@Override
	public void seongsuStation(int sco) {
		stationMapper.seongsuStation(sco);		
	}

	
	@Override
	public List<String> getLookup(String sql) {
		log.info("서비스 도달");
		return stationMapper.getLookup(sql);
	}

	@Override
	public List<PlaceBoardVO> getBoardInfo(int sco) {
		return stationMapper.getBoardInfo(sco);
	}

	
	
	
	



}
