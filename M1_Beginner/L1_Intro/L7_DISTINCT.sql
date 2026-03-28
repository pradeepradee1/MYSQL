# Keyword
# Distinct 
/*

*/
use mydb;

SELECT * FROM car c;

SELECT DISTINCT name  FROM car 
SELECT DISTINCT price  FROM car


/*
Distinct for two attributes
*/
	
SELECT DISTINCT name , price FROM car 

SELECT DISTINCT * FROM tablename;

/*
# Note : We can't do like this 
*/


select *,DISTINCT parent from tree

SELECT name DISTINCT FROM tablename