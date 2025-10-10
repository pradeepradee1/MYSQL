/*
Limit Clause
*/

use mydb;

select * From Wheather w 
order by Temp 

select * From Wheather w 
order by Temp 
limit 2

# Limit Offset
select * From Wheather w 
order by Temp
limit 2,3

#Note:
--      Skips the first 2 rows and returns the next 2.

select * From Wheather w 
order by Temp
limit 0,2


/* LIMIT 2 OFFSET 2 */


