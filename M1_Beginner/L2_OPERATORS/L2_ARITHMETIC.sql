/*
Arithmetic Operators:
	1)	+
	2)	-
	3)	*
	4)	/ (OR) DIV (Keyword)
	5)  % (OR) MOD (Keyword)

*/

/*
DUAL table:
It is a system defined table which contains only one column to perform calculations
on users own data.
 */


use mydb;

SELECT 200+300 FROM DUAL;

SELECT (90000*10)/100 "10% of 90000" FROM DUAL;

SELECT 2000+(0.10*5000)-300 "After calculation" FROM DUAL;

SELECT price  "Basic price", (0.02*price) "TA" FROM car;

SELECT 10 / 2

SELECT 10 DIV 2

SELECT 9 % 2

SELECT 9 MOD 2

