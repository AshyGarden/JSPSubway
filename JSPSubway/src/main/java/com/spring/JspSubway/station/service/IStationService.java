package com.spring.JspSubway.station.service;

import com.spring.JspSubway.command.StationVO;

public interface IStationService {
	//������ ��������
	StationVO getStationInfo(int sno);

	//�ٸ�������
	void otherStation(int sno);
	
}
