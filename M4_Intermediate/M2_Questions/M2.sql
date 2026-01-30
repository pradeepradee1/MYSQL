/*

Count (*) vs Count (1) vs Count (Coulmn name) In SQL
Note : This is aggregations functions it will same as rest of the functions

*/

/*
COUNT(*)

It will count how many rows are in the table
It does not care about columns, values, or nulls.


Example:
If a table has 5 rows,
COUNT(*) = 5

*/


/* COUNT(1) */

/*

This is almost the same as COUNT(*).
For every row, put a 1 and then count how many 1’s are there.

Since every row gets a 1, the result is the same as COUNT(*).

*/

/*
COUNT(column_name)

It will count how many rows are in the table and it focus on the not NULL values
It will excluded the NULL 

*/

/*
#Note 
*)  COUNT(1) is faster than COUNT(*) ?
        False — modern query optimizers treat them the same

*/