/*
1) row_number()
2) rank()
3) dense_rank()
4) percent_rank() (Percentage Rank)
*/

/*


Row Number
	*) It is used to identify the unique integer record of a table
	*) No Gaps in integer

Rank 
	*) if there are ties Tt will skips ranks
	*) gaps will be in ranking
	*) For ex :
	*) If two rows are tied at rank 2, the next rank will be 4 (not 3)

Dense Rank
	*) if there are ties Tt will not skips ranks
	*) gaps will not be in ranking
	*) For ex :
	*) If two rows are tied at rank 2, the next rank will be 3


Note : 
		Dense = Density


*/

/*

CREATE or replace TABLE emp (
    eid INT,
    ename VARCHAR(10),
    sal INT,
    dno INT
);

INSERT INTO emp (eid, ename, sal, dno) VALUES
(5, 'C', 1000, NULL),
(6, 'S', 1300, NULL),
(7, 'D', 2300, NULL),
(8, 'X', 1200, NULL),
(9, 'B', 2200, NULL),
(1, 'A', 2000, 10),
(2, 'X', 1400, 10),
(3, 'A', 3500, 30),
(4, 'Z', 500, 10),
(10, 'a', 5000, 30),
(11, 'b', 505, 30);

*/


select * from emp e 


select avg(sal) from emp e

/*
Output :
			1900.4545
*/


/*
Note : Floating Average or Moving Average or Running Average (Running Water)
*/


select 
	e.*,
	avg(sal) over() as maxsalary  
from 
	emp e
/*
Output :

eid  ename  sal    dno     maxsalary
4		Z	500		10		1900.4545
11		b	505		30		1900.4545
5		C	1000	NULL	1900.4545
8		X	1200	NULL	1900.4545
6		S	1300	NULL	1900.4545
2		X	1400	10		1900.4545
1		A	2000	10		1900.4545
9		B	2200    NULL	1900.4545
7		D	2300    NULL	1900.4545
3		A	3500	30		1900.4545
10		a	5000	30		1900.4545

*/

/*
Note : Floating Average based on the dno order (lowest order)
*/

select 
	e.* ,
	avg(sal) over(order by e.dno) as avgsalary  
from 
	emp e


/*
Note : Group by dno
*/

select 
	e.* ,
	avg(sal) over(partition by e.dno) as avgsalary  
from 
	emp e



/*
Note : Moving total and Running Total and Floating total 
*/

select 
	gender,
	day,
	sum(score_points) over(PARTITION by gender order by day) as total
from pScores ps 
	order by gender




/*

row_number

*/

select 
	e.*,
	row_number() over() as rn  
from 
	emp e


select 
	e.*,
	row_number() over(partition by e.dno) as rn  
from 
	emp e

/*
Fetch the first 2 employees from each department to join the company
*/

select 
	* 
from 
	(
		select 
		e.*,
		row_number() over(partition by e.dno order by e.eid) as rn  
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

/*

Rank :

Fetch the top 3 employee in each department earning the max salary

*/
select 
* 
from 
(
	select 
	e.*,
	rank() over(partition by e.dno order by e.sal desc) as rnk
	FROM emp e 
) x
where x.rnk < 4

/*

Dense_rank

*/

select 
	e.*,
	rank() over(partition by e.dno order by e.sal desc) as rnk,
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

/*
Percent_Rank 

Percentile

*/


SELECT
	*,
	sal,
	PERCENT_RANK() OVER (PARTITION BY dno ORDER BY sal) percentile_rank
FROM
	emp;




