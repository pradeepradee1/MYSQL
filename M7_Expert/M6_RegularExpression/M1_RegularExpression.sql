
SELECT * from regualr_emp e

#Starts with a
SELECT * FROM regualr_emp 
WHERE ename REGEXP '^a';

#Starts with a or d
SELECT * FROM regualr_emp 
WHERE ename REGEXP '^[ad]';


#Not Start with a
SELECT * FROM regualr_emp 
WHERE ename not REGEXP '^a';

SELECT * FROM regualr_emp 
WHERE ename not REGEXP '^[ad]';


#OR

SELECT * FROM regualr_emp 
WHERE ename REGEXP '[^a]'


#Ends with j
SELECT * FROM regualr_emp 
WHERE ename REGEXP 'j$';

#String start with a or d and end with j
SELECT * FROM regualr_emp 
WHERE ename REGEXP '^[ad]|[j]$'


#String Should follow pattern sequences
SELECT * FROM regualr_emp 
WHERE ename  REGEXP 'pra';	

#string contain p or r or a 
SELECT * FROM regualr_emp 
WHERE ename REGEXP '[pra]' ;


#String Should Contain aas in sequences or b
SELECT * FROM regualr_emp 
WHERE ename REGEXP 'b|aas' ;


