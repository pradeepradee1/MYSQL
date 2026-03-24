/*
Questions :
                Identify continuous date gaps in billing logs for each customer 
between their first and last billing date.


Input:

customer_id | billing_date
------------|--------------
C001        | 2024-01-01
C001        | 2024-01-02
C001        | 2024-01-04
C001        | 2024-01-06

C002        | 2024-01-03
C002        | 2024-01-05



Output : 
+------------+------------+------------+
|customer_id |missing_from|missing_to |
+------------+------------+------------+
|C001        |2024-01-03  |2024-01-03 |
|C001        |2024-01-05  |2024-01-05 |
|C002        |2024-01-04  |2024-01-04 |
+------------+------------+------------+
*/



/*

CREATE or replace TABLE billing_logs (
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

WITH ordered_logs AS (
    SELECT 
        customer_id,
        billing_date,
        LAG(billing_date) OVER (
            PARTITION BY customer_id 
            ORDER BY billing_date
        ) AS prev_date
    FROM billing_logs
)

SELECT
    customer_id,
    DATE_ADD(prev_date, INTERVAL 1 DAY) AS missing_from,
    DATE_SUB(billing_date, INTERVAL 1 DAY) AS missing_to
FROM ordered_logs
WHERE DATEDIFF(billing_date, prev_date) > 1;