use jspsubway; #DB Name

SELECT  * FROM subwayline2;
/*
#2호선 (역번호, 환승라인1, 환승라인2)
CREATE TABLE subwayline2 (
    station_code BIGINT PRIMARY KEY,
    station_name ,
    transfer_line1 INT,
    transfer_line2 INT
);

UPDATE jspsubway.subwayline2 SET default charset=utf-8;*/

DROP TABLE subwayline2;

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

update subwayline2
set transferline1 = 3
where station_code = 2030;

SET SQL_SAFE_UPDATES = 1;

SHOW TABLES;

