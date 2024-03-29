/*

Keys			: 
							1)PK
							2)FK
							3)Candidate Key
							4)AK
							5)Composite Key
							6)Super Keys

							
PK				: 			Combination of Not Null and unique Constrain , We can have only one primary key
							
							Example :
										ID
						
FK				:   		It Creates a relationship between any two tables

							Example :
										Deptid


Candidate Key 	: 			A Primary Key can be selected from candidate key
							
							Example: 
										ID 
										Email
										Phonenumber

							Example:
										Election CM  selected from the candidate person


AK				:  			Apart from Primary Key , all keys in Candidate keys are Alternate Key

							Example :
										Email
										Phonenumber


Composite Key   :			The Combination of more than one candidate key.
 



Super Keys	  	: 			SuperSet Of Candidate Key
							A Table can have multiple superkey

							Example : 
										ID
										Email
										Phonenumber
										ID,Name
										ID,City
										ID,Email
										ID,Phonenumber
										ID,Country
										etc...


Surrogate key 	:           Unique identifier assigned to each row in a table

							Example :
										ID : ( 1 	,	2	,	3)
							
				

*/

use mydb;
create or replace table keyparent
(
ID tinyint comment ,
Name varchar(10) ,
Email varchar(10) ,
City varchar(10) ,
Phonenumber mediumint comment  ,
Country varchar(10),
Deptid tinyint comment 
)



create or replace table keychild
(
Deptid tinyint comment 'PK', 
Name varchar(10),
Address varchar(10)
);



