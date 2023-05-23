use jspsubway;

#2호선 (역번호, 환승라인1, 환승라인2)
create table line2(
	station_num int primary key,
    transfer_line1 int,
    transfer_line2 int,
);

#
create table station(	
    station_name varchar(100) primary key,
    station_num int unique not null, 
    exit_count int not null,
    watercloset_inout boolean default true, #true = inside
	open_doorside boolean default true, #true = left
    first_subway_time datetime not null, 
    last_subway_time datetime not null
);



