/*
	InLine View Or Inline SubQuery :

			An inline subquery (or) view  is a SELECT statement in the FROM-clause of another SELECT statement.
			In-line views are commonly used to simplify complex queries by removing join operations
			and condensing several separate queries into a single query.



*/

# Equi Join
SELECT 
*
FROM ( SELECT dno, count(*) emp_count FROM emp where dno is not null GROUP BY dno ) emp,dept
WHERE dept.dno = emp.dno;


# (OR)
# Inner Join
SELECT 
	*
FROM ( SELECT dno, count(*) emp_count FROM emp where dno is not null GROUP BY dno ) a 
join dept b on a.dno = b.dno;


#Note : 
--		After The From Clause select clause will be treated as table 


# display the employees who earn the highest salary in each department?


# Inline subquery
 
select * from emp a
join (select max(sal) maxsal , dno from emp where dno is not null group by dno) b 
on a.dno = b.dno
where a.sal = b.maxsal


#Subquery
select 
*
from emp
where (dno , sal) in (select dno,max(sal) from emp where dno is not null group by dno) 
