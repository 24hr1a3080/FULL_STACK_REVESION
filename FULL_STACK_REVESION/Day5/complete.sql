CREATE DATABASE college;
USE college;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);
INSERT INTO employee VALUES
(1, 'John', 'CSE', 30000),
(2, 'Alice', 'ECE', 35000),
(3, 'Bob', 'CSE', 40000),
(4, 'David', 'ME', 32000);
SELECT * FROM employee;
UPDATE employee
SET salary = 45000
WHERE emp_id = 3;
SELECT * FROM employee;
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);
DESC student;
SHOW TABLES;
INSERT INTO student VALUES
(101, 'Alice', 'CSE', 85),
(102, 'Bob', 'ECE', 78),
(103, 'Charlie', 'CSE', 92),
(104, 'David', 'ME', 70);
SELECT * FROM student;
UPDATE employee
SET department = 'IT'
WHERE emp_id = 2;
DELETE FROM employee
WHERE emp_id = 4;
SELECT * FROM employee;


CREATE DATABASE company;
USE company;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT
);

INSERT INTO employee VALUES
(1, 'John', 'CSE', 30000),
(2, 'Alice', 'ECE', 40000),
(3, 'Bob', 'CSE', 50000),
(4, 'David', 'ME', 35000),
(5, 'Ravi', 'ECE', 45000);
SELECT emp_name, salary
FROM employee
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
);
SELECT emp_name, salary
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
);
SELECT emp_name
FROM employee
WHERE department = (
    SELECT department
    FROM employee
    WHERE emp_name = 'John'
);
SELECT emp_name, salary
FROM employee
WHERE salary > (
    SELECT salary
    FROM employee
    WHERE emp_name = 'John'
);

SELECT emp_name, department
FROM employee
WHERE department IN (
    SELECT department
    FROM employee
    WHERE salary > 40000
);



CREATE DATABASE college1;

USE college1;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO student VALUES
(101, 'Alice', 'CSE', 85),
(102, 'Bob', 'ECE', 78),
(103, 'Charlie', 'CSE', 92);

SELECT * FROM student;
Step 2: Save the script
Save the file as:
college.sql
Step 3: Execute
Click the Execute button ⚡ in MySQL Workbench.
Complete script


CREATE DATABASE college;

USE college;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO student VALUES
(101, 'Alice', 'CSE', 85),
(102, 'Bob', 'ECE', 78),
(103, 'Charlie', 'CSE', 92);

SELECT * FROM student;
create database user_management;
SHOW DATABASES;
use user_management;

CREATE DATABASE jdbc_learning;
USE jdbc_learning;
show databases;
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50)
);
show tables;
DESC students;

SELECT VERSION();

SHOW DATABASES;
create database college1;
show databases;
use college1;
create table student (
id int primary key,
name varchar(99),
age int,
department varchar(50),
city varchar(99) );
show tables;
desc student;
INSERT INTO student
VALUES (101, 'Rahul', 21, 'CSE', 'Hyderabad');
INSERT INTO student VALUES
(102, 'Priya', 22, 'ECE', 'Bangalore'),
(103, 'Arun', 20, 'CSE', 'Chennai'),
(104, 'Sneha', 21, 'IT', 'Hyderabad'),
(105, 'Kiran', 23, 'ECE', 'Vijayawada'),
(106, 'Anjali', 20, 'IT', 'Bangalore');
select * from student;
select name , age from student;
select distinct department from student;
select * from student where id=101;
select * from student where age>21;
select name , age from student;
select distinct department from student;
select * from student where id=101;
select * from student where age>20 and department='cse';
select * from student where  Not department='cse';
select * from student where age between 20 and 22;
select * from student where department in ('cse','ece','it');
select * from student where name LIKE 'A%';
select * from student where name LIKE '%A';
select * from student where name LIKE '%A%';
select * from student where name LIKE '___A%';
select * from student order by age desc;
select * from student order by age asc;
select * from student limit 3;
update student set city='mumbai' where id = 101;
select * from student;
update student set city='delhi',age=22 where id = 102;
select * from student;
delete from student where id=106;
select * from student;
alter table student add email varchar(99);
desc student;
alter table student modify name varchar(88);
alter table student rename column city to address;
desc student;
alter table student drop column email;
desc student;

