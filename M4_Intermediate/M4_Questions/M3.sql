/*

Count (*) vs Count (1) vs Count (Coulmn) vs Count (Distinct Coulmn) In SQL
Note : This is aggregations functions it will same as rest of the functions

*/

/*
COUNT(*)

It Counts all rows in the table, including NULL values.

Example:
If a table has 5 rows,
COUNT(*) = 5

*/


/* COUNT(1) */

/*

Same like COUNT(*)

*/

/*
COUNT(column_name)

It Counts only non-NULL values in that column
It will excluded the NULL 

*/

/*
COUNT(distinct column_name)

It Counts unique non-NULL values in the column
It will excluded the NULL 

*/

/*
#Note 
*)  COUNT(1) is faster than COUNT(*) ?
        False — modern query optimizers treat them the same

*/
