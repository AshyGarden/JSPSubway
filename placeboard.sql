use jspsubway;

SELECT * FROM placeboard;

#장소 게시판
CREATE TABLE placeboard (
    bno VARCHAR(100) PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(100),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE,
    station_num INT,
    FOREIGN KEY (station_num)
        REFERENCES subway (station_num)
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

DROP TABLE placeboard;