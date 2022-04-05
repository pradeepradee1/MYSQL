
#Inner Join
use mydb;


select ename, sal,dno,dname,loc
from emp Inner join dept ON emp.dno=dept.dno;

#inner Join 5 tables 

select t1.*,t2.*...
from 
t1 Inner Join t2
ON
t1.col1=t2.col4
Inner Join t3
ON
t2.col3=t3.col1 
Inner Join t4
ON
t3.col2=t4.col31 
Inner Join t5
ON
t4.col31=t5.col30;
