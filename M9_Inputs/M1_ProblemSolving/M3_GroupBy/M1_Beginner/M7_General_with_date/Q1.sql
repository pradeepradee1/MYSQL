/*

You are given a table of customer orders with the following columns: order_id, customer_id, order_date, and order_amount. 
Write a query to calculate the total order amount for each customer in the year 2020, including customers with no orders in 2020.

*/

CREATE TABLE orders4 (
 order_id INT PRIMARY KEY,
 customer_id INT NOT NULL,
 order_date DATE NOT NULL,
 order_amount DECIMAL(10,2) NOT NULL
);

INSERT INTO orders4 (order_id, customer_id, order_date, order_amount)
VALUES 
 (1, 123, '2020-02-15', 100.00),
 (2, 456, '2020-05-20', 200.00),
 (3, 789, '2021-01-10', 300.00),
 (4, 123, '2019-12-31', 150.00),
 (5, 456, '2020-11-05', 50.00),
 (6, 789, '2020-09-15', 75.00);


SELECT customer_id, SUM(order_amount) AS total_amount
FROM orders4
WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY customer_id
ORDER BY customer_id;
