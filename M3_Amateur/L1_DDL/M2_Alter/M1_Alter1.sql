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

#Deleting existed columns
Alter table stack 
drop column newcolumn13

#Modify existed columns
Alter table stack 
modify newcolumn3 datetime not null 

ALTER TABLE stack1 
MODIFY id int PRIMARY KEY;

#Change type and name of column
Alter table stack
CHANGE newcolumn3 newcolumn333 timestamp NOT NULL; 


#Rename Table 
RENAME TABLE `stack3` TO `stack33`;
#OR
ALTER TABLE `stack33` RENAME TO `stack3`;




