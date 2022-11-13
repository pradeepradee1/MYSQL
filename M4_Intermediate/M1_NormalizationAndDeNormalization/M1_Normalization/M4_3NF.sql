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
			when one column depends on a column which is not primary key
			non-prime key depends on non-prime key
			non-prime key can take null values

	EX:
		Third_NF table total_marks (non-prime) depends on exam_name (non-prime)
*/


