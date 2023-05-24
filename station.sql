use jspsubway; #DB Name

SELECT  * FROM station;

#역 정보
CREATE TABLE station (
    station_name VARCHAR(100) PRIMARY KEY,
    station_num INT,
    FOREIGN KEY (station_num)
        REFERENCES subway (station_num)
        ON DELETE CASCADE,
    exit_count INT NOT NULL,
    watercloset_inout BOOLEAN DEFAULT TRUE, #true = inside
    open_doorside BOOLEAN DEFAULT TRUE, #true = left
    cross_platform INT NOT NULL, #자력 출입가능 2, 환승역통해 가능 1, 불가능 0
    first_subway_time DATETIME NOT NULL,
    last_subway_time DATETIME NOT NULL
);


DROP TABLE station;
