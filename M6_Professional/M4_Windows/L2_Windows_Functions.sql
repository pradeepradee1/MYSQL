/*
5)	lead
6) 	lag
*/


-- Fetch a query to display if the salary of an employee is higher , lower or equal to the previous employee


select 
	e.*,lag(sal) over (partition by e.dno order by e.eid) as previouse_employee_sal
from	
	emp e

# Note : We can see the first eid null 

select 
	e.*,lag(sal,2) over (partition by e.dno order by e.eid) as previouse_employee_sal
FROM 
	emp e



select 
	e.*,
	lag(sal) over (partition by e.dno order by e.eid) as previouse_employee_sal,
	lead(sal) over (partition by e.dno order by e.eid) as next_employee_sal
FROM 
	emp e


select 
	e.*,
	lag(sal,2) over (partition by e.dno order by e.eid) as previouse_employee_sal,
	CASE  
		when e.sal > lag(sal) over (PARTITION by e.dno order by e.eid) then 'Higher than previous employee'
		when e.sal < lag(sal) over (PARTITION by e.dno order by e.eid) then 'Lower than previous employee'
		when e.sal = lag(sal) over (PARTITION by e.dno order by e.eid) then 'same as than previous employee'
	END as sal_range
FROM 
	emp e

