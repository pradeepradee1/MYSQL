select * from emp e 


select max(sal) from emp e 

select e.dno ,
max(sal) 
from emp e
group by e.dno 

select e.* ,
max(sal) over() as maxsalary  
from emp e

select e.* ,
max(sal) over(partition by e.dno) as maxsalary  
from emp e

-- row_number,rank,dense_rank,lead and lag

select e.* ,
row_number() over() as rn  
from emp e

select e.* ,
row_number() over(partition by e.dno) as rn  
from emp e

-- Fetch the first 2 employees from each department to join the company
select * from (
	select e.* ,
	row_number() over(partition by e.dno order by e.eid) as rn  
	from emp e
) x
where x.rn < 3


-- Fetch the top 3 employee in each department earning the max salary
select * from (
	select e.*,
	rank() over(partition by e.dno order by e.sal desc) as rnk
	FROM emp e 
) x
where x.rnk < 4



select e.*,
rank() over(partition by e.dno order by e.sal desc) as rnk,
dense_rank() over(partition by e.dno order by e.sal desc) as Dense_rnk
FROM emp e



select e.*,
rank() over(partition by e.dno order by e.sal desc) as rnk,
dense_rank() over(partition by e.dno order by e.sal desc) as Dense_rnk,
row_number() over(partition by e.dno order by e.sal desc) as rn
FROM emp e


-- fetch a query to display if the salary of an employee is higher , lower or equal to the previous employee


select 
e.*,
lag(sal) over (partition by e.dno order by e.eid) as previouse_employee_sal
FROM emp e

# Note : We can see the first eid null 


select 
e.*,
lag(sal,2) over (partition by e.dno order by e.eid) as previouse_employee_sal
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

