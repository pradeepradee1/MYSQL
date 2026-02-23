/*
GroupBy Clause:
				It is used to group related data
				On each group the oracle engine executes the aggregate function.
*/



#findout max sal under each deptno?
select eid,dno,max(sal) from emp
where dno is not null
group by dno



#find out number of emps working under each dept ?
select dno, count(*) " No. of emps"
from emp
where dno is not null
GROUP BY dno;


#find out number of emps working under each dept on order of deptno?
select dno, count(*) " No. of emps"
from emp
where dno is not null
GROUP BY dno
order by dno;


#Group Concat
select 
dno,GROUP_CONCAT(ename)
from emp
where dno is not null
GROUP BY dno;

select 
dno,GROUP_CONCAT(distinct ename order by ename desc)
from emp
where dno is not null
GROUP BY dno;

select 
dno,GROUP_CONCAT(distinct ename order by ename desc separator '<->')
from emp
where dno is not null
GROUP BY dno;
