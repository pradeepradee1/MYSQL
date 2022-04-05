/*
Inner Or Equi Join :

					A Cross join is known as equi join if we specify join condition using '=' operator.
					It will display only matched data from all tables.
					A condition is known as join condition if it is specified between primary key of one
					table and foriegn key of other table.
*/


# Equi Join
use mydb;

#Syntax
select col1, col2, ....
from table1, table2,....
where table1.pk=table2.fk and table2.pk=table3.fk.......;



select ename, sal,dept.dno,dname,loc
from emp,dept
where emp.dno =dept.dno ;


select e.ename,e.sal,e.dno,d.dno,d.dname,d.loc 
from emp e, dept d
where e.dno=d.dno;


SELECT *
from emp_info ei , emp_info_child eic 
where ei.eid = eic.eid 

#Equi Join 5 tables 
select t1.*,t2.*...
from 
t1,t2,t3,t4,t5
where
t1.col1=t2.col4
and
t2.col3=t3.col1
and
t3.col2=t4.col31
and
t4.col31=t5.col30;

