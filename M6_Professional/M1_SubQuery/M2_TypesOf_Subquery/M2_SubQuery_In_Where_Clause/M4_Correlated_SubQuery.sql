/*
CORRELATED SUBQUERY:
						A query inside another query 
						It runs depends on values from the outer query
						It Runs once for every records of the outer query

*/

/*
Problem :
Find employees whose salary is greater than the average salary of their department
*/


select 
*
from 
emp e1
where sal > (select avg(sal) from emp e2 where e2.dno = e1.dno )




/*

outer query---I/p---> Inner query--->I/p--->|
	^										 |
	|										 |
	<-----------------------------------------

*/




/*
# Note:    

# When you have to go to Correlation Subquery ?
	# When the subquery meets join

*/


/*
# Note : This is correct (Correlation Subquery)


# Note : No need to give group by dno , because it is join on dno

Note :
Cor-relation subquery 			=	we should use Equi-Join.

*/



/* 

Equivalent JOIN solution 

Note : For better performance we can go for join

*/

SELECT e.*
FROM emp e
JOIN (
    SELECT dno, AVG(sal) avg_sal
    FROM emp
    GROUP BY dno
) a
ON e.dno = a.dno
WHERE e.sal > a.avg_sal;