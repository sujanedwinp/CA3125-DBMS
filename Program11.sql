CREATE TABLE INSTRUCTOR (
    InstructID INT PRIMARY KEY,
    InstructName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Department VARCHAR(50),
    InstructID INT,
    FOREIGN KEY (InstructID) REFERENCES INSTRUCTOR(InstructID)
);

INSERT INTO INSTRUCTOR VALUES
(1,'Alice','Finance',60000),
(2,'Bob','Finance',45000),
(3,'Charlie','Computer Science',70000),
(4,'David','Maths',50000),
(5,'Eve','Computer Science',80000);

INSERT INTO STUDENT VALUES
(101,'Sam','Maths',1),
(102,'Sophia','Computer Science',3),
(103,'Arun','Finance',2),
(104,'Sanjay','Maths',4);

SELECT InstructName 
FROM INSTRUCTOR
WHERE Salary > ANY (
  SELECT Salary FROM INSTRUCTOR WHERE Department='Finance'
);

SELECT InstructName
FROM INSTRUCTOR
WHERE Salary < ALL (
  SELECT Salary FROM INSTRUCTOR WHERE Department='Computer Science'
)
AND Department <> 'Computer Science';

SELECT DISTINCT StudentName, Department
FROM STUDENT
WHERE Department IN (
  SELECT Department FROM STUDENT WHERE StudentName LIKE '%S%'
);

