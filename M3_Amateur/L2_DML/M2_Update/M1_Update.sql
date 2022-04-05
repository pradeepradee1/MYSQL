/*
Update
*/

use mydb;

select * FROM  emp_info

#Update Single Record and Single Value
update emp_info 
set sal = 100 
where eid = 8

#Update all Record With Single Value 
update emp_info 
set sal = 100

#Update Single Record and  Multiple Value
update emp_info 
set sal = sal+(0.20*sal),desg='Senior Developer' 
where eid=112


#Bulk Update
UPDATE emp_info
SET ename =
	(
	CASE eid  
	WHEN 111 THEN 'A'
	WHEN 112 THEN 'B'
	WHEN 113 THEN 'C'
	END)
WHERE eid  IN (111,112,113);



#Update Values with Order By and LIMIT
select * FROM  emp_info

UPDATE emp_info SET ename='aa' 
ORDER BY sal  LIMIT 3


