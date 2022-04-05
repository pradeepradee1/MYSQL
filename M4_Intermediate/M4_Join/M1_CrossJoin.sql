/*
Joins:
		1) Cross Join
*/

# Cross Join
use mydb;

#Syntax

select col1, col2,...,coln
from table1, table2,....
where <cond>
order by col1, col2



select ename,sal,dname from emp,dept;



/*
Note:
In the above output marked combinations are valid and remaining are invalid according to
physical table data.
*/

