/*

Given a table "orders" with columns order_id, customer_id, order_date, and total_amount, 
write a query to rank the top 5 customers 
based on their total amount spent in the last 6 months.


CREATE TABLE orders3 (
 order_id INT,
 customer_id INT,
 order_date DATE,
 total_amount DECIMAL(10,2)
);

INSERT INTO orders3 (order_id, customer_id, order_date, total_amount)
VALUES 
(1, 123, '2025-01-01', 100),
 (2, 456, '2025-02-02', 200),
 (3, 123, '2025-03-03', 300),
 (4, 789, '2025-04-04', 400),
 (5, 456, '2025-05-05', 500),
 (6, 123, '2025-06-06', 600),
 (7, 456, '2025-07-07', 700),
 (8, 789, '2025-08-08', 800),
 (9, 123, '2025-09-09', 900),
 (10, 456, '2025-10-10', 1000);

*/

SELECT 
    customer_id,
    SUM(total_amount) AS total_spent
FROM 
    orders3
WHERE 
    order_date >= CURDATE() - INTERVAL 6 MONTH
GROUP BY 
    customer_id
ORDER BY 
    total_spent DESC
LIMIT 5;
