/*
Sub Query	:
				1) A Query with in other query is known as sub_query
				2) Sub Query are preferable to display output from one table and 
				   having an input value from other table

*/
#Syntax:

select ..
from table
where [=/IN/exists/not exists]
(select ..... 
from table
where [=/IN/exits/not exists]
(select.......).....);

#Execution process:
#					Here the execution process is always from innermost query to the outermost.

#Outer query<-----------o/p<------------Inner query<----------o/p<---------Inner query

/*
TYPES OF SUBQUERIES :

1) Single row subquery : 

					A sub query which returns single output value.
					In this case in between the outer and inner queries we can use = operator.

2) 2) Multi row sub query :
					
					A sub query which returns multiple output values.
					In this case in between the outer and inner queries we can use IN operator.
					
 **/

use mydb;

select * 
from dept
where dno in 
(
select dno from emp e where e.ename = 'X'
)

#Alternate Query Using Join(Equi Join)
select d.*
from emp e , dept d 
where e.dno = d.dno and e.ename = 'X' 

select *
from emp 
where dno = (
select dno from dept d where d.dname='Productions'
)

select *
from emp 
where dno = (
select dno  from dept d where dname = 'Finance'
)


select * 
from prod_DTLS pd 
where cmpId = (
select cmpId from comp_dtls  where cmpName = 'sony'
)

select * 
from prod_DTLS pd 
where cmpId in (
select cmpId from comp_dtls  where cmpName not in ('sony','semantic')
)


