#String has to follow d to e and followed by the p
SELECT * FROM regualr_emp 
WHERE ename REGEXP '[d-e][p]' ;

SELECT * FROM regualr_emp 
WHERE ename REGEXP '[a-d][e]{2}' ;
