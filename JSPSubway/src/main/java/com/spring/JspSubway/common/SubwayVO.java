package com.spring.JspSubway.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
#2ȣ�� (����ȣ, ȯ�¶���1, ȯ�¶���2)
CREATE TABLE subwayline2 (
    station_num INT PRIMARY KEY,
    transfer_line1 INT,
    transfer_line2 INT
);
 */
@Getter @Setter @ToString
public class SubwayVO {	
	
	private int sno;
	private int tline1;
	private int tline2;	
	
}
