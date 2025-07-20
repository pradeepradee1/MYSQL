#3NF 
use mydb;

SELECT * from Third_NF ;
SELECT * from Third_NF_1 ;
SELECT * from Third_NF_2 ;

/*
3NF:
	1) Table Has to be follow 2nd NF
	2) There should not be transitive dependency
*/

/*
	What is transitive dependency ?
		Non-Primary Key columns should not depend among themselves

	EX:
		Third_NF table total_marks (non-prime) depends on exam_name (non-prime)
*/


