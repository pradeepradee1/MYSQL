/*
	InLine View Or Inline SubQuery :

			An inline subquery (or) view  is a SELECT statement in the FROM-clause of another SELECT statement.
			In-line views are commonly used to simplify complex queries by removing join operations
			and condensing several separate queries into a single query.



*/

SELECT 
*
FROM ( SELECT dno, count(*) emp_count FROM emp where dno is not null GROUP BY dno ) emp,dept
WHERE dept.dno = emp.dno;


#Note : 
--		After The From Clause select clause will be treated as table 


# display the employees who earn the highest salary in each department?


SELECT 
*
FROM ( SELECT dno, max(sal) maxsal FROM emp where dno is not null GROUP BY dno ) b, emp a
WHERE
a.sal= b.maxsal
and
a.dno = b.dno;