/*
Update Using Join
*/

use mydb;

select * FROM  emp_info

#Update With Join Pattern
#Update parent table values from child table values

UPDATE emp_info parenttable  
join emp_info_child childtable
ON parenttable.eid = childtable.eid 
SET parenttable.sal = childtable.sal;

#Update with multiple values

UPDATE emp_info parenttable  
join emp_info_child childtable
ON parenttable.eid = childtable.eid 
SET parenttable.sal = childtable.sal,
childtable.ename = parenttable.ename;



