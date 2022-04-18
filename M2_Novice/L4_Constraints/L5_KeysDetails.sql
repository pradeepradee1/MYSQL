/*

Keys			: 
							1)PK
							2)FK
							3)AK
							4)Candidate Key
							5)Super Keys


PK				: 			Combination of Not Null and unique Constrain , We can have only one primary key

FK				:   		It Creates a relationship between any two tables

AK				:  			AK are eligible to become PK but not choosen as primary key

Candidate Key 	: 			one or more fields/columns that can identify a record uniquely in a table
							There can be multiple Candidate Keys in one table
							Each Candidate Key can work as a Primary Key.

							Example: ID, RollNo and EnrollNo are Candidate Keys 
							since all these three fields can work as Primary Key.

Super Keys	  	: 			more than one key that can be used to identify a record uniquely in a table
							
							Example: Primary key, Unique key, Alternate key are a subset of Super Keys.









*/

use mydb;
create or replace table keyparent
(
id tinyint comment 'PK' ,
Rollno mediumint comment 'AK' ,
Name varchar(10) ,
EnrollNo tinyint comment 'AK and Unique Key',
Address varchar(10),
Deptid tinyint comment 'FK'
)

# PK , AK ,  unique key  = 	Super Key 
# ID , Rolno, Enrollno   =  Candidate Key	


create or replace table keychild
(
Deptid tinyint comment 'PK', 
Name varchar(10),
Address varchar(10)
);



