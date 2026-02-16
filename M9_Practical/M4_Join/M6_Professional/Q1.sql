/*

You are given a products table where a new row is inserted every time the price of a product changes. 
Additionally, there is a transaction table containing details such as order_date and product_id for each order.


Write an SQL query to calculate the total sales value for each product, considering the cost of the product at the time 
of the order date, display the output in ascending order of the product_id.
 
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

-- Product price history
INSERT INTO products5 
(product_id, price, price_date) 
VALUES
(1, 100, DATE '2025-01-01'),
(1, 120, DATE '2025-02-01'),
(1, 150, DATE '2025-03-01'),
(2, 200, DATE '2025-01-15'),
(2, 250, DATE '2025-02-10'),
(3, 300, DATE '2025-01-01');

-- Orders placed on different dates
INSERT INTO orders7 
(order_id, order_date, product_id) 
VALUES
(101, DATE '2025-01-10', 1),   -- price = 100
(102, DATE '2025-02-15', 1),   -- price = 120
(103, DATE '2025-03-05', 1),   -- price = 150
(104, DATE '2025-02-05', 2),   -- price = 200
(105, DATE '2025-03-01', 2),   -- price = 250
(106, DATE '2025-01-20', 3);   -- price = 300


Expected Output :

| product_id | total_sales_value |
| ---------- | ----------------- |
| 1          | 370               |
| 2          | 450               |
| 3          | 300               |



*/


SELECT 
    o.product_id,
    SUM(p.price) AS total_sales_value
FROM 
orders7 o JOIN products5 p ON p.product_id = o.product_id
AND p.price_date = (
    SELECT MAX(p2.price_date)
    FROM products5 p2
    WHERE p2.product_id = o.product_id
    AND p2.price_date <= o.order_date
     )
GROUP BY o.product_id
ORDER BY o.product_id;

