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

Candidate Key 	: 			one or more columns should follow the unique constrain in a table
							Each Candidate Key can work as a Primary Key.
							
							Example: ID, RollNo and EnrollNo are Candidate Keys 
							since all these three fields can work as Primary Key.

Super Keys	  	: 			one or more keys should follow the unique constrain in a table
							
							Example: Primary key, Unique key, Alternate key are a subset of Super Keys.
							


*/

use mydb;
create or replace table keyparent
(
id tinyint comment 'PK' ,
Rollno mediumint comment 'AK' ,
Name varchar(10) ,
EnrollNo tinyint comment 'AK',
Address varchar(10),
Deptid tinyint comment 'FK'
)

# ID, Rolno, Enrollno (PK,AK,AK)  		=  Candidate Key	
# PK , AK 				 				= 	Super Key 

create or replace table keychild
(
Deptid tinyint comment 'PK', 
Name varchar(10),
Address varchar(10)
);



