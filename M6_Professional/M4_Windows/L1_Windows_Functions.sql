/*
1) row_number()
2) rank()
3) dense_rank()
4) percent_rank() 
*/



select * from emp e 


select avg(sal) from emp e -- 3,192.8571


select 
	e.*,avg(sal) over() as maxsalary  
from 
	emp e


select 
	e.dno ,avg(sal) 
from 
	emp e
group by 
	e.dno


select 
	e.* ,avg(sal) over(partition by e.dno) as maxsalary  
from 
	emp e


#Note : Floating Average or Moving Average
select 
	e.* ,
	avg(sal) over(order by e.dno) as maxsalary  
from 
	emp e



#Note : Moving total with restrictions
select 
	gender,
	day,
	sum(score_points) over(PARTITION by gender order by day) as total
from pScores ps 
	order by gender




-- row_number

select 
	e.*,row_number() over() as rn  
from 
	emp e


select 
	e.*,row_number() over(partition by e.dno) as rn  
from 
	emp e

-- Fetch the first 2 employees from each department to join the company
select 
	* 
from 
	(
		select 
		e.*,row_number() over(partition by e.dno order by e.eid) as rn  
		from emp e
	) x
where 
	x.rn < 3


/* 
Alternate Query

with ranknumber as (select e.*,row_number() over(partition by e.dno order by e.eid) as rn  from emp e)
(
select 
*
from 
ranknumber rn
where rn < 3
)

*/


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
FROM 
	emp e


select 
	e.*,
	rank() over(partition by e.dno order by e.sal desc) as rnk,
	dense_rank() over(partition by e.dno order by e.sal desc) as Dense_rnk,
	row_number() over(partition by e.dno order by e.sal desc) as rn
FROM 
	emp e

--Percent_Rank 
#Percentile

SELECT
	*,
	sal,
	PERCENT_RANK() OVER (PARTITION BY dno ORDER BY sal) percentile_rank
FROM
	emp;




