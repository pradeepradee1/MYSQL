/*
Sub Query	:
				A query inside another query 
				It runs independently
				It Runs once and gives a result to the outer query





#Execution process:
#					Here the execution process is always from innermost query to the outermost.

#Outer query<-----------I/p<------------Inner query

*/


use mydb;
/*
#Find The Employee who's salary is more than the average salary earned by all employee
*/


select 
*
from emp
where sal > (select avg(sal) from emp)