select count(*) from student; 
select avg(age) from student;
select min(age) from student;
select max(age) from student;
select sum(age) from student;




select department,count(*) from  student
group by department;
select department,min(age) from  student group by department;
select department,max(age) from student group by department;

select department,count(*) as stdent_details from  student
group by department having count(*)=2;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    hod VARCHAR(100)
);
INSERT INTO departments VALUES
(1, 'CSE', 'Ramesh'),
(2, 'ECE', 'Suresh'),
(3, 'IT', 'Mahesh'),
(4, 'AI&DS', 'Lakshmi');

show tables;

select student.name, departments.hod
from student 
left join departments
on student.department=departments.department_name;

select student.name, departments.hod
from student 
right join departments
on student.department=departments.department_name;

select * from student where age>(select avg(age) from student); 



select * from student;
select name , department from student;
select * from student where id=105;
select * from student where age > 21;
select * from student where department='cse';
select * from studnet where address='Bangalore';
select * from stduent where age between 20 and 22;
select * from student where department in ('cse','ece','it');
select * from student where name LIKE 'A%';
select * from student order by age asc;


select * from student order by age desc limit 3;
select count(*) from student ;
select avg(age) from student ;
select * from student order by age asc limit 1;
select * from student order by age desc limit 1;
select department,count(*) from  student group by department;
select department,avg(age) from  student group by department;
select department,count(*) as stdent_details from  student
group by department having count(*)>2;
update student set address='kuppam' where id=107;
delete from student  where id=110;


select * from student where age>(select avg(age) from student);
select * from student where age=(select max(age) from student);
select * from student where address not in ('Bangalore','Hydrabad');
select department,count(*) as dep from  student group by department order by dep desc;
select department from  student group by department order by count(*) desc limit 1;

create database Learned;
use learned;
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);
show tables;
desc student;

select * from student;

create database college_management;
show databases;
use college_management;
create database student_records;
show databases;
drop database student_records;
show databases;

create table students(
student_id int primary key,
student_name varchar(99),
age int,
gender varchar(10),
department varchar(10),
city varchar(10),
marks varchar(99),
admission_date varchar(99)
);

desc students;
show tables;

create table teachers(
teacher_id int primary key,
teacher_name varchar(99),
subject varchar(99),
salary int,
department varchar(99)
);
insert into students values(101,'kishore',19,'male','cse','kuppam',90,'19/6/2026');
insert into students values
(102,'anu',19,'female','ece','ananthapur',78,'19/20/2026'),(3, 'Sneha', 19, 'Female', 'CSE', 'Karimnagar', '92', '2026-11-21'),
(4, 'Arjun', 22, 'Male', 'MECH', 'Nizamabad', '75', '2026-11-22'),
(5, 'Priya', 20, 'Female', 'EEE', 'Hyderabad', '88', '2026-11-23'),
(6, 'Ravi', 21, 'Male', 'CIVIL', 'Khammam', '80', '2026-11-24');

insert into students
 (student_id,student_name,department,city) 
 values
 (7,"anjali","cse","hyderabad"); 
 INSERT INTO students
VALUES
(8, 'Vikram', 20, 'Male', 'ECE', 'Hyderabad', '81', '2026-11-25'),
(9, 'Meena', 21, 'Female', 'MECH', 'Warangal', '79', '2026-11-25'),
(10, 'Suresh', 22, 'Male', 'EEE', 'Karimnagar', '84', '2026-11-25');

INSERT INTO students
VALUES
(11, 'Asha', 20, 'Female', 'CSE', 'Hyderabad', '90', '2026-11-26'),
(12, 'Kiran', 21, 'Male', 'CSE', 'Warangal', '82', '2026-11-26'),
(13, 'Deepa', 19, 'Female', 'CSE', 'Nizamabad', '87', '2026-11-26');

select * from students;


