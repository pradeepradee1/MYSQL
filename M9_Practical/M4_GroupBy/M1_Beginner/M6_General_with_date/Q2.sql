/*
Problem :
        find the top 5 customers with the highest total transaction amount in the past 6 months.


CREATE or replace TABLE transactions1 (
 customer_id INT,
 transaction_amount DECIMAL(10,2),
 transaction_date DATE
);

INSERT INTO transactions1 VALUES (1, 100.00, '2025-05-01');
INSERT INTO transactions1 VALUES (2, 50.00, '2025-05-10');
INSERT INTO transactions1 VALUES (3, 75.00, '2025-06-05');
INSERT INTO transactions1 VALUES (1, 200.00, '2025-07-01');
INSERT INTO transactions1 VALUES (4, 150.00, '2025-08-02');
INSERT INTO transactions1 VALUES (3, 300.00, '2025-09-10');
INSERT INTO transactions1 VALUES (5, 500.00, '2025-09-15');
INSERT INTO transactions1 VALUES (1, 400.00, '2025-09-20');
INSERT INTO transactions1 VALUES (6, 250.00, '2025-10-01');

*/

SELECT 
        customer_id, SUM(transaction_amount) AS total_transaction_amount
FROM transactions2
WHERE transaction_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY customer_id
ORDER BY total_transaction_amount DESC
LIMIT 5;
