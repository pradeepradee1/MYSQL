/*

With Clause 

*/

select 
	* 
from 
	emp

#Example : 1

-- Fetch the emp who earns more than avg salary of all employess

select
	*
from 
	emp e 
where 
	e.sal > (select cast(avg(sal) as int) from emp)


with average_salary (avg_sal) as (select cast(avg(sal) as int) from emp)
select 
	*
from 
	emp e,average_salary av
where 
	e.sal > av.avg_sal;




