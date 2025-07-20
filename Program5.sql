CREATE TABLE STATION (
     ID INT PRIMARY KEY,
     CITY VARCHAR(30),
     STATE VARCHAR(30),
     LAT DOUBLE,
     LONG DOUBLE
);

CREATE TABLE STATS (
                       ID INT,
                       MONTH VARCHAR(10),
                       TEMP_F DOUBLE CHECK (TEMP_F BETWEEN -100 AND 150),
                       RAINFALL_IN DOUBLE CHECK (RAINFALL_IN BETWEEN 0 AND 100),
                       PRIMARY KEY (ID, MONTH),
                       FOREIGN KEY (ID) REFERENCES STATION(ID)
);

INSERT INTO STATION VALUES
                        (1, 'Delhi', 'Delhi', 28.6, 77.2),
                        (2, 'Mumbai', 'Maharashtra', 19.0, 72.8),
                        (3, 'Bengaluru', 'Karnataka', 12.9, 77.6);


INSERT INTO STATS VALUES
                      (1, 'January', 55.0, 1.2),
                      (1, 'July', 92.0, 6.0),
                      (2, 'January', 75.0, 0.8),
                      (2, 'July', 88.0, 22.0),
                      (3, 'January', 65.0, 1.0),
                      (3, 'July', 82.0, 5.0);

select s.CITY, s.LAT, st.TEMP_F from STATS st
    join STATION s on st.ID=s.ID where st.MONTH='JULY' order by st.TEMP_F asc;

select ID, MAX(TEMP_F) as MAX_TEMP, MIN(TEMP_F) as MIN_TEMP, AVG(RAINFALL_IN) from STATS group by ID;

select * from STATION where ID in ( select ID from STATS group by ID having avg(TEMP_F)>50 );
