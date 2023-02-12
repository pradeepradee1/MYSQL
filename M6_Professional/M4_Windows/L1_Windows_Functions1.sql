/*
1) row_number()
2) rank()
3) dense_rank()
4) percent_rank()
5) lead()
6) lag()
*/



select * from emp e 


select avg(sal) from emp e 

select 
e.dno ,avg(sal) 
from emp e
group by e.dno 

select 
e.*,avg(sal) over() as maxsalary  
from emp e

select 
e.* ,avg(sal) over(order by e.dno) as maxsalary  
from emp e

select 
e.* ,avg(sal) over(partition by e.dno) as maxsalary  
from emp e

-- row_number

select 
e.*,row_number() over() as rn  
from emp e

select 
e.*,row_number() over(partition by e.dno) as rn  
from emp e

-- Fetch the first 2 employees from each department to join the company
select 
* 
from 
(
	select 
	e.*,row_number() over(partition by e.dno order by e.eid) as rn  
	from emp e
) x
where x.rn < 3


-- rank

-- Fetch the top 3 employee in each department earning the max salary
select 
* 
from 
(
	select 
	e.*,rank() over(partition by e.dno order by e.sal desc) as rnk
	FROM emp e 
) x
where x.rnk < 4

--Dense_rank
select 
e.*,rank() over(partition by e.dno order by e.sal desc) as rnk,
dense_rank() over(partition by e.dno order by e.sal desc) as Dense_rnk
FROM emp e



select 
e.*,
rank() over(partition by e.dno order by e.sal desc) as rnk,
dense_rank() over(partition by e.dno order by e.sal desc) as Dense_rnk,
row_number() over(partition by e.dno order by e.sal desc) as rn
FROM emp e

--Percent_Rank
SELECT
*,
sal,
PERCENT_RANK() OVER (PARTITION BY dno ORDER BY sal) percentile_rank
FROM
emp;



-- lead and lag

-- fetch a query to display if the salary of an employee is higher , lower or equal to the previous employee


select 
e.*,lag(sal) over (partition by e.dno order by e.eid) as previouse_employee_sal
FROM emp e

# Note : We can see the first eid null 

select 
e.*,lag(sal,2) over (partition by e.dno order by e.eid) as previouse_employee_sal
FROM emp e



select 
e.*,
lag(sal) over (partition by e.dno order by e.eid) as previouse_employee_sal,
lead(sal) over (partition by e.dno order by e.eid) as next_employee_sal
FROM emp e


select 
e.*,
lag(sal,2) over (partition by e.dno order by e.eid) as previouse_employee_sal,
CASE  
	when e.sal > lag(sal) over (PARTITION by e.dno order by e.eid) then 'Higher than previous employee'
	when e.sal < lag(sal) over (PARTITION by e.dno order by e.eid) then 'Lower than previous employee'
	when e.sal = lag(sal) over (PARTITION by e.dno order by e.eid) then 'same as than previous employee'
END as sal_range
FROM emp e

