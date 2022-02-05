/*
SPECIAL OPERATORS
	BETWEEN
	IN
	IS NULL
	LIKE
*/
USE mydatabase
# 1)
SELECT * FROM CAR c WHERE c.price BETWEEN 5000 AND 7000

# 2)
SELECT * FROM CAR c WHERE c.price IN (5000,7000)

# 3)
SELECT * FROM CAR2 c WHERE c.`group` IS NULL  


# 4)
/*
	_  (underscore) represents anyone char
	%  represents any number of chars
	
 */
SELECT * FROM CAR c WHERE c.name LIKE '%A4%'
SELECT * FROM CAR c WHERE c.name LIKE '_____A2'
SELECT * FROM CAR c WHERE c.name LIKE 'A%A4'



/*
NOT 
	NOT BETWEEN
	NOT IN
	NOT LIKE
	IS NOT NULL
 */

# 1)
SELECT * FROM CAR c WHERE c.price NOT BETWEEN 5000 AND 7000

# 2)
SELECT * FROM CAR c WHERE c.price NOT IN (5000,7000)

# 3)
SELECT * FROM CAR c WHERE c.name NOT LIKE '_____A2'

# 4)
SELECT * FROM CAR2 c WHERE c.`group` IS NOT NULL


