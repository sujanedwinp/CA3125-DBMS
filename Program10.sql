-- Create INSTRUCTOR table
CREATE TABLE INSTRUCTOR (
    InstructID INT PRIMARY KEY,
    InstructName VARCHAR(30),
    Department VARCHAR(20),
    Salary INT
);

-- Insert sample values
INSERT INTO INSTRUCTOR VALUES
(1, 'Anita', 'Physics', 55000),
(2, 'Ravi', 'Maths', 60000),
(3, 'Sunil', 'Physics', 40000),
(4, 'Meera', 'Chemistry', 65000),
(5, 'Suresh', 'Maths', 58000);

---------------------------------------------------
-- (i) Find instructors whose salary is more than
--     salary of any Physics instructor
SELECT InstructName, Department, Salary
FROM INSTRUCTOR
WHERE Salary > ANY (
    SELECT Salary FROM INSTRUCTOR WHERE Department = 'Physics'
);

-- (ii) Find instructor name and department of all instructors 
--      working in a department with any instructor whose name contains "S"
SELECT DISTINCT I1.InstructName, I1.Department
FROM INSTRUCTOR I1
WHERE I1.Department IN (
    SELECT I2.Department
    FROM INSTRUCTOR I2
    WHERE I2.InstructName LIKE '%S%'
);

-- (iii) Find instructors whose salary is more than all colleagues
--       in the same department
SELECT InstructName, Department, Salary
FROM INSTRUCTOR I
WHERE Salary = (
    SELECT MAX(Salary)
    FROM INSTRUCTOR
    WHERE Department = I.Department
);
