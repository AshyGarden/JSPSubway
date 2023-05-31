use jspsubway;

SELECT  * FROM subwayline2 ORDER BY station_code;

ALTER TABLE `jspsubway`.`subwayline2` 
CHANGE COLUMN `station_code` `station_code` INT NULL DEFAULT NULL ;
ALTER TABLE `jspsubway`.`subwayline2` 
DROP COLUMN `외부코드`,
DROP COLUMN `호선`,
ADD COLUMN `transferline1` VARCHAR(50) NULL DEFAULT '\"\"' AFTER `station_name_jpn`,
ADD COLUMN `transferline2` VARCHAR(50) NULL DEFAULT '\"\"' AFTER `transferline1`,
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
CHANGE COLUMN `transferline2` `transferline2` VARCHAR(50) NULL ;

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
#경의중앙 - 10, 수인분당 - 11, 신림선 - 12 ,공항철도 - 99
UPDATE subwayline2 SET station_code = 2010, transferline1 = 1 WHERE station_name = "시청"; 
UPDATE subwayline2 SET station_code = 2020 WHERE station_name = "을지로입구";
UPDATE subwayline2 SET station_code = 2030, transferline1 = 3 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2040, transferline1 = 5 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2050, transferline1 = 4, transferline2 = 5 WHERE station_code = 205; #동대문역사문화공원역


UPDATE subwayline2 SET station_code = 2060, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2070, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2080, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2090, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2100, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2110, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2120, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2130, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2140, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2150, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2160, transferline1 = 6 WHERE station_name = "을지로3가";
UPDATE subwayline2 SET station_code = 2170, transferline1 = 6 WHERE station_name = "을지로3가";




