/*
Problem:
        calculate the total sales value for each product based on the price that was effective on the date of each order.


Note:

Real-world scenario

This is a Slowly Changing Dimension (SCD Type 2) or effective-dated lookup problem.

*/




/*

| product_id | price | price_date |
| ---------- | ----- | ---------- |
| 1          | 100   | 2025-01-01 |
| 1          | 120   | 2025-02-01 |
| 1          | 150   | 2025-03-01 |
| 2          | 200   | 2025-01-15 |
| 2          | 250   | 2025-02-10 |
| 3          | 300   | 2025-01-01 |


| order_id | order_date | product_id |
| -------- | ---------- | ---------- |
| 101      | 2025-01-10 | 1          |
| 102      | 2025-02-15 | 1          |
| 103      | 2025-03-05 | 1          |
| 104      | 2025-02-05 | 2          |
| 105      | 2025-03-01 | 2          |
| 106      | 2025-01-20 | 3          |


Expected Output

| product_id | total_sales_value |
| ---------- | ----------------- |
| 1          | 370               |
| 2          | 450               |
| 3          | 300               |


*/

/*


CREATE or replace TABLE products5 (
    product_id INT,
    price INT,
    price_date DATE
);

CREATE or replace TABLE orders7 (
    order_id INT,
    order_date DATE,
    product_id INT
);

INSERT INTO products5 
(product_id, price, price_date) 
VALUES
(1, 100, DATE '2025-01-01'),
(1, 120, DATE '2025-02-01'),
(1, 150, DATE '2025-03-01'),
(2, 200, DATE '2025-01-15'),
(2, 250, DATE '2025-02-10'),
(3, 300, DATE '2025-01-01');

INSERT INTO orders7 
(order_id, order_date, product_id) 
VALUES
(101, DATE '2025-01-10', 1),   -- price = 100
(102, DATE '2025-02-15', 1),   -- price = 120
(103, DATE '2025-03-05', 1),   -- price = 150
(104, DATE '2025-02-05', 2),   -- price = 200
(105, DATE '2025-03-01', 2),   -- price = 250
(106, DATE '2025-01-20', 3);   -- price = 300





*/


WITH latest_price AS (
    SELECT 
        o.order_id,
        o.order_date,
        o.product_id,
        p.price,
        p.price_date,
        ROW_NUMBER() OVER (PARTITION BY o.order_id ORDER BY p.price_date DESC) AS rn
    FROM orders7 o
    JOIN products5 p
        ON o.product_id = p.product_id
       AND p.price_date <= o.order_date
)

SELECT 
    product_id,
    SUM(price) AS total_sales_value
FROM latest_price
WHERE rn = 1
GROUP BY product_id
ORDER BY product_id;
