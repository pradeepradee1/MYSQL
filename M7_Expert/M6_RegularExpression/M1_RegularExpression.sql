
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

#OR

SELECT * FROM regualr_emp 
WHERE ename REGEXP '[^a]'


#Ends with j
SELECT * FROM regualr_emp 
WHERE ename REGEXP 'j$';

#String start with a or d and end with j
SELECT * FROM regualr_emp 
WHERE ename REGEXP '^[ad]|[j]$'


#String Should Contain aad and follow sequences
SELECT * FROM regualr_emp 
WHERE ename  REGEXP 'aad';


#string contain a or a or d 
SELECT * FROM regualr_emp 
WHERE ename REGEXP '[aad]' ;


#String Should Contain aas in sequences or b
SELECT * FROM regualr_emp 
WHERE ename REGEXP 'b|aas' ;



#String has to follow d to e and followed by the p
SELECT * FROM regualr_emp 
WHERE ename REGEXP '[d-e].[p]' ;