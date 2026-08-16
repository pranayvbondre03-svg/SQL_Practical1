Microsoft Windows [Version 10.0.26100.5074]
(c) Microsoft Corporation. All rights reserved.

C:\Users\HP>mysql -u root -p
Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
// TITLE // department
mysql> USE college_demo;
Database changed
mysql> DROP TABLE IF EXISTS enrollement;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> DROP TABLE IF EXISTS course;
Query OK, 0 rows affected (0.04 sec)
// TITLE // course
mysql> CREATE TABLE course (
    -> course_id INT PRIMARY KEY,
    -> course_name VARCHAR(50) NOT NULL,
    -> dept_id INT,
    -> FOREIGN KEY (dept_id) REFERENCES department(dept_id)
    -> );
Query OK, 0 rows affected (0.05 sec)
// TITLE // enrollment
mysql> CREATE TABLE enrollment (
    -> roll_no INT,
    -> course_id INT,
    -> semester INT CHECK (semester BETWEEN 1 AND 8),
    -> grade CHAR(2),
    -> PRIMARY KEY (roll_no, course_id, semester),
    -> FOREIGN KEY (roll_no) REFERENCES student(roll_no),
    -> FOREIGN KEY (course_id) REFERENCES course(course_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> SHOW TABLES;
+------------------------+
| Tables_in_college_demo |
+------------------------+
| course                 |
| department             |
| enrollment             |
| student                |
+------------------------+
4 rows in set (0.09 sec)
// TITLE // department
mysql> INSERT INTO department VALUES (1,'Computer Science'), (2,'Electronics');
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0
//TITLE // student
mysql> INSERT INTO student VALUES (101,'Nilisha','nilisha@mail.com','123456789012',1);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO student VALUES (102, 'Rahul','rahul@mail.com','987654321098',2);
Query OK, 1 row affected (0.01 sec)
// TITLE // course
mysql> INSERT INTO course VALUES (501,'DBMS',1),(502,'Circuits',2);
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0
// TITLE // enrollment
mysql> INSERT INTO enrollment VALUES (101,501,3,'A');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO enrollment VALUES (101,502,3,'B');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT*FROM department;
+---------+------------------+
| dept_id | dept_name        |
+---------+------------------+
|       1 | Computer Science |
|       2 | Electronics      |
+---------+------------------+
2 rows in set (0.01 sec)

mysql> SELECT*FROM student;
+---------+---------+------------------+--------------+---------+
| roll_no | name    | email            | aadhar_no    | dept_id |
+---------+---------+------------------+--------------+---------+
|     101 | Nilisha | nilisha@mail.com | 123456789012 |       1 |
|     102 | Rahul   | rahul@mail.com   | 987654321098 |       2 |
+---------+---------+------------------+--------------+---------+
2 rows in set (0.01 sec)

mysql> SELECT*FROM course;
+-----------+-------------+---------+
| course_id | course_name | dept_id |
+-----------+-------------+---------+
|       501 | DBMS        |       1 |
|       502 | Circuits    |       2 |
+-----------+-------------+---------+
2 rows in set (0.00 sec)

mysql> SELECT*FROM enrollment;
+---------+-----------+----------+-------+
| roll_no | course_id | semester | grade |
+---------+-----------+----------+-------+
|     101 |       501 |        3 | A     |
|     101 |       502 |        3 | B     |
+---------+-----------+----------+-------+
2 rows in set (0.00 sec)

mysql>
