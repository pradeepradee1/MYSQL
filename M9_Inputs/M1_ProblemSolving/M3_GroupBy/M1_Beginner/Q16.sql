/*

Problem: Find the top 3 products with the highest sales in the past week, including the total sales for each product.


*/

CREATE TABLE sales (
 id INT,
 product_id INT,
 amount DECIMAL(10,2),
 date DATE
);

INSERT INTO products VALUES
(1, 'Product A', 'Electronics'),
(2, 'Product B', 'Clothing'),
(3, 'Product C', 'Home Goods'),
(4, 'Product D', 'Beauty');

INSERT INTO sales VALUES
(1, 1, 100.00, '2020-10-01'),
(2, 2, 50.00, '2020-10-02'),
(3, 3, 75.00, '2020-10-03'),
(4, 1, 150.00, '2020-10-04'),
(5, 4, 25.00, '2020-10-05'),
(6, 1, 200.00, '2020-10-06'),
(7, 3, 100.00, '2020-10-07'),
(8, 2, 75.00, '2020-10-08'),
(9, 4, 50.00, '2020-10-09'),
(10, 2, 125.00, '2020-10-10'),
(11, 3, 150.00, '2020-10-11'),
(12, 1, 75.00, '2020-10-12'),
(13, 2, 100.00, '2020-10-13'),
(14, 4, 200.00, '2020-10-14'),
(15, 3, 50.00, '2020-10-15'),
(16, 1, 125.00, '2020-10-16'),
(17, 2, 150.00, '2020-10-17'),
(18, 3, 75.00, '2020-10-18'),
(19, 4, 100.00, '2020-10-19'),
(20, 1, 50.00, '2020-10-20');



SELECT p.name, SUM(s.amount) AS total_sales
FROM products p
JOIN sales s ON p.id = s.product_id
WHERE s.date BETWEEN DATEADD(day, -6, GETDATE()) AND GETDATE()
GROUP BY p.id, p.name
ORDER BY total_sales DESC
LIMIT 3;
