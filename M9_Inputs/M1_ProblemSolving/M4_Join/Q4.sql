/*
Question : Find the correspnding manager name

IP :

	1	Alice		2
	2	Bob			3
	3	Charlie		


OP 	:

	1	Alice		2		2		Bob			3
	2	Bob			3		3		Charlie		NULL
	3	Charlie		NULL	NULL	NULL		NULL

*/



select * from emp_table a 








# Answers

select 
* 
from emp_table a 
left join emp_table b on a.manager_id = b.emp_id 