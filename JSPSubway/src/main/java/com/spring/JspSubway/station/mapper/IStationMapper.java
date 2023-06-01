package com.spring.JspSubway.station.mapper;

import com.spring.JspSubway.command.StationVO;

public interface IStationMapper {
	
	//
	StationVO getStationInfo(int sno);

	//�ٸ�������
	void otherStation(int sno);
	
}
