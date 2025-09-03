/*

Identify continuous date gaps in billing logs for each customer between their first and last billing date.

data = [
 ("C001", "2024-01-01"),
 ("C001", "2024-01-02"),
 ("C001", "2024-01-04"),
 ("C001", "2024-01-06"),
 ("C002", "2024-01-03"),
 ("C002", "2024-01-05"),
]



Output : 
+------------+------------+------------+
|customer_id |missing_from|missing_to |
+------------+------------+------------+
|C001    |2024-01-03 |2024-01-03 |
|C001    |2024-01-05 |2024-01-05 |
|C002    |2024-01-04 |2024-01-04 |
+------------+------------+------------+
*/


-- Generate a series of dates between MIN and MAX billing date per customer
WITH RECURSIVE date_range AS (
    SELECT customer_id, MIN(billing_date) AS start_date, MAX(billing_date) AS end_date
    FROM billing_logs
    GROUP BY customer_id
    UNION ALL
    SELECT customer_id, DATE_ADD(start_date, INTERVAL 1 DAY), end_date
    FROM date_range
    WHERE start_date < end_date
)
SELECT 
    d.customer_id,
    d.start_date AS missing_from,
    d.start_date AS missing_to
FROM date_range d
LEFT JOIN billing_logs b
    ON d.customer_id = b.customer_id
   AND d.start_date = b.billing_date
WHERE b.billing_date IS NULL
ORDER BY customer_id, missing_from;
