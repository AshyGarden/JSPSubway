package com.spring.JspSubway.station.service;

import com.spring.JspSubway.command.StationVO;

public interface IStationService {

	//역정보
	StationVO getStationInfo(int sco);

	//이전역
	void prevStation(int sco);
	
	//다음역
	void nextStation(int sco);
	
	//신도림
	void sindorimStation(int sco);
	
	//성수지선
	void seongsuStation(int sco);
	
}
