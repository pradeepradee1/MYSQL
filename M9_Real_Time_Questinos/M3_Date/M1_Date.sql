CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(100),
    created_at DATETIME,
    INDEX idx_created_at (created_at)
);


# This will affect the performance

SELECT *
FROM orders
WHERE YEAR(created_at) = 2024;


# This is good performance

SELECT *
FROM orders
WHERE created_at >= '2024-01-01'
AND created_at < '2025-01-01';


