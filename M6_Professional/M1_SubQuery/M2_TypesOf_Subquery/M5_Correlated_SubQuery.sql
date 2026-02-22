/*
CORRELATED SUBQUERY:
						A query inside another query 
						It runs depends on values from the outer query
						It Runs once for every records of the outer query

*/

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



#Note :
    Cor-related subqury can join with same table 
    It can join with two different tables also ( based on the requirement )

#Note :
    CTE = We can go CTE in Subquery scenario and Inline Subqury
          Not Cor-related subquery

*/


select 
*
from 
emp e1
where sal > (select avg(sal) from emp e2 where e2.dno = e1.dno )


#Alternate Solution in (inline subquery)

select 
a.* 
from emp a
join (select avg(sal) avgsal,dno from emp group by dno) ab 
on ab.dno =a.dno 
where a.sal > ab.avgsal



#Find The Department who do not have any employees


/*
These sub queries use 2 operators either EXISTS OR NOT EXISTS

EXISTS :
			It returns true if a sub query fetches at least one value. 
			If it  returns TRUE then outer query will display the result.

NOT EXISTS :
			It returns true if a sub query fetches no values at all. 
			If it returns TRUE then outer query will display the result.
	
*/


SELECT 
*
from 
dept d 
where exists (select * from emp e)

# Return the department who has employee
SELECT 
*
from 
dept d 
where exists (select * from emp e where e.dno=d.dno)


/*

Return the department who hasn't employee 

*/

SELECT 
*
from 
dept d 
where not exists (select * from emp e where e.dno=d.dno)


# Return the employee who has  department
select 
* 
from emp e 
where exists (select dno from dept d  where e.dno = d.dno)


