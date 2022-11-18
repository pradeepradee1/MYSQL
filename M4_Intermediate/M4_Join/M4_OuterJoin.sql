/*
OuterJoin
		
			1) Left Join 
								: Return all the Records from left table and only matching data from right table.

			2) Right Join 
								: Return all the Records from right table and only matching data from left table.
			
			3) Full join 
								: matching data from both the tables
								: unmatching data from left tables
								: unmatching data from right tables
*/

#Note :
# There is no full outer join in MYSQL

use mydb;


#Left join
SELECT e.*,d.*
from emp e 
left join dept d on e.dno = d.dno 

#Right Join
SELECT e.*,d.*
from emp e 
right join dept d on e.dno = d.dno 

#Note	:
		#Full outer join doesn't work in MYSQL
		#Full Outer Join
SELECT e.*,d.*
from emp e 
full join dept d on e.dno = d.dno 
