/*

Find all customers who have placed orders in at least 3 different product categories in the same calendar month.


Context: You're working at an online fashion retailer like Myntra. The marketing team wants to identify customers who purchased from 3 or more 
different product categories in the same month to send them personalized offers.


*/
CREATE TABLE customers (
 customer_id INT,
 customer_name VARCHAR(100)
);

CREATE TABLE orders (
 order_id INT,
 customer_id INT,
 order_date DATE,
 category VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Gowtham'), (2, 'Sneha'), (3, 'Arjun');

INSERT INTO orders VALUES
(101, 1, '2024-04-05', 'Shirts'),
(102, 1, '2024-04-15', 'Shoes'),
(103, 1, '2024-04-22', 'Watches'),
(104, 2, '2024-04-10', 'Shirts'),
(105, 2, '2024-05-11', 'Shirts'),
(106, 3, '2024-04-03', 'Shoes'),
(107, 3, '2024-04-14', 'Shoes'),
(108, 3, '2024-04-29', 'Shoes');


SELECT c.customer_id, c.customer_name
FROM customers c
JOIN (
 SELECT customer_id, EXTRACT(YEAR FROM order_date) AS yr,
 EXTRACT(MONTH FROM order_date) AS mon,
 COUNT(DISTINCT category) AS category_count
 FROM orders
 GROUP BY customer_id, yr, mon
 HAVING COUNT(DISTINCT category) >= 3
) o ON c.customer_id = o.customer_id;
