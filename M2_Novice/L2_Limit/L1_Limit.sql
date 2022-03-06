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

select * From Wheather w 
order by Temp
limit 0,2

