select * from psEmployee

#Get Second Max Salary
/*
		SecondMaxSalary
			200

*/


# Right Way
select 
	* 
from 
	psEmployee
where id = (select id from psEmployee pe order by Salary desc limit 1,1 )



select 
	max(Salary) as secondMaxSalary
from 
	psEmployee pe 
where Salary not in (select max(Salary) from psEmployee pe2 )


# Right Way (Professional Way)

SELECT * from 
(SELECT *,
DENSE_RANK() over(ORDER by Salary desc) as  rank
from 
psEmployee pe ) tab
where tab.rank = 2

