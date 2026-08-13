CREATE TABLE Student_Marksheet(
 Roll_No INT PRIMARY KEY,
 Student_Name VARCHAR (50),
 Department VARCHAR (50),
 Marks INT
);
INSERT INTO Student_Marksheet
(Roll_No, Student_Name, Department, Marks)
VALUES
(101,'Ranvir','ECE',87),
(102,'Rahul','CSE',82),
(103,'Aman','IT',91);
SELECT*FROM Student_Marksheet;
