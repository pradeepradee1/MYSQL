#Question 3:
		
#Get the year salary for each & every employee  and if salary is null add 100 and return all the employee ?


select * from tmptable1;
select * from tmptable2;

select
	t1.empid ,
	sum(t2.salary) as totalsum1 ,
	if (t2.salary is null , 100 , sum(t2.salary)) as totalsum2 ,
	sum(if (t2.salary is null , 100 , t2.salary)) as totalsum3
from 
	tmptable1 t1 left join tmptable2 t2 on t1.empid = t2.empid 
group by t1.empid



