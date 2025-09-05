/*

Problem: Find the top 5 customers with the highest total purchase amount, and their respective total purchase amount, for the month of January 2021.


*/

CREATE TABLE customers (
 id INT PRIMARY KEY,
 name VARCHAR(50)
);

CREATE TABLE orders (
 id INT PRIMARY KEY,
 customer_id INT,
 purchase_date DATE,
 purchase_amount DECIMAL(10,2)
);

INSERT INTO customers (id, name) VALUES
(1, 'John'),
(2, 'Sarah'),
(3, 'David'),
(4, 'Emily'),
(5, 'Michael');

INSERT INTO orders (id, customer_id, purchase_date, purchase_amount) VALUES
(1, 1, '2021-01-05', 100.50),
(2, 2, '2021-01-10', 75.20),
(3, 3, '2021-01-15', 200.00),
(4, 4, '2021-01-20', 150.75),
(5, 5, '2021-01-25', 300.00),
(6, 1, '2021-01-30', 50.00),
(7, 2, '2021-01-31', 125.30),
(8, 3, '2021-01-31', 75.50),
(9, 4, '2021-01-31', 250.00),
(10, 5, '2021-01-31', 175.00);






SELECT c.name AS customer_name, SUM(o.purchase_amount) AS total_purchase_amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE o.purchase_date BETWEEN '2021-01-01' AND '2021-01-31'
GROUP BY c.name
ORDER BY total_purchase_amount DESC
LIMIT 5;

