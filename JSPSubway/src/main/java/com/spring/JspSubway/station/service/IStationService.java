package com.spring.JspSubway.station.service;

import com.spring.JspSubway.command.StationVO;

public interface IStationService {
	
	//get StationVO info
	StationVO getStationInfo(int sno);

	//
	void otherStation(int sno);
	
}
