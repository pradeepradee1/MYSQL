/*
Update
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
parenttable.ename = childtable.ename;



#Update Mutiple Table

UPDATE emp_info, emp_info_child
SET emp_info_child.sal  = emp_info_child.sal - 5,
emp_info.sal  = emp_info.sal + 5
WHERE emp_info.eid  = emp_info_child.eid 
AND emp_info_child.eid  = 111;


