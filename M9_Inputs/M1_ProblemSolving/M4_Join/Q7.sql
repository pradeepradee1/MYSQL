/*

Problem: Calculate the total sales for each product, including a column showing the percentage of total sales that product represents.

*/

CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(50)
);

INSERT INTO products VALUES (1, 'Shirt');
INSERT INTO products VALUES (2, 'Pants');
INSERT INTO products VALUES (3, 'Shoes');

CREATE TABLE sales (
 sale_id INT,
 product_id INT,
 sale_amount DECIMAL(10,2)
);

INSERT INTO sales VALUES (1, 1, 100.00);
INSERT INTO sales VALUES (2, 1, 150.00);
INSERT INTO sales VALUES (3, 2, 200.00);
INSERT INTO sales VALUES (4, 2, 300.00);
INSERT INTO sales VALUES (5, 3, 250.00);
INSERT INTO sales VALUES (6, 3, 350.00);



SELECT p.product_name, SUM(s.sale_amount) AS total_sales, (SUM(s.sale_amount)/(
 SELECT SUM(sale_amount) FROM sales))*100 AS sales_percentage
FROM products p
INNER JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;
