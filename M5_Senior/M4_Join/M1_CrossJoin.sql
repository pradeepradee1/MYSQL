/*
	Cross Join : 
				It Combine the two tables  
				It gives All possible combinations of rows from two tables
				It returns the Cartesian product of two tables, Which means every row from the first table is combined
with every row from the second table

*/

# Cross Join
use mydb;

#1)
select
eid,ename,sal,dname 
from emp 
cross join dept;


#2)
select
eid,ename,sal,dname 
from emp 
join dept;


#3)
select
eid,ename,sal,dname 
from emp,dept;



