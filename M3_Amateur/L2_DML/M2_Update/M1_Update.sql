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


#Update with case
UPDATE iodku 
SET name =
(
CASE id  
WHEN 1 THEN 'A'
WHEN 2 THEN 'B'
WHEN 4 THEN 'C'
else "X"
END)
WHERE id  IN (1,2,4,5);



#Update with Order By and LIMIT
select * FROM  iodku

UPDATE iodku 
SET misc=1000 
ORDER BY misc  
LIMIT 3





