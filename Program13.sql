-- ===============================
--  CREATE TABLES
-- ===============================
CREATE TABLE ACTOR (
    Act_id INT PRIMARY KEY,
    Act_Name VARCHAR(100),
    Act_Gender VARCHAR(10)
);

CREATE TABLE DIRECTOR (
    Dir_id INT PRIMARY KEY,
    Dir_Name VARCHAR(100),
    Dir_Phone VARCHAR(15)
);

CREATE TABLE MOVIES (
    Mov_id INT PRIMARY KEY,
    Mov_Title VARCHAR(100),
    Mov_Year INT,
    Mov_Lang VARCHAR(30),
    Dir_id INT,
    FOREIGN KEY (Dir_id) REFERENCES DIRECTOR(Dir_id)
);

CREATE TABLE MOVIE_CAST (
    Act_id INT,
    Mov_id INT,
    Role VARCHAR(50),
    PRIMARY KEY (Act_id, Mov_id),
    FOREIGN KEY (Act_id) REFERENCES ACTOR(Act_id),
    FOREIGN KEY (Mov_id) REFERENCES MOVIES(Mov_id)
);

CREATE TABLE RATING (
    Mov_id INT,
    Rev_Stars INT,
    FOREIGN KEY (Mov_id) REFERENCES MOVIES(Mov_id)
);

-- ===============================
--  SAMPLE INSERTS
-- ===============================
INSERT INTO ACTOR VALUES
(1, 'Shahrukh Khan', 'M'),
(2, 'Deepika Padukone', 'F'),
(3, 'Amitabh Bachchan', 'M');

INSERT INTO DIRECTOR VALUES
(10, 'Karan Johar', '9876543210'),
(11, 'Sanjay Leela', '9876500000');

INSERT INTO MOVIES VALUES
(101, 'My Movie', 2020, 'Hindi', 10),
(102, 'Epic Love', 2021, 'Hindi', 11),
(103, 'Solo Film', 2022, 'English', NULL);

INSERT INTO MOVIE_CAST VALUES
(1, 101, 'Hero'),
(2, 101, 'Heroine'),
(2, 102, 'Heroine'),
(3, 102, 'Narrator');

INSERT INTO RATING VALUES
(101, 4),
(101, 5),
(102, 3),
(102, 4);

-- ===============================
--  QUERIES (ANSWERS)
-- ===============================

-- (ii) Movie title + highest stars (INNER JOIN)
SELECT m.Mov_Title,
       MAX(r.Rev_Stars) AS MaxStars
FROM MOVIES m
INNER JOIN RATING r ON m.Mov_id = r.Mov_id
GROUP BY m.Mov_Title
ORDER BY m.Mov_Title;

-- (iii) All actors and movies they acted in (LEFT JOIN)
SELECT a.Act_Name, m.Mov_Title
FROM ACTOR a
LEFT JOIN MOVIE_CAST mc ON a.Act_id = mc.Act_id
LEFT JOIN MOVIES m ON mc.Mov_id = m.Mov_id;

-- (iv) All directors and movies they directed (RIGHT JOIN)
SELECT d.Dir_Name, m.Mov_Title
FROM MOVIES m
RIGHT JOIN DIRECTOR d ON m.Dir_id = d.Dir_id;

-- (v) All directors and all movies (FULL OUTER JOIN / UNION method)
SELECT d.Dir_Name, m.Mov_Title
FROM DIRECTOR d
LEFT JOIN MOVIES m ON d.Dir_id = m.Dir_id
UNION
SELECT d.Dir_Name, m.Mov_Title
FROM DIRECTOR d
RIGHT JOIN MOVIES m ON d.Dir_id = m.Dir_id;
