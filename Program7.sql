-- create table
create table STATS (
    ID int,
    MONTH varchar(10),
    TEMPERATURE_F float check (TEMPERATURE_F between -100 and 150),
    RAINFALL_IN float check (RAINFALL_IN >= 0),
    primary key (ID, MONTH)
);

-- insert sample values
insert into STATS (ID, MONTH, TEMPERATURE_F, RAINFALL_IN)
values (1, 'January', 25.0, 1.2);

insert into STATS (ID, MONTH, TEMPERATURE_F, RAINFALL_IN)
values (2, 'January', 30.2, 0.5);

insert into STATS (ID, MONTH, TEMPERATURE_F, RAINFALL_IN)
values (3, 'February', 45.5, 0.0);

insert into STATS (ID, MONTH, TEMPERATURE_F, RAINFALL_IN)
values (44, 'July', 95.0, 2.1);

-- create view in metric
create view STATS_METRIC as
select 
    ID,
    MONTH,
    (TEMPERATURE_F - 32) * 5.0 / 9.0 as TEMPERATURE_C,
    RAINFALL_IN * 25.4 as RAINFALL_MM
from STATS;

-- query: january below-freezing (<= 0°C) sorted by rainfall
select *
from STATS_METRIC
where MONTH = 'January' and TEMPERATURE_C <= 0
order by RAINFALL_MM;
