use jspsubway;

SELECT  * FROM subwayline2 ORDER BY station_code;

CREATE TABLE `subwayline2` (
  `station_code` bigint DEFAULT NULL,
  `station_name` text,
  `station_name_eng` text,
  `station_name_chn` text,
  `station_name_jpn` text,
  `transferline1` int DEFAULT NULL,
  `transferline2` int DEFAULT NULL,
  `transferline3` int DEFAULT NULL
) DEFAULT CHARSET=utf8;

ALTER TABLE `jspsubway`.`subwayline2` 
CHANGE COLUMN `station_code` `station_code` INT NULL DEFAULT NULL ;
ALTER TABLE `jspsubway`.`subwayline2` 
DROP COLUMN `외부코드`,
DROP COLUMN `호선`,
ADD COLUMN `transferline1` VARCHAR(50) NULL AFTER `station_name_jpn`,
ADD COLUMN `transferline2` VARCHAR(50) NULL AFTER `transferline1`,
CHANGE COLUMN `전철역코드` `station_code` BIGINT NULL DEFAULT NULL ,
CHANGE COLUMN `전철역명` `station_name` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `전철명명(영문)` `station_name_eng` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `전철명명(중문)` `station_name_chn` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `전철명명(일문)` `station_name_jpn` TEXT NULL DEFAULT NULL ;


ALTER TABLE `jspsubway`.`subwayline2` 
CHANGE COLUMN `station_code` `station_code` BIGINT NULL ,
CHANGE COLUMN `station_name` `station_name` TEXT NULL ,
CHANGE COLUMN `station_name_eng` `station_name_eng` TEXT NULL ,
CHANGE COLUMN `station_name_chn` `station_name_chn` TEXT NULL ,
CHANGE COLUMN `station_name_jpn` `station_name_jpn` TEXT NULL ,
CHANGE COLUMN `transferline1` `transferline1` VARCHAR(50) NULL ,
CHANGE COLUMN `transferline2` `transferline2` VARCHAR(50) NULL ,
CHANGE COLUMN `transferline3` `transferline3` VARCHAR(50) NULL ;

#용답 - 신답 - 용두 - 신설동
#도림천 - 양천구청 - 신정네거리 - 까치산
SET SQL_SAFE_UPDATES = 0;

#UPDATE 
UPDATE subwayline2 SET station_code = 260 WHERE station_name = "용두";

UPDATE subwayline2 SET station_code = 251 WHERE station_name = "까치산";
UPDATE subwayline2 SET station_code = 250 WHERE station_name = "신정네거리";
UPDATE subwayline2 SET station_code = 249 WHERE station_name = "양천구청";
UPDATE subwayline2 SET station_code = 248 WHERE station_name = "도림천";

UPDATE subwayline2 SET station_code = 246 WHERE station_name = "용두";
UPDATE subwayline2 SET station_code = 247 WHERE station_name = "신설동";

#transferline update
#경의중앙 - 10, 수인분당 - 11, 공항철도 - 12,  신분당선 - 13, 우이신설선 - 14, 신림선 - 15
UPDATE subwayline2 SET station_code = 2010, transferline1 = 1 WHERE station_name = "시청"; 
UPDATE subwayline2 SET station_code = 2020 WHERE station_name = "을지로입구";
UPDATE subwayline2 SET station_code = 2030, transferline1 = 3 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2040, transferline1 = 5 WHERE station_name = "을지로4가";
UPDATE subwayline2 SET station_code = 2050, transferline1 = 4, transferline2 = 5 WHERE station_code = 205; #동대문역사문화공원역
UPDATE subwayline2 SET station_code = 2060, transferline1 = 6 WHERE station_name = "신당";
UPDATE subwayline2 SET station_code = 2070 WHERE station_name = "상왕십리";
UPDATE subwayline2 SET station_code = 2080, transferline1 = 5, transferline2 = 10, transferline3 = 11 WHERE station_name = "왕십리";
UPDATE subwayline2 SET station_code = 2090 WHERE station_name = "한양대";
UPDATE subwayline2 SET station_code = 2100  WHERE station_name = "뚝섬";
UPDATE subwayline2 SET station_code = 2110, transferline1 = 2 WHERE station_name = "성수";
UPDATE subwayline2 SET station_code = 2120, transferline1 = 7 WHERE station_name = "건대입구";
UPDATE subwayline2 SET station_code = 2130 WHERE station_name = "구의";
UPDATE subwayline2 SET station_code = 2140 WHERE station_name = "강변";
UPDATE subwayline2 SET station_code = 2150 WHERE station_name = "잠실나루";
UPDATE subwayline2 SET station_code = 2160, transferline1 = 8 WHERE station_name = "잠실";
UPDATE subwayline2 SET station_code = 2170 WHERE station_name = "잠실새내";
UPDATE subwayline2 SET station_code = 2180, transferline1 = 9 WHERE station_name = "종합운동장";
UPDATE subwayline2 SET station_code = 2190 WHERE station_name = "삼성";

