package com.spring.JspSubway.station.mapper;

import java.util.List;

import com.spring.JspSubway.command.StationVO;

public interface IStationMapper {
	
	//������ ��������
	StationVO getStationInfo(int sno);

	//�ٸ�������
	void otherStation(int sno);
	
}
