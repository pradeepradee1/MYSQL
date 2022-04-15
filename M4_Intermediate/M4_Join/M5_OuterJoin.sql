/*
OuterJoin
		
			1) Left  Join 
								: all the data from left table and only matched data from right table.
			2) Right Join 
								: all the data from right table and only matched data from left table.
			3) Full join 
								: matched data from both the tables
								: unmatched data from left tables
								: unmatched data from right tables
*/

#Note :
# There is no full outer join in MYSQL

use mydb;

#syntax:
select col1, col2,
from 
table_1 [left join / right join / full join] table_2
ON table1.pk=table2.fk;



#Left join
SELECT e.*,d.*
from emp e 
left join dept d on e.dno = d.dno 

#Right Join
SELECT e.*,d.*
from emp e 
right join dept d on e.dno = d.dno 


#Full outer join doesn't work in MYSQL
#Full Outer Join
SELECT e.*,d.*
from emp e 
full join dept d on e.dno = d.dno 
