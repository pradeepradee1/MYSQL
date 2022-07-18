/*
Alter
*/
#Adding or Droping the Constrains Priymary Key  and Index

use mydb;

SELECT * FROM stack s 

#Adding a Index
ALTER TABLE stack 
ADD INDEX `stack_index` (id_user)

#Adding composite (Multiple) Index
ALTER TABLE stack 
ADD INDEX `stack_index` (id_user,mod_id);

#Drop
ALTER TABLE stack 
Drop INDEX `stack_index`



#Adding Constraints
#Changing Priymary Key Columns
ALTER TABLE stack1 
MODIFY column columnname int PRIMARY KEY;

ALTER TABLE stack1
DROP PRIMARY KEY;

