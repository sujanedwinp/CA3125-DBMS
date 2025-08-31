CREATE TABLE BOOK (
    Book_id INT PRIMARY KEY,
    Title VARCHAR(100),
    Publisher_Name VARCHAR(50),
    Pub_Year INT
);

CREATE TABLE BOOK_AUTHORS (
    Book_id INT,
    Author_Name VARCHAR(50),
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id)
);

CREATE TABLE PUBLISHER (
    Publisher_Name VARCHAR(50) PRIMARY KEY,
    Address VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE BOOK_COPIES (
    Book_id INT,
    Branch_id INT,
    No_of_Copies INT,
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id)
);

CREATE TABLE LIBRARY_BRANCH (
    Branch_id INT PRIMARY KEY,
    Branch_Name VARCHAR(50),
    Address VARCHAR(100)
);

CREATE TABLE BOOK_LENDING (
    Book_id INT,
    Branch_id INT,
    Card_No INT,
    Date_Out DATE,
    Due_Date DATE,
    FOREIGN KEY (Book_id) REFERENCES BOOK(Book_id)
);

INSERT INTO PUBLISHER VALUES 
('Pearson','Delhi','9876543210'),
('OReilly','Bangalore','9123456780');

INSERT INTO BOOK VALUES 
(1,'DBMS','Pearson',2020),
(2,'Operating Systems','OReilly',2019);

INSERT INTO BOOK_AUTHORS VALUES 
(1,'Navathe'),
(2,'Silberschatz');

INSERT INTO LIBRARY_BRANCH VALUES 
(1,'Central','MG Road'),
(2,'East','Indiranagar');

INSERT INTO BOOK_COPIES VALUES 
(1,1,5),
(2,1,3),
(1,2,2);

INSERT INTO BOOK_LENDING VALUES 
(1,1,111,'2023-07-01','2023-07-20');


-- DRAW ER DIAGRAM 


SELECT B.Book_id, B.Title, B.Publisher_Name, BA.Author_Name, 
       BC.Branch_id, BC.No_of_Copies
FROM BOOK B
JOIN BOOK_AUTHORS BA ON B.Book_id = BA.Book_id
JOIN BOOK_COPIES BC ON B.Book_id = BC.Book_id;

SELECT Publisher_Name, Pub_Year, COUNT(Book_id) AS Total_Books
FROM BOOK
GROUP BY Publisher_Name, Pub_Year
ORDER BY Pub_Year;

