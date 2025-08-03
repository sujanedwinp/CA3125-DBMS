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

-- i) adjust rainfall readings by +0.01
update STATS
set RAINFALL_IN = RAINFALL_IN + 0.01;

-- ii) correct july temperature for ID 44
update STATS
set TEMPERATURE_F = 93.5
where ID = 44 and MONTH = 'July';

-- iii) commit changes
commit;

-- iv) rollback (if changes not committed)
rollback;