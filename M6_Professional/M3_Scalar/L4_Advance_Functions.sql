SELECT BIN(15);

SELECT BINARY "W3Schools.com";

#CAST
	SELECT CAST("2017-08-29" AS DATE);
	SELECT CAST(150 AS CHAR);

SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com');

#CONNECTION_ID = Return the unique connection ID for the current connection:
SELECT CONNECTION_ID();

#CONV = Convert a number from numeric base system 10 to numeric base system 2:
SELECT CONV(15, 10, 2);

SELECT CONVERT("2017-08-29", DATE);

SELECT CURRENT_USER();

SELECT DATABASE();

#IFNULL : Return the specified value IF the expression is NULL, otherwise return the expression:
	SELECT IFNULL(NULL, "W3Schools.com");
	SELECT IFNULL("Hello", "W3Schools.com");
	SELECT IFNULL(NULL, 500);

SELECT ISNULL(NULL);


SELECT LAST_INSERT_ID();

SELECT NULLIF(25, 25);

SELECT SESSION_USER();

SELECT SYSTEM_USER();

SELECT USER();

SELECT VERSION();













