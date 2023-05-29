package com.spring.JspSubway.station.service;

import com.spring.JspSubway.command.StationVO;

public interface IStationService {
	//역정보 가져오기
	StationVO getStationInfo(int sno);

	//다른역보기
	void otherStation(int sno);
	
}