select * from students;
select marks from students;
select student_name,marks from students;
select student_name,marks,department from students;
select distinct department from students;
select distinct city from students;
select distinct department,city from students;
select student_name as Name from students;
select marks as student_Marks from students;

select * from students;

select * from students where department="cse";
select * from students where marks>80;
select * from students where age=20;
select * from students where age<=20;
select * from students where marks<=75;
select * from students where not department="cse";
select * from students where marks between 70 and 90;
select * from students where department="cse" and marks>80;
select * from students where city="Bangalore" and city="Mysore";
select * from students where not city="Hyderabad";
select * from students where gender="female" and marks > 85;

select * from students where student_name like "a%";
select * from students where student_name like "%a";
select * from students where student_name like "%an%";
select * from students where student_name like "_____";
select * from students where department in ("cse","ece","ise");
select * from students where city in ( "Bangalore", "Chennai","Hyderabad");
select * from students where marks between 70 and  90;
select * from students where age between 19 and 21;
select * from students where student_name not like "p%";
select * from students where marks not between 60 and 80; 

select * from students order by student_name asc;
select * from students order by marks desc;
select * from students order by age asc;
select * from students order by student_name asc;
select * from students order by marks desc limit 3;
select * from students order by marks asc limit 1;
select * from students limit 5;
select * from students order by marks desc limit 5;
select * from students where department="cse" limit 3;
select * from students order by department,marks desc;


update students set marks=90 where student_name="rahul";
update students set city="Bangalore" where student_name="sneha";
update students set marks=marks+5 where department="cse";
UPDATE students SET marks = marks + 5 WHERE department = 'CSE';
update students set department="cse" where student_id=105;
update students set age=21 where age =20;
update students set city="Bangalore"  where city="Mysore";
update students set marks=marks+10 where marks<70;
update students set department="cse" where student_id=102;

update students set marks=90 where name="rahul";
update students set city="Bangalore" where name="sneha";
update students set marks=marks+5 where department="cse";
update students set department="cse" where student_id = 105;
update students set age=21 where age=20;
update students set city="Bangalore" where city="Mysore";
update students set marks=marks+10 where marks<70;
update students set department="ece" where student_id=105;

delete from students where student_id=110;
delete from students where department="CIVIL";
delete from students where marks<40;
delete from students where city="pune";
delete from students where age > 22;
select * from students;
delete from students; 

alter table students add email varchar(99);
alter table students add phone_number varchar(99);
alter table student modify student_name varchar(80);
alter table students modify marks bigint;
alter table students rename column city to student_city;
alter table students drop column phone_number;
alter table students rename to collage_students;
alter table collage_students rename to students;

