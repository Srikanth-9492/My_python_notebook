-- what is sql-->structured query language
-- it is a programming language we use d to communication with the databases
-- what is a datbase
-- the place where we can store our data is kown as database
-- what is data
-- the collection of contionous or discrete values is known as data
-- what is RDBMS
-- IN RDBMS the data is stored in the form of rows of columns
-- rowss is also kown as --> records,index.tuples..etc
-- columns is also known as attributes varables...etc
-- we are storing the data in to database. These database consists of different types of DB'S language
-- 1.DDL:- data defination language--> CREATE,ALTER,DROP, AND TRUNCATE
-- 2.DML:- DATA manipulation language--> Insert,update, delete
-- 3.DQL:- data qery language--> SELECT
-- 4.DCL:- data control language--. GRANT, REVOKE
-- 5.TCL:- Transcation control language--> rollback, commit,savepoint
-- create a database name SQL_AKA 
CREATE DATABASE SQL_sai;
-- use the database SQL_sai;
USE SQL_sai;
-- What is schemas?
-- blue-print of database is known as schemas
-- create a table customers where it is having attributes cust_id int,first_name,last_name,country,phone number
CREATE TABLE CUSTOMERS(
CUST_ID INT,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
COUNTRY VARCHAR(50),
PHONE INT);
-- drop the database SQL_sai;
DROP DATABASE SQL_sai;
-- recreate the database and use it
-- recreate the table
CREATE DATABASE SQL_sai;
USE SQL_sai;
CREATE TABLE CUSTOMERS(
CUST_ID INT,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
COUNTRY VARCHAR(50),
PHONE INT);
-- insert the data into customers
-- DML -- INSERT
INSERT INTO CUSTOMERS(CUST_ID,FIRST_NAME,LAST_NAME,COUNTRY,PHONE) VALUES
(1,'AKASH','M','INDIA',949374455);
-- check the data in customers
-- DQL -- SELECT
SELECT * FROM CUSTOMERS;
-- i want to delete all the data from table or clear all the data
Truncate CUSTOMERS;
-- what is the difference between truncate and drop?
-- ################### 11-06-2025 ######################
USE SQL_sai;
-- check the data from customers
SELECT * FROM CUSTOMERS;
INSERT INTO CUSTOMERS(CUST_ID,FIRST_NAME,LAST_NAME,COUNTRY,PHONE) VALUES
(1,'AKASH','M','IND',949374455),
(2,'Akhil','M','IND',709659484),
(3,'LUFFY','MD','JAP',000000000),
(4,'ZORO','R','USA',701249484);
-- CHECK the data from customers
select * FROM customers;
-- Create a student table with following attribute SID,SNAME,SMARKS
create table STUDENT(
SID INT,
SNAME varchar(50),
SMARKS INT);
insert INTO STUDENT VALUES
(101,'RAJ',75),
(102,'RAM',70),
(103,'ARVIND',55),
(104,'SAI',70),
(105,'JOHN',65),
(106,'Christy',85),
(107,'Naveen',60),
(108,'kiran',45),
(109,'kareem',48),
(110,'neloufer',62);
-- check the data from student table
SELECT * FROM STUDENT;
-- PRINT the 1st row from the student table
select * from student where SID = 101;
-- GET the records of student whose marks greater then 75
select * from student where SMARKS > 75;
-- GET the data about 'john'
select * from student where SNAME = 'john';
-- Relational opertors/comparision operators --> =,=!,>,<,>=,<=
-- get the records of the students whose marks not equal to 75
select * from student where SMARKS != 75;
-- get the records of the student whose marks between 60 and 75
SELECT * FROM STUDENT WHERE SMARKS>=60 AND SMARKS<=75;
-- Use between opertor to get records in between
SELECT * FROM STUDENT WHERE SMARKS BETWEEN 60 AND 75;
-- Get the records of the student whose name starts with letter 'n'
-- Like opertor use % symbol to match the records
SELECT * FROM STUDENT WHERE SNAME LIKE 'N%';
-- What will you do we don't know the first 2 letter and we next letter starts with 'VI'
SELECT * FROM STUDENT WHERE SNAME LIKE '__VI%';
-- Get the records of the student who is having letter'e'
SELECT * FROM STUDENT WHERE SNAME LIKE '%E%';
-- GET the records of student id 105,102 and 107
SELECT * FROM STUDENT WHERE SID = 102 OR SID = 105 OR SID = 107;
-- Check it by using the 'IN' operator
SELECT * FROM STUDENT WHERE SID IN(102,105,107);
-- Get all the records of student expect 102,103,107,108
SELECT * FROM STUDENT WHERE SID NOT IN(102,103,107,108);
SELECT * FROM STUDENT WHERE SID != 102 AND SID != 103 AND SID != 107 AND SID !=108;
-- drop table customer
drop table customers;
CREATE TABLE customer (
customer_id integer primary key,
first_name varchar(10) NOT NULL,
last_name varchar(10) NOT NULL,
dob DATE,
phone varchar(12)
);
Insert into customer (customer_id, first_name,last_name,dob,phone) values(
1,'John','Brown','1965-01-01','800-555-1211');
Insert into customer (customer_id, first_name,last_name,dob,phone) values(
2,'Cynthia','Green','1968-02-05','800-555-1212');
Insert into customer (customer_id, first_name,last_name,dob,phone) values(
3,'Steve','White','1971-03-16','800-555-1213');
Insert into customer (customer_id, first_name,last_name,dob,phone) values(
4,'Gail','Black',NULL,'800-555-1214');
Insert into customer (customer_id, first_name,last_name,dob,phone) values(
5,'Doreen','Blue','1970-05-20',NULL);
-- check the data of the customer
select * from customer;
-- get the records of customer last name start with B1
-- get records of customer firstname and lastname contains 'ee'
-- get records of customer phone no ends with 12
-- get records of customer who don't have dob
-- merge the firstname and lastname print as customer full name
select * from customer where first_name = 'w%' or last_name = 'w%';
select * from customer where phone = '__________12';
select * from customer where dob = NULL;

