package com.spring.JspSubway.station.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.JspSubway.command.StationVO;
import com.spring.JspSubway.station.mapper.IStationMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StationService implements IStationService {

	@Autowired
	private IStationMapper stationMapper;
	
	//인포 반환하는 서비스
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





}