CREATE TABLE departments (
    department_id INT PRIMARY KEY
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(99) NOT NULL,
    email VARCHAR(99) UNIQUE,
    age INT CHECK (age >= 18),
    salary INT DEFAULT 15000,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO departments VALUES (1);
INSERT INTO employees VALUES (101,'Rahul','rahul@gmail.com',21,25000,1);
INSERT INTO employees VALUES (103,NULL,'anu@gmail.com',22,20000,1);
INSERT INTO employees VALUES (102,'Rahul','kishu@gmail.com',21,25000,1);
INSERT INTO employees VALUES (103,'Rahul','kishu@gmail.com',21,2000,2);
INSERT INTO employees VALUES (104,'Anu','anu@gmail.com',16,5,1);
INSERT INTO employees
(employee_id, employee_name, email, age, department_id)
VALUES
(105,'Priya','priya@gmail.com',20,1);
INSERT INTO departments VALUES (90);
select * from departments;

select * from  employees;


show tables;

select count(*) students  from students;
select avg(marks) from students;
select max(marks) from students;
select min(marks) from students;
select sum(marks) from students;
select count(*) as cse_count from students where department="cse";
select avg(age) from students;
select count(*) from students where student_city="bangalore";
select avg(marks) from students where gender="female";
select max(marks)-min(Marks) from students;


select department,count(*) as total_students from students group by department;
select department,avg(marks) as Average_of_depts from students group by department;
select department,max(marks) as Highest_Marks from students group by department;
select department,min(marks) as Minimum_marks from students group by department;
select department,sum(marks) as Total_Marks from students group by department;
select gender,count(*) as Gender_Count from students group by gender;
select student_city,count(*) from students group by student_city;
select department,avg(age) from students group by department;
select student_city,count(*) from students group by student_city;
select gender , avg(marks) from students group by gender;

SELECT department, COUNT(*) AS CountMoreThanTwo FROM students GROUP BY department HAVING COUNT(*) > 2;
select department,avg(marks) as AvgOfAllDepartments from students
 group by department having avg(marks)>80;
select student_city,count(*) as MORETHANONESTUDENT from students
group by student_city having  count(*)>1;
select department,max(marks) as MaxOfDep from students
group by department having max(marks)>90;
select department,sum(marks) from students
group by department having sum(marks)>200;
select gender,avg(marks) from students
group by gender having avg(marks)>80;
select department,avg(marks),count(*) from students 
group by department having avg(marks)>75 and count(*)>=3;
create table  departments1(
department_id int ,
department_name varchar(90),
hod_name varchar(90)
);
create table studentCourses(
course_id int ,
student_id int,
course_name varchar(90),
free bigint
);
INSERT INTO Departments1 VALUES
(1, 'CSE', 'Mr. Kumar'),
(2, 'ECE', 'Mrs. Lakshmi'),
(3, 'ISE', 'Mr. Raj'),
(4, 'MECH', 'Mr. Anand'),
(5, 'CIVIL', 'Mrs. Priya');

INSERT INTO StudentCourses VALUES
(201, 101, 'Java', 5000),
(202, 102, 'Python', 4500),
(203, 103, 'Java', 5000),
(204, 104, 'Web Development', 6000),
(205, 106, 'Python', 4500),
(206, 101, 'SQL', 3000);

desc students;
select * from students;

ALTER TABLE Students
ADD department_id INT;
UPDATE Students SET department_id = 1 WHERE student_id = 101;
UPDATE Students SET department_id = 2 WHERE student_id = 102;
UPDATE Students SET department_id = 1 WHERE student_id = 103;
UPDATE Students SET department_id = 3 WHERE student_id = 104;
UPDATE Students SET department_id = 4 WHERE student_id = 105;
UPDATE Students SET department_id = 2 WHERE student_id = 106;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    hod_name VARCHAR(50)
);

create database timepass;
use timepass;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    department_id INT
);
INSERT INTO Students VALUES
(101, 'Rahul', 20, 'Bangalore', 1),
(102, 'Priya', 21, 'Mysore', 2),
(103, 'Amit', 20, 'Delhi', 1),
(104, 'Sneha', 22, 'Hyderabad', 3),
(105, 'Kiran', 21, 'Chennai', 4),
(106, 'Anjali', 20, 'Pune', 2);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30),
    hod_name VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'CSE', 'Mr. Kumar'),
(2, 'ECE', 'Mrs. Lakshmi'),
(3, 'ISE', 'Mr. Raj'),
(4, 'MECH', 'Mr. Anand'),
(5, 'CIVIL', 'Mrs. Priya');

CREATE TABLE Student_Courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    fee DECIMAL(10,2)
);
INSERT INTO Student_Courses VALUES
(201, 101, 'Java', 5000),
(202, 102, 'Python', 4500),
(203, 103, 'Java', 5000),
(204, 104, 'Web Development', 6000),
(205, 106, 'Python', 4500),
(206, 101, 'SQL', 3000);


SELECT s.student_name, d.department_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id;

SELECT s.student_id,
       s.student_name,
       d.hod_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id;
SELECT s.*
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'CSE';

SELECT s.*
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'CSE';
SELECT s.student_id,
       s.student_name,
       s.age,
       s.city,
       d.department_name,
       d.hod_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id;

SELECT s.student_id,
       s.student_name,
       s.age,
       s.city,
       d.department_name,
       d.hod_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id;
SELECT s.student_id,
       s.student_name,
       d.department_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
WHERE d.department_name IN ('ECE', 'ISE');


INSERT INTO Students VALUES
(107, 'Ravi', 22, 'Mumbai', 6);
SELECT s.student_id,
       s.student_name,
       d.department_name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.department_id;
