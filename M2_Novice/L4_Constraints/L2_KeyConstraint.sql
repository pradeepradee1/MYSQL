/*
KEY CONSTRAINT :

			These constraints check the individual values in to a column according to Business.

1) UNIQUE :

			It doesn’t allow duplicates but allows null values.
			Ex: This constraint is suitable for maintaining phone numbers, mailid, etc...
			
2) NOT NULL :

			It doesn’t allow null values but allows duplicates.
			Ex: EmpNames, CustNames, .....

3) PRIMARY KEY :

			It doesn't allow duplicates and null values.
			Generally a Primary key is used to identify any record in a table uniquely.
			Only one primary key is allowed per a table
			
			PRIMARY KEY has two types :
			
				1)Simple :
						If a Primary key Defined on a single column then it is known as Simple Primary key.
				
				2)Composite :
						If a Primary key constraint defined on more than one column then it is known 
						as Composite Primary Key.
			
						NOTE :
						(Max numbers of columns in to a composite Primary key are 32 columns)
						Composite Primary Key: primary key (custid,prodid,timeid)
			
*/


#SYNTAX :

Create table <table name>
(
col1 datatype(size) <constraint_name>,
col2 datatype(size) <constraint_name>,
:
:
:
:
);

#EX:
#create a table student with columns rno,sname,course,fee and 
#mobile along with constraints pk,nn,nn,nn and unique respectively?

use mydb; 

Create or Replace table student
(
rno int(2) PRIMARY KEY ,
sname varchar(10) not null,
course varchar(15) not null,
fee int(5) not null,
mobile char(10) unique
)
;

insert into student values(1,'a','oracle',9000,'8989898989');
insert into student values(0,'b','java',2000,'8787878787');
insert into student values(2,'x','oracle',9000,null);
insert into student values(11,'s','abc',100,null);

SELECT * from student;

#ERROR GENERATING RECORDS:

insert into student values(1,'kiran','java',2300,null);
insert into student values(null,'kiran','java',2300,null);
insert into student values(12,null,'java',2300,null);
insert into student values(1,'kiran',null,2300,null);
insert into student values(1,'kiran','java',null,null);
insert into student values(1,'kiran','java',2300,8989898989);


#Note:  1) Even after the keyconstraints on the table, still we have invalid values.
#	    2) We can eliminate them by using DOMAIN constraints.


/*
Displaying constraints information on a table:

In oracle database, all constraints stored in a system defined table called USER_CONSTRAINTS.
Each constraint named and numbered uniquely like, SYS_Cn(System defined Constraint).
To Fetch data from this table use the below example.

*/

#EX:

USE INFORMATION_SCHEMA;

SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "mydb" AND TABLE_NAME = "student" 


use mydb; 



#CONSTRAINTS with user-defined names:
/*
#SYNTAX:

<col> datatype(size) Constraint <User defined name> <constraint name> (column name),
<col> datatype(size) Constraint <User defined name> <constraint name> (column name)

#EX:
<col> datatype(size) Constraint pk_rno_student Primary key,
*/ 


create or replace table student_dtls
(
rno int(2),
sname varchar(20) not null,
course varchar(7) not null ,
fee tinyint(5),
mobile tinyint(10) unique,
constraint PKConstraintName1 primary key(rno)
)
;

(OR)

create or replace table student_dtls
(
rno int(2),
sname varchar(20) not null,
course varchar(7) not null ,
fee tinyint(5),
mobile tinyint(10),
constraint primary key(rno),
constraint unique(mobile)
)
;


USE INFORMATION_SCHEMA;

SELECT *
FROM KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = "mydb" AND TABLE_NAME = "student_dtls" 

(OR)

SHOW COLUMNS FROM student_dtls;

(OR)

DESC student_dtls

use mydb;



