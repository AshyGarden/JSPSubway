package com.spring.JspSubway.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE `subwayline2` (
  `station_code` int DEFAULT NULL,
  `station_name` text,
  `station_name_eng` text,
  `station_name_chn` text,
  `station_name_jpn` text,
  `transferline1` bigint DEFAULT NULL,
  `transferline2` bigint DEFAULT NULL,
  `transferline3` bigint DEFAULT NULL
) default charset=utf8mb4;

 */
@Getter @Setter @ToString
public class SubwayVO {	
	
	private int sco;
	private String sname;
	private String snameEng;
	private String snameChn;
	private String snameJpn;
	private int tline1;
	private int tline2;	
	private int tline3;
	
}
