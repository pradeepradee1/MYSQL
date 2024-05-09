/*
Equi Join :

					A Equi join is known as Inner join , if we specify join condition using '=' operator.
					Return only matching records from all tables.
*/


# Equi Join

# Note:
# It is sequence od cross join and where clause is using

use mydb;

select 
ename, sal,dept.dno,dname,loc
from emp,dept
where emp.dno =dept.dno ;


#Equi Join 5 tables 
select 
t1.*,t2.*...
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



