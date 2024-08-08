#PROBLEM STATEMENT : Write a SQL query to find the total number of people present inside the hospital.

select * from hospital

/*
Sample OP :

		2	2019-12-22 09:30:00.000		2019-12-22 09:15:00.000
		
		3	2019-12-22 09:45:00.000		2019-12-22 09:30:00.000
		
		4	2019-12-22 09:45:00.000	



*/




with cte as  
( select 
emp_id,
max(CASE when action = "in" then `time` END) as Intime,
max(CASE when action = "out" then `time` END) as Outtime
from hospital
group by emp_id )
select * from cte
where Intime > Outtime or Outtime is null