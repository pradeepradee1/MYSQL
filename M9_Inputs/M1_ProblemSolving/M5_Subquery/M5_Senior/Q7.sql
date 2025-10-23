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



/*

CREATE TABLE billing_logs (
    customer_id VARCHAR(10),
    billing_date DATE
);


INSERT INTO billing_logs (customer_id, billing_date) VALUES
('C001', '2024-01-01'),
('C001', '2024-01-02'),
('C001', '2024-01-04'),
('C001', '2024-01-06'),
('C002', '2024-01-03'),
('C002', '2024-01-05');

*/

WITH RECURSIVE all_dates AS (
    SELECT MIN(billing_date) AS dt, MAX(billing_date) AS max_dt
    FROM billing_logs
    UNION ALL
    SELECT DATE_ADD(dt, INTERVAL 1 DAY), max_dt
    FROM all_dates
    WHERE dt < max_dt
),
customer_dates AS (
    SELECT DISTINCT customer_id,
           MIN(billing_date) OVER (PARTITION BY customer_id) AS min_dt,
           MAX(billing_date) OVER (PARTITION BY customer_id) AS max_dt
    FROM billing_logs
),
full_calendar AS (
    SELECT c.customer_id, d.dt
    FROM customer_dates c
    JOIN all_dates d 
      ON d.dt BETWEEN c.min_dt AND c.max_dt
)
SELECT 
    f.customer_id,
    f.dt AS missing_from,
    f.dt AS missing_to
FROM full_calendar f
LEFT JOIN billing_logs b 
  ON f.customer_id = b.customer_id AND f.dt = b.billing_date
WHERE b.billing_date IS NULL
ORDER BY f.customer_id, f.dt;


