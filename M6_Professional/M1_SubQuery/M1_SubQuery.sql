/*
Sub Query	:
				A Query with in other query is known as sub_query



#Execution process:
#					Here the execution process is always from innermost query to the outermost.

#Outer query<-----------I/p<------------Inner query

*/


use mydb;

#Find The Employee who's salary is more than the average salary earned by all employee



select 
*
from emp
where sal > (select avg(sal) from emp)


