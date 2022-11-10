/*
Alter
*/
#Adding or Droping Index

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




