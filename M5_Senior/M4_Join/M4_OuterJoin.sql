/*

OuterJoin
		
			1) Left Join  
					*) Combine the two or more tables.
					*) matching data from both table
					*) Unmatching data from left table

			2) Right Join 
					*) Combine the two or more tables. 
					*) matching data from both table
					*) Unmatching data from right table
			
			3) Full join 
					*) Combine the two or more tables.
					*) matching data from both the tables
					*) unmatching data from left tables
					*) unmatching data from right tables

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

/*
#Note	:
		#Full outer join does not work in MYSQL
		#Full Outer Join

SELECT e.*,d.*
from emp e 
full join dept d on e.dno = d.dno 

*/