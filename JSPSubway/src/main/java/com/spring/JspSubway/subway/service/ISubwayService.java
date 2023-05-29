package com.spring.JspSubway.subway.service;

import java.util.List;

import com.spring.JspSubway.command.SubwayVO;

public interface ISubwayService {
	
	//조건에 맞는 역 1개 가져오기	- 역 클릭시 사용 로직
	SubwayVO getStation(int sno);

	//조건에 맞는 역 여러개 가져오기 - 조건 클릭시 사용 로직
	//비동기방식
	List<SubwayVO> getStations(SubwayVO vo);

}