-- ##########  12-06-2025#################
 
 use sql_sai;
 select  * from customer;
 SELECT *, CONCAT(FIRST_NAME,LAST_NAME) AS FULL_NAME FROM CUSTOMER;
SELECT FIRST_NAME , LAST_NAME, CONCAT(FIRST_NAME,LAST_NAME) AS FULL_NAME FROM CUSTOMER;
-- Add the column 'city' into student table 
-- ALTER -->DDL
ALTER TABLE STUDENT ADD CITY VARCHAR(20);
-- check the data from student
SELECT * FROM STUDENT;
-- How can we update the null values in the table
-- Before updating the null values in the table we need to disable the security safety in mysql
SET SQL_SAFE_UPDATES = 0;
UPDATE STUDENT SET CITY = 'HYD';
-- TCL -->Transaction control language--> rollback, commit
-- add a column school in student table
ALTER TABLE STUDENT ADD SCHOOL VARCHAR(60);
START transaction;
UPDATE STUDENT SET SCHOOL = "GOVT HIGH SCHOOL";
ROLLBACK;
-- check the data
SELECT * FROM STUDENT;
START transaction;
-- Delete the record of raj from student table
DELETE FROM STUDENT WHERE SNAME = 'RAJ';
rollback;
commit;
-- Delete the schoo, column from sudent table
ALTER TABLE STUDENT DROP SCHOOL;
-- Add the multiple columns in to student table -- school, contact
ALTER TABLE STUDENT ADD (SCHOOL VARCHAR(60),CONTACT INT);
-- HOW can we drop the multiple columns-->SCHOOL,CITY,CONTACT
ALTER TABLE STUDENT DROP SCHOOL, DROP CITY, DROP CONTACT;
-- Rename the table name student to student_info
RENAME TABLE STUDENT TO STUDENT_INFO;
SET SQL_SAFE_UPDATES = 1;
-- HOW can we add  column to the table--> ALTER TABLE NAME_OF_TABLE ADD COL_NAME DTYPE;
-- Disable security safety in mysql--> SET SQL_SAFE_UPDATES = 0;
-- How can we update the null values --> UPDATE NAME_OF_TABLE SET COL_NAME = 'VALUE';
-- How can we delete the record from table --> DELETE FROM NAME_OF_TABLE WHERE COL = 'VAL';
-- NOTE:- when we TCL commands use immeadiatly after DML Commands--> UPDATE ,delete under start transaction
-- How can we drop the columns in table-->ALTER TABLE NAME_OF_TABLE DROP COL_NAME;
-- String Functions in MYSQL
SELECT * FROM CUSTOMER;
-- change the first nae into lowercase
SELECT FIRST_NAME , LCASE(FIRST_NAME) FROM CUSTOMER;
SELECT FIRST_NAME , UCASE(FIRST_NAME) FROM CUSTOMER;
-- Concat the first name and last name as afull name
-- old mysql version
SELECT *, FIRST_NAME || LAST_NAME AS FULL_NAME FROM CUSTOMER;
-- SUBSTRING:- Rnage of character from main string is known substring
-- SLICING :- the process of getting range of characters is known as slicing
-- print the 1st letter from first name
SELECT FIRST_NAME,SUBSTR(FIRST_NAME,1,1) FROM CUSTOMER;

 -- ################13-06-2025########################
