/*
Delete
*/
use mydb;

#Delete all records from a Table
delete from emp_info 

#Delete a records based on the restrictions
delete from emp_info 
where desg IS NULL 

#Note:
#We can get the back the deleted records / data within the current session by using
#ROLLBACK.

#Delete Records based on the LIMIT 
DELETE FROM car  WHERE `name` is NOT  NULL  LIMIT 1

#Difference Between Delete and Truncate
#Truncate
/*
1) This will delete all the data and reset AUTO_INCREMENT index. It's much faster than DELETE FROM tableName on a
huge dataset
2) When you truncate a table SQL server doesn't delete the data, it drops the table and recreates it
*/

