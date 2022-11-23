/*
Types :
		
		1)	Scalar Subquery
		2) 	Multiple Row Subquery
*/

use mydb;

#1) Scalar Subquery	:
-- 						It Always returns 1 row and 1 column


#Find The Employee who's salary is more than the average salary earned by all employee?


select 
*
from emp
where sal > (select avg(sal) from emp)



#2) Multiple Row Subquery	:
--							subquery which returns only 1 column and multple rows
--							Subquery which returns multiple column and multiple rows												

#Find The Department who do not have any employee

select
*
from dept
where dno not in (select distinct dno from emp where dno is not null)

#Find The Employee who earn the highest salary in each department ?

select 
*
from emp e 
where (dno,sal) in (select dno , max(sal) from emp e where dno is not null group by dno)