-- Aggregate functions:- min(),max(),sum(),count(),avg()
USE SQL_sai;
create table products(
product_id integer primary key,
product_type_id integer references product_types(product_type_id),
name varchar(30) not null,
description varchar(50),
price decimal(5,2)
);

INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (1, 1, 'Modern Science', 'A description of modern science', 19.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (2, 1, 'Chemistry', 'Introduction to Chemistry', 30.00);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (3, 2, 'Supernova', 'A star explodes', 25.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (4, 2, 'Tank War', 'Action movie about a future war', 13.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (5, 2, 'Z Files', 'Series on mysterious activities', 49.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (6, 2, '2412: The Return', 'Aliens return', 14.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (7, 3, 'Space Force 9', 'Adventures of heroes', 13.49);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (8, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (9, 4, 'Classical Music', 'The best classical music', 10.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (10, 4, 'Pop 3', 'The best popular music', 15.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (11, 4, 'Creative Yell', 'Debut album', 14.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (12, NULL, 'My Front Line', 'Their greatest hits', 13.49);
-- Check the data in products
SELECT * FROM PRODUCTS;
-- Get the minimum price from products table
SELECT MIN(PRICE) FROM PRODUCTS;
-- GET the records of product_type_id minimum prices 
SELECT PRODUCT_TYPE_ID, MIN(PRICE) FROM PRODUCTS
GROUP BY PRODUCT_TYPE_ID;
-- Get the records of min price of product_type_id without null values.
SELECT PRODUCT_TYPE_ID, MIN(PRICE) FROM PRODUCTS
WHERE PRODUCT_TYPE_ID IS NOT NULL
GROUP BY PRODUCT_TYPE_ID;
-- get the min price of product ids where the minimum price is more then 12 and it should not have null values
SELECT PRODUCT_TYPE_ID,MIN(PRICE) FROM PRODUCTS
WHERE PRODUCT_TYPE_ID IS NOT NULL
GROUP BY PRODUCT_TYPE_ID
HAVING MIN(PRICE) > 12;
-- Get the above query in ascending order
SELECT PRODUCT_TYPE_ID,MIN(PRICE) FROM PRODUCTS
WHERE PRODUCT_TYPE_ID IS NOT NULL
GROUP BY PRODUCT_TYPE_ID
HAVING MIN(PRICE) > 12
ORDER BY MIN(PRICE) ASC LIMIT 1;
-- execution of aggregate function--> SELECT, aggre(), FROM, WHERE,GROUPBY,HAVING,ORDER BY, LIMIT

-- Get the averge price of a product along with product_type_id having avg price more then 20 and print the product_type_id with highest avg price
-- or get the record highest average price of a product_type_id from prodcuts table
SELECT PRODUCT_TYPE_ID, AVG(PRICE) FROM PRODUCTS
WHERE PRODUCT_TYPE_ID IS NOT NULL
GROUP BY PRODUCT_TYPE_ID
HAVING AVG(PRICE)>20
ORDER BY AVG(PRICE) DESC LIMIT 1;
-- get the record of max price of a product_type_id from products table
select * from products;
-- 1. List the average marks of dse students
-- 2. List the average marks of dse students for each location
-- 3. list the average marks of students in bangalore for different courses
-- 4. List the average marks of dse students for each location,batch
-- 5. list the highest mark in each course, location wise
-- 6. list the highest mark in each course, location,batch wise
-- 7. List the highest mark in each location
 -- 8. List students who have got more than 75 marks
-- 9 List the number of mtech student in Chennai
-- 10. List students who have got less than 40 in Chennai
-- 11. List the top 3 performers in DSE and Mtech

-- ################## 16-06-2025  #######################
use sql_sai;
-- what is SQL-JOINS?
-- JOINS are used to combine records from two or more tables based on related columns 
-- why we use SQL JOINS?
-- retrive related data from multiple tables 
-- Normalized the data by separating it into logical tables 
-- created sample table on empoyees

create table EMPLOYEES(
EMP_ID INT primary KEY,
EMPLOYEE_NAME VARCHAR(50),
DEPT_ID INT);

-- insert the data into tables

INSERT INTO EMPLOYEES VALUES
(1,'Akash',10),
(2,'LUFFY',20),
(3,'SAM',30),
(4,'BEN',NULL);
-- check the data from employee table
SELECT * FROM employees;
-- create table department having attributes DEPT_ID , DEPT_NAME
CREATE TABLE DEPARTMENTS(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(40));
-- INSERT data into departments
INSERT INTO DEPARTMENTS VALUES
(10,'HR'),
(20,'IT'),
(30,'FINANCE'),
(40,'MARKETING');
-- check the data of departments
select * FROM DEPARTMENTS;
-- The common column used to join two tables is known as foreign keys.
-- 1.INNER JOIN:- gets the matched records from both the tables

SELECT E.EMPLOYEE_NAME,D.DEPT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPT_ID = D.DEPT_ID;

-- 2.LEFT JOIN:- gets all the records from left table and matched records from right table
SELECT E.EMPLOYEE_NAME,D.DEPT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPT_ID = D.DEPT_ID;
-- 3.RIGHT JOIN:- get all the records from right table and matched records from left tables
SELECT E.EMPLOYEE_NAME,D.DEPT_NAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPT_ID = D.DEPT_ID;

-- 4. FULL OUTER JOIN:- All the data from both the tables
SELECT E.EMPLOYEE_NAME,D.DEPT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPT_ID = D.DEPT_ID
UNION
SELECT E.EMPLOYEE_NAME,D.DEPT_NAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPT_ID = D.DEPT_ID;

-- 5.CROSS JOIN:- from left table every row is paired with every row right table.
SELECT E.EMPLOYEE_NAME,D.DEPT_NAME
FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;

-- 6.SELF JOIN:- a table join itself
-- ADD a column in employees tables add the manager ID
ALTER TABLE EMPLOYEES ADD MANAGER_ID INT;
SELECT * FROM EMPLOYEES;
-- update the null values
SET SQL_SAFE_UPDATES = 0;
UPDATE EMPLOYEES SET MANAGER_ID = NULL WHERE EMP_ID = 1; 
UPDATE EMPLOYEES SET MANAGER_ID = 1 WHERE EMP_ID IN (2,3); 
UPDATE EMPLOYEES SET MANAGER_ID = 2 WHERE EMP_ID = 4;

SELECT E.EMPLOYEE_NAME AS EMPLOYEE, M.EMPLOYEE_NAME AS MANAGER
FROM EMPLOYEES E LEFT JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMP_ID;

-- ######### 17-06-2025 ############
use  sql_sai;
-- windows function
-- what are window functions?
-- window functions perform calculations across a set of table rows
-- why we are using the window functions?
-- performing runing total, ranking, percentiles, average..etc
-- analyze the rows while keeping the full details
-- create a table on sales
CREATE TABLE SALES(
ID INT PRIMARY KEY,
EMPLOYEE_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALE_AMOUNT DECIMAL(10,2),
SALE_DATE DATE);
INSERT INTO SALES VALUES 
(1,'Anderson','HR','1500','2025-01-01'),
(2,'Benny','IT','100','2025-01-02'),
(3,'Anderson','HR','1200','2025-01-03'),
(4,'Benny','IT','1700','2025-01-05'),
(5,'Chalie','IT','800','2025-01-04'),
(6,'Anderson','HR','900','2025-01-06');
UPDATE sales
SET sale_amount = 900
WHERE id = 6;
select * from sales;
-- SYNTAX:- FUNCTION_NAME() OVER(PARTITION BY COLUMN ORDER BY COLUMN) FROM TABLE_NAME
-- ROW_NUMBER()-->row numbering
-- get the number of rows for sales table based on date and get the records of sales amount
SELECT EMPLOYEE_NAME, SALE_AMOUNT,ROW_NUMBER()
OVER(PARTITION BY DEPARTMENT ORDER BY SALE_DATE) AS SALES_AMOUNT_DATE FROM SALES;
-- RANK() AND DENSE_RANK()--> ranking the rows.
-- rank the rows according to sale_amount
SELECT EMPLOYEE_NAME,SALE_AMOUNT,RANK()
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY SALE_AMOUNT DESC) AS RANK_AMOUNT FROM SALES;
SELECT EMPLOYEE_NAME,SALE_AMOUNT,RANK()
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY SALE_DATE DESC) AS RANK_DATE FROM SALES;

INSERT into SALES VALUES
(7,'Anderson','HR',1200,'2025-01-07'); 
SELECT EMPLOYEE_NAME,SALE_AMOUNT, RANK()
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY SALE_AMOUNT DESC) AS RANK_ROW FROM SALES;

-- USE DENSE RANK
SELECT EMPLOYEE_NAME,SALE_AMOUNT, DENSE_RANK()
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY SALE_AMOUNT DESC) AS RANK_ROW FROM SALES;
-- What is the dtfference between rank() and dense rank()
-- in rank() it skips the number if there is tie.
-- in dense rank() it doesn't skip the number on tie.

-- 3.SUM()-->running total -- is nothing but your cumulating freguency
select EMPLOYEE_NAME, SALE_AMOUNT, SUM(SALE_AMOUNT) 
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY  SALE_DATE) AS RUNNING_TOTAL FROM SALES;

-- 4.AVG() --> IT CAN BE MOVING OR GROUPED AVERAGE 
select EMPLOYEE_NAME, SALE_AMOUNT, AVG(SALE_AMOUNT) 
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY  SALE_DATE) AS RUNNING_AVERAGE FROM SALES;

-- 5.LEAD() AND LAG()--> COMPARE THE NEXT SALE AND PAST ROW SALE
select EMPLOYEE_NAME, SALE_DATE,SALE_AMOUNT, LEAD(SALE_AMOUNT) 
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY  SALE_DATE) FROM SALES;
select EMPLOYEE_NAME, SALE_DATE,SALE_AMOUNT, LAG(SALE_AMOUNT) 
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY  SALE_DATE) FROM SALES;
-- 6.NTILE(n):- divides the rows into n groups
select EMPLOYEE_NAME, SALE_DATE,SALE_AMOUNT, ntile(3) 
OVER(PARTITION BY EMPLOYEE_NAME ORDER BY  SALE_AMOUNT) AS BUCKET FROM SALES;

-- get the common data from both the purchases and products table
-- get the all records from purchases table and matched record from customers table 
-- join the products and product_type_id table get the names from product_type_id table and name from products
-- apply the full outer join to the customer table and purchases table
-- apply the right join for products and product_type_id table

-- ############## 18-06-2025 ##################
 use sql_sai;
 -- Views
 -- A view in mysql is a virtual table table based on result of select query
 -- it doesn't store the data like table
 -- it is like virtual represention of your table
 
 -- CHECK THE DATA OF CUSTOMER
 SELECT * FROM CUSTOMER;
 -- Create a view on dob of 1965-01-01
 CREATE VIEW ACTIVE_CUSTOMER AS 
 SELECT CUSTOMER_ID,LAST_NAME,PHONE 
 FROM CUSTOMER
 WHERE DOB IN ('1965-01-01');
 -- CHECK the data in view
 SELECT * FROM ACTIVE_CUSTOMER;
 -- UPDATE the name to green from view and it can be impact on original table 
 SET SQL_SAFE_UPDATES = 0;
 UPDATE ACTIVE_CUSTOMER SET LAST_NAME = 'Green'
 WHERE CUSTOMER_ID = 1;
 -- Check the data in customer
  SELECT * FROM CUSTOMER;
  -- ## INDEX ###
  -- check the data of products
  SELECT * FROM PRODUCTS;
  -- iNDEXES are used for faster retrivel of data 'select'
  -- when we use indices it slow down the operations of "insert,update,delete".
-- create an index on column call 'name' from products table
-- get the record of product name "Z Files"
select * FROM PRODUCTS WHERE NAME = "Z FILES";
EXPLAIN select * FROM PRODUCTS WHERE NAME = "Z FILES";

CREATE INDEX PRODUCT_NAME_IDX ON PRODUCTS(NAME);
 select * FROM PRODUCTS WHERE NAME = "Z FILES";
 EXPLAIN select * FROM PRODUCTS WHERE NAME = "Z FILES";
 
 -- 2.Composite index-- creating  the index on multiple columns
 -- create index on product_type_id, name from products table
 CREATE INDEX P_TYPE_NAME_IDX ON PRODUCTS(PRODUCT_TYPE_ID,NAME);
 -- GET THE records of name is chemistry or product_type_id = 2
 SELECT * FROM PRODUCTS WHERE NAME = "CHEMISTRY" OR PRODUCT_TYPE_ID = 2;
 EXPLAIN  SELECT * FROM PRODUCTS WHERE NAME = "CHEMISTRY" OR PRODUCT_TYPE_ID = 2;
 -- 3.unique index is create when there is no duplicate data in the columns
 CREATE UNIQUE INDEX IQ_IDX ON PRODUCTS(PRODUCT_ID);
 DESCRIBE PRODUCTS;
 -- Drop index
 DROP INDEX P_TYPE_NAME_IDX ON PRODUCTS;
 DROP INDEX PRODUCT_NAME_IDX ON PRODUCTS;
   DROP INDEX IQ_IDX ON PRODUCTS;
   
-- ### REVISION #########
-- 