SELECT s.student_id,
       s.student_name,
       d.department_name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.department_id;
SELECT s.student_id,
       s.student_name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.department_id
WHERE d.department_id IS NULL;
SELECT s.student_id,
       s.student_name,
       d.department_name,
       d.hod_name
FROM Students s
LEFT JOIN Departments d
ON s.department_id = d.department_id;



SELECT d.department_id,
       d.department_name,
       s.student_name
FROM Students s
RIGHT JOIN Departments d
ON s.department_id = d.department_id;
SELECT d.department_name,
       s.student_name
FROM Students s
RIGHT JOIN Departments d
ON s.department_id = d.department_id;
SELECT d.department_id,
       d.department_name
FROM Students s
RIGHT JOIN Departments d
ON s.department_id = d.department_id
WHERE s.student_id IS NULL;
SELECT d.department_name,
       COUNT(s.student_id) AS student_count
FROM Students s
RIGHT JOIN Departments d
ON s.department_id = d.department_id
GROUP BY d.department_name;


SELECT s.student_name,
       sc.course_name
FROM Students s
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id;
SELECT s.student_name,
       sc.course_name
FROM Students s
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
WHERE s.student_id = 101;
SELECT s.student_id,
       s.student_name
FROM Students s
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
WHERE sc.course_name = 'Java';
SELECT s.student_name,
       sc.course_name,
       sc.fee
FROM Students s
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id;
SELECT s.student_id,
       s.student_name,
       COUNT(sc.course_id) AS total_courses
FROM Students s
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(sc.course_id) > 1;




SELECT s.student_name,
       d.department_name,
       sc.course_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id;
SELECT s.student_name,
       d.hod_name,
       sc.fee
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id;
SELECT s.student_name,
       d.department_name,
       sc.course_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
WHERE d.department_name = 'CSE'
  AND sc.course_name = 'Java';
  SELECT d.department_name,
       COUNT(sc.course_id) AS enrollment_count
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
GROUP BY d.department_name;
SELECT s.student_name,
       sc.course_name,
       sc.fee
FROM Students s
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
WHERE sc.fee > 4000;
SELECT d.department_name,
       SUM(sc.fee) AS total_fee
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
GROUP BY d.department_name;

SELECT s.*, d.department_name, d.hod_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id;

SELECT s.student_name, sc.course_name
FROM Students s
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id;

SELECT s.student_id, s.student_name
FROM Students s
LEFT JOIN Student_Courses sc
ON s.student_id = sc.student_id
WHERE sc.course_id IS NULL;

SELECT d.department_id, d.department_name
FROM Departments d
LEFT JOIN Students s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;

SELECT d.department_name,
       COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s
ON d.department_id = s.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       SUM(sc.fee) AS total_fee
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id
GROUP BY d.department_name;

SELECT d.department_name,
       COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s
ON d.department_id = s.department_id
GROUP BY d.department_name
ORDER BY total_students DESC
LIMIT 1;

SELECT d.department_name,
       AVG(s.marks) AS average_marks
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
GROUP BY d.department_name
ORDER BY average_marks DESC
LIMIT 1;

SELECT s.student_name,
       s.marks,
       d.department_name
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
ORDER BY s.marks DESC
LIMIT 5;

SELECT s.student_name,
       d.department_name,
       d.hod_name,
       sc.course_name,
       sc.fee
FROM Students s
INNER JOIN Departments d
ON s.department_id = d.department_id
INNER JOIN Student_Courses sc
ON s.student_id = sc.student_id;


CREATE DATABASE company_management;

USE company_management;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30)
);

