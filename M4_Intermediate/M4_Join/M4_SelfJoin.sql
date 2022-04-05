/*
Self Join
*/

use mydb;

select *
from emp e1, emp e2
where e1.ename='A'
and
e1.sal=e2.sal;

