create table STATION( ID int primary key, CITY varchar(20), STATE varchar(20), LAT double, LONGT double);

create table STATS( ID int, MONTH varchar(10), TEMPF double, RFALL double, primary key(ID, MONTH), foreign key (ID) references STATION(ID));

insert into STATION values
(1, 'Delhi', 'Delhi', 28.6, 77.2),
(2, 'Mumbai', 'Maharashtra', 19.0, 72.8),
(3, 'Chennai', 'Tamil Nadu', 13.1, 80.3);

insert into STATS values
(1, 'January', 55.0, 0.5),
(1, 'July', 90.0, 6.0),
(2, 'January', 75.0, 0.2),
(2, 'July', 88.0, 22.0),
(3, 'January', 78.0, 1.5),
(3, 'July', 92.0, 10.0);

select * from STATS;

select STATION.CITY, STATION.STATE, STATS.MONTH, STATS.TEMPF, STATS.RFALL from STATS join STATION on STATS.ID = STATION.ID;

select * from STATS order by STATS.MONTH, STATS.RFALL desc;
