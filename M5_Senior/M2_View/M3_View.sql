/*
Views :
		2) Read and Composite View

*/

use mydb;

create view vw_emp_dept_info
as
select 
ename,sal,dname,loc
from emp inner join dept on (emp.dno=dept.dno)
where dept.dname ='Finance'


select * from vw_emp_dept_info;

select ename,sal from vw_emp_dept_info
