
SELECT * from regualr_emp e

#Starts with X
SELECT * FROM regualr_emp 
WHERE ename REGEXP '^X'

#Not Start with X
SELECT * FROM regualr_emp 
WHERE ename not REGEXP '^X'

#Ends with 300
SELECT * FROM regualr_emp 
WHERE sal  REGEXP '300$'

#Contains with a
SELECT * FROM regualr_emp 
WHERE ename REGEXP 'a' 

#Start with A or B or C
SELECT * FROM regualr_emp 
WHERE ename REGEXP '^[ABC]'

#Start with A , B , C [OR] Ends with v or c
SELECT * FROM regualr_emp 
WHERE ename REGEXP '^[ABC]|[vc]$'

#Count start with A
SELECT 
ename, ename REGEXP '^A' as matching 
FROM regualr_emp

#Count start with A
SELECT 
ename, 
IF(ename REGEXP '^A', 'matches ^N', 'does not match ^N') as matching
FROM regualr_emp