INSERT INTO employees VALUES
(101, 'Rahul', 25, 'Male', 'IT', 50000, 'Bangalore'),
(102, 'Priya', 28, 'Female', 'HR', 45000, 'Hyderabad'),
(103, 'Amit', 30, 'Male', 'Finance', 60000, 'Chennai'),
(104, 'Sneha', 27, 'Female', 'IT', 55000, 'Pune'),
(105, 'Kiran', 29, 'Male', 'Marketing', 48000, 'Mumbai'),
(106, 'Anjali', 26, 'Female', 'HR', 47000, 'Delhi'),
(107, 'Ravi', 31, 'Male', 'IT', 65000, 'Bangalore'),
(108, 'Divya', 24, 'Female', 'Finance', 52000, 'Hyderabad'),
(109, 'Arjun', 32, 'Male', 'Marketing', 58000, 'Chennai'),
(110, 'Meena', 27, 'Female', 'IT', 54000, 'Pune');

SELECT * FROM employees;

SELECT employee_name, salary
FROM employees;

SELECT DISTINCT department
FROM employees;

SELECT *
FROM employees
WHERE department = 'IT';

SELECT *
FROM employees
WHERE salary > 30000;

SELECT *
FROM employees
WHERE salary < 50000;

SELECT *
FROM employees
WHERE salary = 40000;

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 35000;

SELECT *
FROM employees
WHERE department = 'HR'
OR department = 'Finance';

SELECT *
FROM employees
WHERE NOT department = 'IT';

SELECT *
FROM employees
WHERE age BETWEEN 22 AND 30;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000, 15),
(102, 'Smartphone', 'Electronics', 30000, 8),
(103, 'Headphones', 'Electronics', 2000, 25),
(104, 'Refrigerator', 'Home Appliances', 40000, 5),
(105, 'Microwave', 'Home Appliances', 12000, 12),
(106, 'Office Chair', 'Furniture', 7000, 20),
(107, 'Study Table', 'Furniture', 9000, 7),
(108, 'Smart Watch', 'Electronics', 15000, 18),
(109, 'Printer', 'Electronics', 8000, 6),
(110, 'Air Conditioner', 'Home Appliances', 45000, 4);

SELECT *
FROM products
ORDER BY price ASC;

SELECT *
FROM products
ORDER BY price DESC;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT *
FROM products
WHERE stock_quantity < 10;

SELECT *
FROM products
ORDER BY price ASC
LIMIT 3;

SELECT *
FROM products
WHERE category = 'Electronics'
ORDER BY price ASC;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales VALUES
(101, 'Laptop', 'Electronics', 2, 55000, '2026-01-10'),
(102, 'Smartphone', 'Electronics', 3, 30000, '2026-01-12'),
(103, 'Headphones', 'Electronics', 5, 2000, '2026-01-15'),
(104, 'Refrigerator', 'Home Appliances', 1, 40000, '2026-01-18'),
(105, 'Microwave', 'Home Appliances', 2, 12000, '2026-01-20'),
(106, 'Office Chair', 'Furniture', 4, 7000, '2026-01-22'),
(107, 'Study Table', 'Furniture', 2, 9000, '2026-01-24'),
(108, 'Smart Watch', 'Electronics', 3, 15000, '2026-01-26'),
(109, 'Printer', 'Electronics', 2, 8000, '2026-01-28'),
(110, 'Air Conditioner', 'Home Appliances', 1, 45000, '2026-02-01'),
(111, 'Laptop', 'Electronics', 1, 55000, '2026-02-03'),
(112, 'Smartphone', 'Electronics', 2, 30000, '2026-02-05'),
(113, 'Office Chair', 'Furniture', 3, 7000, '2026-02-08'),
(114, 'Microwave', 'Home Appliances', 1, 12000, '2026-02-10'),
(115, 'Smart Watch', 'Electronics', 4, 15000, '2026-02-12');

SELECT COUNT(*) AS total_sales
FROM sales;

SELECT SUM(quantity) AS total_quantity_sold
FROM sales;

SELECT AVG(price) AS average_product_price
FROM sales;

SELECT MAX(price) AS highest_price,
       MIN(price) AS lowest_price
FROM sales;

SELECT category,
       SUM(quantity * price) AS total_sales_amount
FROM sales
GROUP BY category;

SELECT category,
       COUNT(*) AS number_of_sales
FROM sales
GROUP BY category;

SELECT category,
       SUM(quantity * price) AS total_sales_amount
FROM sales
GROUP BY category
HAVING SUM(quantity * price) > 50000;
