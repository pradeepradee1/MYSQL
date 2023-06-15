/*
ASSIGNMENTS
	=
*/


USE mydb

SELECT * FROM car c
WHERE c.name = 'first'


/*
NOT 
	!=
	<>
*/

SELECT * FROM car c
WHERE c.name != 'first'


SELECT * FROM car c
WHERE c.name <> 'first'


/*
	<=> is Null Safe Operator : It will be used in while joining with null values
*/

