use jspsubway; #DB Name

SELECT  * FROM subway;

#2호선 (역번호, 환승라인1, 환승라인2)
CREATE TABLE subway (
    station_num INT PRIMARY KEY,
    transfer_line1 INT,
    transfer_line2 INT
);

DROP TABLE subway;