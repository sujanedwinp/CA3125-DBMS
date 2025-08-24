-- Create STATION table
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(25),
    STATE VARCHAR(20),
    LAT DECIMAL(8,5),
    LONG DECIMAL(8,5)
);

-- Insert sample values
INSERT INTO STATION VALUES 
(1, 'Bangalore', 'Karnataka', 12.9716, 77.5946),
(2, 'Delhi', 'Delhi', 28.7041, 91.0000),
(3, 'Mumbai', 'Maharashtra', 19.0760, 72.8777),
(4, 'Kolkata', 'West Bengal', 22.5726, 88.3639);

-- Create STATS table
CREATE TABLE STATS (
    ID INT,
    MONTH VARCHAR(10),
    TEMPERATURE FLOAT,   -- In Fahrenheit
    RAINFALL FLOAT,      -- In inches
    FOREIGN KEY (ID) REFERENCES STATION(ID),
    PRIMARY KEY (ID, MONTH)
);

-- Insert sample values
INSERT INTO STATS VALUES
(1, 'July', 86, 10.2),
(2, 'July', 95, 5.5),
(3, 'January', 60, 3.0),
(4, 'July', 90, 8.0);

---------------------------------------------------
-- (i) Delete data from STATION table where longitude > 90
DELETE FROM STATION WHERE LONG > 90;

-- (ii) Delete July data from STATS table where longitude > 90
DELETE FROM STATS 
WHERE MONTH = 'July' 
AND ID IN (SELECT ID FROM STATION WHERE LONG > 90);

-- (iii) Increase CITY column size
ALTER TABLE STATION 
MODIFY CITY VARCHAR(25);

-- (iv) Modify column name LONG → LONGITUDE
ALTER TABLE STATION 
RENAME COLUMN LONG TO LONGITUDE;

-- Verify result
SELECT * FROM STATION;
