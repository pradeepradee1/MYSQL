/*
	Having : 
				It is used to specify conditions on group by output.
				

*/

# find out number of emps working under each dept on order of deptno if a dept
# contains at least 10 emps?


select eid ,ename ,dno, count(*) " No. of emps"
from emp
where dno is not null
GROUP BY dno
HAVING count(*)>1
order by dno;



