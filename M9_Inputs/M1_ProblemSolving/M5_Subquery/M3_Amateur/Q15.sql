/*

Write an SQL query to calculate the total revenue loss due 
to discounts  applied to orders during a given promotional period, while keeping the query parameterized to allow flexible
date ranges and discount thresholds.

*/

CREATE TABLE orders_2 (
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


SET @start_date = '2024-01-01';
SET @end_date = '2024-01-31';
SET @discount_threshold = 10;


WITH promo_period_orders AS (
    SELECT 
        order_id,
        order_date,
        quantity,
        price_per_unit,
        discount_percentage,
        quantity * price_per_unit AS original_revenue,
        quantity * price_per_unit * (discount_percentage / 100) AS discount_loss
    FROM orders_2
    WHERE 
        order_date BETWEEN @start_date AND @end_date
        AND discount_percentage >= @discount_threshold
)
SELECT 
    COUNT(order_id) AS total_orders,
    SUM(original_revenue) AS total_revenue,
    SUM(discount_loss) AS total_discount_loss,
    SUM(original_revenue) - SUM(discount_loss) AS adjusted_revenue
FROM promo_period_orders;


