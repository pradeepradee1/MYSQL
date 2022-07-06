/*
SPECIAL OPERATORS
	BETWEEN
	IN
	IS NULL
	LIKE
*/
USE mydb
# 1)
SELECT * FROM car c WHERE c.price BETWEEN 0 AND 301

# 2)
SELECT * FROM car c WHERE c.price IN (300,1)

# 3)
SELECT * FROM car c WHERE c.name  IS NULL  


# 4)
/*
	_  (underscore) represents any single chars
	%  represents any groups of chars
	
 */
SELECT * FROM car c WHERE c.name LIKE '%rt%'


SELECT * FROM car c WHERE c.name LIKE '%r%'

SELECT * FROM car c WHERE c.name LIKE '____nd'

SELECT * FROM car c WHERE c.name LIKE 'f%rst'



/*
NOT 
	NOT BETWEEN
	NOT IN
	NOT LIKE
	IS NOT NULL
 */

# 1)
SELECT * FROM car c WHERE c.price NOT BETWEEN 1 AND 500

# 2)
SELECT * FROM car c WHERE c.price NOT IN (1,300)

# 3)
SELECT * FROM car c WHERE c.name NOT LIKE '____nd'

# 4)
SELECT * FROM car c WHERE c.name  IS NOT NULL


