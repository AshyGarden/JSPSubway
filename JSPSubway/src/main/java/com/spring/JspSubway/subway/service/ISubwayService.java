package com.spring.JspSubway.subway.service;

import java.util.List;

import com.spring.JspSubway.command.SubwayVO;

public interface ISubwayService {
	
	//���ǿ� �´� �� 1�� ��������	- �� Ŭ���� ��� ����
	SubwayVO getStation(int sno);

	//���ǿ� �´� �� ������ �������� - ���� Ŭ���� ��� ����
	//�񵿱���
	List<SubwayVO> getStations(SubwayVO vo);

}
