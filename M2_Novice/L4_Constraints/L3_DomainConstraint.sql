/*
DOMAIN constraints:
					It is used to define a valid range / valid list of values on a column by using the keyword
					CHECK
					
					CHECK Has two operators
					
						1) BETWEEN : to define range
						2) IN : to define list of values.
											
*/
#Ex 1: create the above table along with below domain constraints:

# rno should be between 1 and 60
# course names are oracle, sql server and unix
# Min fee is 5000 and max fee 10000

use mydb ;


create or replace table stud_dtls
(
rno int(2) primary key,
sname varchar(10)  not null ,
course varchar(15)   not null ,
fee int(5)  not null,
mobile  char(10)  unique,
constraint check (rno between 1 and 60),
constraint check (course in('oracle','sql server','unix')),
constraint check (fee between 5000 and 10000)
);

SELECT * FROM stud_dtls

insert into stud_dtls values(1,'a','oracle',7000,1212);
insert into stud_dtls values(0,'b','sql server',7000,null);
insert into stud_dtls values(61,'a','oracle',7000,null);
insert into stud_dtls values(12,'b','sql server',7000,null);
insert into stud_dtls values(11,'ajay','unics',10000,2212);
insert into stud_dtls values(21,'hari','unix',17000,1211);
insert into stud_dtls values(21,'hari','unix',9000,1211);

SELECT * FROM stud_dtls


USE INFORMATION_SCHEMA;

SELECT *
FROM KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "mydb" AND TABLE_NAME = "stud_dtls" 


(OR)

SHOW COLUMNS FROM student_dtls;

(OR)

DESC student_dtls
