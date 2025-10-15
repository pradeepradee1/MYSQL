/*

Problem: Find the top 3 products with the highest sales in the past week, including the total sales for each product.


CREATE TABLE sales_1 (
 id INT,
 product_id INT,
 amount DECIMAL(10,2),
 date DATE
);

CREATE TABLE products_1 (
product_id INT,
product VARCHAR(30),
product_name VARCHAR(30)
);

INSERT INTO products_1 VALUES
(1, 'Product A', 'Electronics'),
(2, 'Product B', 'Clothing'),
(3, 'Product C', 'Home Goods'),
(4, 'Product D', 'Beauty');

INSERT INTO sales VALUES
(1, 1, 100.00, '2025-10-01'),
(2, 2, 50.00, '2025-10-02'),
(3, 3, 75.00, '2025-10-03'),
(4, 1, 150.00, '2025-10-04'),
(5, 4, 25.00, '2025-10-05'),
(6, 1, 200.00, '2025-10-06'),
(7, 3, 100.00, '2025-10-07'),
(8, 2, 75.00, '2025-10-08'),
(9, 4, 50.00, '2025-10-09'),
(10, 2, 125.00, '2025-10-10'),
(11, 3, 150.00, '2025-10-11'),
(12, 1, 75.00, '2025-10-12'),
(13, 2, 100.00, '2025-10-13'),
(14, 4, 200.00, '2025-10-14'),
(15, 3, 50.00, '2025-10-15'),
(16, 1, 125.00, '2025-10-16'),
(17, 2, 150.00, '2025-10-17'),
(18, 3, 75.00, '2025-10-18'),
(19, 4, 100.00, '2025-10-19'),
(20, 1, 50.00, '2025-10-20');

*/



SELECT 
    p.product_id,
    p.product,
    p.product_name,
    SUM(s.amount) AS total_sales
FROM 
    products_1 p
JOIN 
    sales_1 s ON p.product_id = s.product_id
WHERE 
    s.date >= CURDATE() - INTERVAL 7 DAY
GROUP BY 
    p.product_id, p.product, p.product_name
ORDER BY 
    total_sales DESC
LIMIT 3;


