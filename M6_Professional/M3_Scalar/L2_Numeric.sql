SELECT ABS(-243.5);

SELECT ACOS(0.25);

SELECT ASIN(0.25);

SELECT ATAN(2.5);

SELECT ATAN2(0.50, 1);

SELECT AVG(Price) AS AveragePrice FROM Products;

SELECT CEIL(25.75);

SELECT CEILING(25.75);

SELECT COS(2);

SELECT COT(6);

SELECT COUNT(c.Cno) AS Customer FROM customer c ;

SELECT DEGREES(1.5);

SELECT 10 DIV 5;

SELECT EXP(1);

SELECT FLOOR(25.75);

SELECT GREATEST(3, 12, 34, 8, 25);

SELECT LEAST(3, 12, 34, 8, 25);

SELECT LN(2);

SELECT LOG(2);

SELECT LOG10(2);

SELECT LOG2(6);

SELECT MAX(c.Cno) AS CustomerNumber FROM customer c ;

SELECT MIN(c.Cno) AS CustomerNumber FROM customer c ;

SELECT MOD(18, 4);

SELECT PI();

SELECT POW(4, 2);

SELECT POWER(4, 2);

SELECT RADIANS(180);

SELECT RAND();

SELECT ROUND(135.375, 2);

#SUGN = 
#		If number > 0, it returns 1
#		If number = 0, it returns 0
#		If number < 0, it returns -1

SELECT SIGN(255.5);

SELECT SIN(2);

SELECT SQRT(64);

SELECT sum(c.Cno) AS CustomerNumber FROM customer c ;

SELECT TAN(1.75);

#Truncate = Return a number truncated to 2 decimal places:
SELECT TRUNCATE(135.375, 2);





