package com.spring.JspSubway.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 #
CREATE TABLE station (
    station_name VARCHAR(100) PRIMARY KEY,
    station_num INT,
    FOREIGN KEY (station_num)
        REFERENCES subwayline2 (station_num)
        ON DELETE CASCADE,
    exit_count INT NOT NULL,
    watercloset_inout BOOLEAN DEFAULT TRUE, #true = inside
    open_doorside BOOLEAN DEFAULT TRUE, #true = left
    cross_platform INT NOT NULL, #�ڷ� ���԰��� 2, ȯ�¿����� ���� 1, �Ұ��� 0
    first_subway_time DATETIME NOT NULL,
    last_subway_time DATETIME NOT NULL
);


 */

@Getter @Setter @ToString
public class StationVO {
	
	private String sname;     //Station name-
	private int sno;          //Station number -
	private int ec;           //Exit count -
	private boolean wcio;     //watercloset inout - 
	private boolean ods;      //opendoorside - 
	private int cf;           //crossplatform - 
	private LocalDateTime fs; //first subway -
	private LocalDateTime ls; //last subway - 

}
