package com.spring.JspSubway.subway.mapper;

import java.util.List;

import com.spring.JspSubway.common.SubwayVO;

public interface ISubwayMapper {
	
	//���ǿ� �´� �� 1�� ��������	- �� Ŭ���� ��� ����
	SubwayVO getStation(int sno);

	//���ǿ� �´� �� ������ �������� - ���� Ŭ���� ��� ����
	//�񵿱���
	List<SubwayVO> getStations(SubwayVO vo);
	

}
