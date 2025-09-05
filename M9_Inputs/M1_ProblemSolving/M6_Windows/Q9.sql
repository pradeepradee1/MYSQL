/*

 Find the top 3 best-selling products

Find the top 3 best-selling products in each category with their total sales and percentage contribution


*/

CREATE TABLE products (product_id INT64, product_name STRING, category STRING); 

INSERT INTO products VALUES (101, 'Laptop', 'Electronics'), (102, 'Phone', 'Electronics'), (103, 'Desk', 'Furniture'), (104, 'Chair', 'Furniture'), (105, 'Book', 'Books'); 

CREATE TABLE transactions (transaction_id INT64, product_id INT64, quantity INT64, price_per_unit FLOAT64); 

INSERT INTO transactions VALUES (1, 101, 10, 1000), (2, 102, 20, 500), (3, 103, 5, 200), (4, 104, 15, 150), (5, 105, 50, 20), (6, 102, 10, 500), (7, 101, 5, 1000), (8, 103, 10, 200), (9, 104, 20, 150), (10, 105, 30, 20);





WITH ranked_products AS (
 SELECT 
 p.category, 
 p.product_name, 
 SUM(t.quantity * t.price_per_unit) AS total_sales, 
 RANK() OVER (PARTITION BY p.category ORDER BY SUM(t.quantity * t.price_per_unit) DESC) AS rank,
 ROUND(SUM(t.quantity * t.price_per_unit) * 100.0 / SUM(SUM(t.quantity * t.price_per_unit)) OVER (PARTITION BY p.category), 2) AS contribution_percentage
 FROM 
 transactions t 
 JOIN 
 products p ON t.product_id = p.product_id 
 GROUP BY 
 p.category, p.product_name
)
SELECT 
 category, 
 product_name, 
 total_sales, 
 contribution_percentage 
FROM 
 ranked_products 
WHERE 
 rank <= 3;
