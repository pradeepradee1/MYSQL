/*

Count (*) vs Count (1) vs Count (Coulmn name) In SQL


*/

/* COUNT(*) */

/*

Think of it like:
👉 "Tell me how many rows are in the table."

It does not care about columns, values, or nulls.
Just counts every row.

📌 Example:
If a table has 5 rows,
COUNT(*) = 5
*/


/* COUNT(1) */
/*
This is almost the same as COUNT(*).
👉 "For every row, put a 1 and then count how many 1’s are there."

Since every row gets a 1, the result is the same as COUNT(*).

📌 Example:
If a table has 5 rows,
COUNT(1) = 5
*/

/*
3️⃣ COUNT(column_name)

👉 "Count only the rows where this column has some value (not NULL)."

So if the column is empty (NULL) in some rows, those rows will not be counted.

📌 Example:
If a table has 5 rows, but in the column "salary" only 3 rows have values and 2 rows are empty (NULL):
COUNT(salary) = 3
*/