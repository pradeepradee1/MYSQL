#CAST
SELECT CAST("2017-08-29" AS DATE);
SELECT CAST(150 AS CHAR);

#COALESCE
SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com');

#IFNULL similar to coalesce it Supports two parameter 
SELECT IFNULL(NULL,'W3Schools.com');
SELECT IFNULL(NULL, "W3Schools.com");
SELECT IFNULL("Hello", "W3Schools.com");
SELECT IFNULL(NULL, 500);

#25=25 then NULL
SELECT NULLIF(25,25);














