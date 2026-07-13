

/*

1) Avoid Functions on Date Columns

SELECT *
FROM orders
WHERE YEAR(order_date) = 2025;

*) YEAR() is applied to every row.
*) The database cannot efficiently use an index on order_date.
*) It often results in a full table scan.

2) Use Date Ranges Instead

SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
  AND order_date < '2026-01-01';

*) Uses indexes efficiently.
*) Enables partition pruning if the table is partitioned by order_date.
*) Much faster on large tables.



*/


