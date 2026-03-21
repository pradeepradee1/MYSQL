/*
Frame Clause
	
	1)	Rows = position-based (row count)

	2)	Range = value-based (ORDER BY column)
			


							partition 
						|-----------------------|
						|						|						 
		N Preceding		|	______________      |   Unbounded preceding  
						|						|
						|						|
		current row 	|_______________________|  
 						|						|
						|						|
						|						|
		M following		|	______________      |  Unbounded following
						|						|
						|						|
						|-----------------------|


		Where N,M are Number Of Rows


*/

/*
when we should use the row between and range between in windows in SQL

*/

/*
1) ROWS BETWEEN (position-based)
*/

SELECT 
    sale_date,
    amount,
    AVG(amount) OVER (ORDER BY sale_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_avg
FROM sales;

/*

*) 2 previous rows + Take current row 
*) Always counts 3 rows max


*/


/*
2) RANGE BETWEEN (value-based)
*/



SELECT 
    sale_date,
    amount,
    SUM(amount) OVER (ORDER BY sale_date 
        RANGE BETWEEN INTERVAL '7 days' PRECEDING AND CURRENT ROW) AS rolling_sum
FROM sales;

/*
*) Includes all rows within last 7 days

*/