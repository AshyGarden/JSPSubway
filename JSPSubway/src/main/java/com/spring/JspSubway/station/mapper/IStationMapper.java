package com.spring.JspSubway.station.mapper;

import java.util.List;

import com.spring.JspSubway.command.PlaceBoardVO;
import com.spring.JspSubway.command.StationVO;

public interface IStationMapper {
	
	//역정보
	StationVO getStationInfo(int sco);
	
	//게시글정보
	List<PlaceBoardVO> getBoardInfo(int sco);
	
	//이전역
	void prevStation(int sco);
	
	//다음역
	void nextStation(int sco);
	
	//신도림
	void sindorimStation(int sco);
	
	//성수지선
	void seongsuStation(int sco);
	
	//역 조회 서비스 (역 코드 리스트 반환)
	List<String> getLookup(String sql);
	
}
