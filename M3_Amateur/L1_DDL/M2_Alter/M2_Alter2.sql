/*
Alter
*/
#It is used to change the structure of the table

use mydb;

SELECT * FROM stack s 

#Adding a Index
ALTER TABLE stack ADD INDEX `stack_index` (id_user)

#Adding composite (Multiple) Index
ALTER TABLE stack ADD INDEX `stack_index1` (id_user,mod_id);

#Changing Priymary Key Columns
ALTER TABLE stack1 DROP PRIMARY KEY;
ALTER TABLE stack1 MODIFY COLUMN id int PRIMARY KEY;


