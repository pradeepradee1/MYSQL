/*
Don't use like this, It will give you error
*/

select 
	* 
from 
	Employees2 a
where manager_id not exists (select manager_id from Employees2 where a.manager_id = Employees2.employee_id)


/*
correct query
*/

select 
	* 
from 
	Employees2 a
where not exists (select manager_id from Employees2 where a.manager_id = Employees2.employee_id) and 
