package com.spring.JspSubway.command;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE placeboard (
    bno INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(100),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE,
    station_num INT,
    FOREIGN KEY (station_num)
        REFERENCES subwayline2 (station_num)
        ON DELETE CASCADE,
    title VARCHAR(500) NOT NULL,
    content VARCHAR(5000),
    
	addr_basic VARCHAR(300),
    addr_detail VARCHAR(300),
    addr_zip_num VARCHAR(50),
    place_url VARCHAR(300),
    write_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_date DATETIME DEFAULT NULL
);
 */

@Getter
@Setter
@ToString
public class PlaceBoardVO {
	
	private int bno;
	private String userId;
	private int sno;
	private String title;
	private String content;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	private String placeUrl;
	
	private LocalDateTime writeDate;
	private LocalDateTime updateDate;

}
