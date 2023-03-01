#Question 4:
		
#			Get the first 2 and last 2 month of year salary  


select 
empid ,monthno ,sum(salary)  
from
	(select empid ,monthno ,salary ,
	DENSE_RANK() OVER (PARTITION BY empid ORDER BY monthno asc) row_num_asc,
	DENSE_RANK() OVER (PARTITION BY empid ORDER BY monthno desc) row_num_desc
	FROM 
	tmptable2 t)a
where 
	row_num_asc<=2 or row_num_desc<=2
group by 
	empid 
order by 
	empid,monthno