UPDATE subwayline2 SET station_code = 2200, transferline1 = 11 WHERE station_name = "선릉";
UPDATE subwayline2 SET station_code = 2210 WHERE station_name = "역삼";
UPDATE subwayline2 SET station_code = 2220, transferline1 = 13 WHERE station_name = "강남";
UPDATE subwayline2 SET station_code = 2230, transferline1 = 3 WHERE station_name = "교대";
UPDATE subwayline2 SET station_code = 2240 WHERE station_name = "서초";
UPDATE subwayline2 SET station_code = 2250 WHERE station_name = "방배";
UPDATE subwayline2 SET station_code = 2260, transferline1 = 4 WHERE station_name = "사당";
UPDATE subwayline2 SET station_code = 2270 WHERE station_name = "낙성대";
UPDATE subwayline2 SET station_code = 2280 WHERE station_name = "서울대입구";
UPDATE subwayline2 SET station_code = 2290 WHERE station_name = "봉천";

UPDATE subwayline2 SET station_code = 2300, transferline1 = 15 WHERE station_name = "신림";
UPDATE subwayline2 SET station_code = 2310 WHERE station_name = "신대방";
UPDATE subwayline2 SET station_code = 2320 WHERE station_name = "구로디지털단지";
UPDATE subwayline2 SET station_code = 2330, transferline1 = 7 WHERE station_name = "대림";
UPDATE subwayline2 SET station_code = 2340, transferline1 = 1, transferline1 = 2 WHERE station_name = "신도림";
UPDATE subwayline2 SET station_code = 2350 WHERE station_name = "문래";
UPDATE subwayline2 SET station_code = 2360, transferline1 = 5 WHERE station_name = "영등포구청";
UPDATE subwayline2 SET station_code = 2370, transferline1 = 9 WHERE station_name = "당산";
UPDATE subwayline2 SET station_code = 2380, transferline1 = 6 WHERE station_name = "합정";
UPDATE subwayline2 SET station_code = 2390, transferline1 = 10, transferline2 = 12 WHERE station_name = "홍대입구";
UPDATE subwayline2 SET station_code = 2400 WHERE station_name = "신촌";
UPDATE subwayline2 SET station_code = 2410 WHERE station_name = "이대";
UPDATE subwayline2 SET station_code = 2420 WHERE station_name = "아현";
UPDATE subwayline2 SET station_code = 2430, transferline1 = 5 WHERE station_name = "충정로";

UPDATE subwayline2 SET station_code = 2111 WHERE station_name = "용답";
UPDATE subwayline2 SET station_code = 2112 WHERE station_name = "신답";
UPDATE subwayline2 SET station_code = 2113 WHERE station_name = "용두";
UPDATE subwayline2 SET station_code = 2114, transferline1 = 1, transferline1 = 14 WHERE station_name = "신설동";

UPDATE subwayline2 SET station_code = 2341 WHERE station_name = "도림천";
UPDATE subwayline2 SET station_code = 2342 WHERE station_name = "양천구청";
UPDATE subwayline2 SET station_code = 2343 WHERE station_name = "신정네거리";
UPDATE subwayline2 SET station_code = 2344, transferline1 = 5 WHERE station_name = "까치산";



