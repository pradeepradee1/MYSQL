#Statements

#PREPARE prepares a statement for execution
#EXECUTE executes a prepared statement
#DEALLOCATE PREPARE releases a prepared statement

SET @s = 'SELECT SQRT(POW(?,2) + POW(?,2)) AS hypotenuse';
SET @a = 6;
SET @b = 8;

PREPARE stmt2 FROM @s;

EXECUTE stmt2 USING @a, @b;

DEALLOCATE PREPARE stmt2;

