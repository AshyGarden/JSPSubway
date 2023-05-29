package com.spring.JspSubway.station.mapper;

import java.util.List;

import com.spring.JspSubway.command.StationVO;

public interface IStationMapper {
	
	//역정보 가져오기
	StationVO getStationInfo(int sno);

	//다른역보기
	void otherStation(int sno);
	
}
