create table STATS(
    ID int,
    MONTH varchar(10),
    TEMPF double check(TEMPF between -100 and 150),
    RAINI double check(RAINI between 0 and 100),
    primary key(ID, MONTH)
);

insert into STATS values
(1, 'January', 55.0, 0.5),
(1, 'July', 90.0, 6.0),
(2, 'January', 75.0, 0.2),
(2, 'July', 88.0, 22.0)

create view STATS_CON as
    select ID, MONTH, round((TEMPF -32) *5 /9, 2) as TEMPC, round(RAINI *2.54, 2) as RAINCM from STATS

alter table STATS add column RAIN double;

update STATS
    join STATS_CON on STATS.ID=STATS_CON.ID and STATS.MONTH=STATS_CON.MONTH
    set STATS.RAINCM=STATS_CON.RAINCM;

alter table STATS drop column RAINI;

