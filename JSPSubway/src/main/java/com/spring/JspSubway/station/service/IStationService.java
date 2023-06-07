package com.spring.JspSubway.station.service;

import java.util.List;

import com.spring.JspSubway.command.StationVO;

public interface IStationService {

	//역정보
	StationVO getStationInfo(int sno);

	//이전역
	void prevStation(int sno);
	
	//다음역
	void nextStation(int sno);
	
	//신도림
	void sindorimStation(int sno);
	
	//성수지선
	void seongsuStation(int sno);
	
	//역 조회 서비스 (역 코드 리스트 반환)
	List<String> getLookup(String sql);
	
}
