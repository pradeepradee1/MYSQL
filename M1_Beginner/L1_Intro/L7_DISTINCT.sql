# Keyword
# Distinct 
/*

*/
use mydb;

SELECT * FROM car c;

SELECT DISTINCT name  FROM car 
SELECT DISTINCT price  FROM car

SELECT DISTINCT name , price FROM car 



# Note : We can't do like this 

select 
	*,
	DISTINCT parent 
from tree
