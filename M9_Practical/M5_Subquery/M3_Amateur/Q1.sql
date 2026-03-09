/*

write an SQL query to calculate the total revenue loss caused by 
discounts applied to orders during a promotional period

*/

CREATE or replace TABLE orders_2 (
    order_id BIGINT,
    order_date DATE,
    product_id BIGINT,
    quantity BIGINT,
    price_per_unit FLOAT,
    discount_percentage FLOAT
);


INSERT INTO orders_2 VALUES
(1, '2024-01-10', 101, 2, 500, 10),
(2, '2024-01-15', 102, 1, 1000, 20),
(3, '2024-01-18', 103, 3, 200, 0),
(4, '2024-01-20', 104, 5, 150, 15),
(5, '2024-02-01', 105, 2, 300, 5),
(6, '2024-02-10', 101, 1, 500, 25);




SELECT 
    SUM(quantity * price_per_unit * (discount_percentage / 100)) AS total_revenue_loss
FROM orders_2
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31'
AND discount_percentage >= 10;

