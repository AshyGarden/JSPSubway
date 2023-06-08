package com.spring.JspSubway.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
#역 정보
CREATE TABLE `station` (
  `station_name` text,
  `station_code` int DEFAULT NULL,
  `exit_count` int DEFAULT NULL,
  `watercloset_inout` tinyint DEFAULT NULL, #true = inside
  `open_doorside` tinyint DEFAULT NULL, #true = left
  `cross_platform` int DEFAULT NULL, #자력 출입가능 2, 환승역통해 가능 1, 불가능 0
  `first_subway_time` text,
  `last_subway_time` text
) DEFAULT CHARSET=utf8mb4;

TINYINT = boolean
*/

@Getter @Setter @ToString
public class StationVO {
	
	private String sname;     //Station name
	private int sco;          //Station code 
	private int ec;           //Exit count 
	private boolean wcio;     //watercloset inout
	private boolean ods;      //opendoorside 
	private int cp;           //crossplatform
	private String fs; //first subway
	private String ls; //last subway
	
	private SubwayVO subway;
  
}
