/*
Alter
*/
#It is used to change the structure of the table

use mydb;

SELECT * FROM stack s 

#Adding a Columns
Alter table stack 
add column newcolumn date null

#Adding a Multiple Columns
Alter table stack 
add column newcolumn1 date null,
add column newcolumn2 date null,
add column newcolumn3 date null;


Alter table stack 
add column newcolumn11 date null after newcolumn1,
add column newcolumn12 date null after newcolumn2,
add column newcolumn13 date null after newcolumn3;

#Drop columns
Alter table stack 
drop column newcolumn13

#Modify columns data types
Alter table stack 
modify column newcolumn date not null 

#Rename Columns
Alter table stack
CHANGE column newcolumn3 newcolumn333 time;



#Adding Constraints
#Changing Priymary Key Columns
ALTER TABLE stack1 
MODIFY column columnname int PRIMARY KEY;

#Droping The Constraints Columns
ALTER TABLE stack1
DROP PRIMARY KEY;
