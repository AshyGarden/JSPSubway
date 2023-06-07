package com.spring.JspSubway.station.service;

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
	
}
