package com.spring.JspSubway.common;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 #역 정보
CREATE TABLE station (
    station_name VARCHAR(100) PRIMARY KEY,
    station_num INT,
    FOREIGN KEY (station_num)
        REFERENCES subwayline2 (station_num)
        ON DELETE CASCADE,
    exit_count INT NOT NULL,
    watercloset_inout BOOLEAN DEFAULT TRUE, #true = inside
    open_doorside BOOLEAN DEFAULT TRUE, #true = left
    cross_platform INT NOT NULL, #자력 출입가능 2, 환승역통해 가능 1, 불가능 0
    first_subway_time DATETIME NOT NULL,
    last_subway_time DATETIME NOT NULL
);


 */

@Getter @Setter @ToString
public class StationVO {
	
	private String sname;     //Station name-역이름
	private int sno;          //Station number -역번호-fk
	private int ec;           //Exit count - 출구갯수
	private boolean wcio;     //watercloset inout - 화장실 위치(역사 안쪽-true/개찰구밖(역사밖)-false)
	private boolean ods;      //opendoorside - 문이 열리는 위치 (왼쪽true/오른족 false)
	private int cf;           //crossplatform - (자력으로 반대 승강장가능 2, 환승역 또는 다른 방식으로 가능 1, 개찰구 제외 불가능 0)
	private LocalDateTime fs; //first subway - 첫차시간
	private LocalDateTime ls; //last subway - 막차시간

}
