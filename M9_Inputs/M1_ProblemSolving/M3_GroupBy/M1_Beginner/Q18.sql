/*

Problem: Find the top 5 most frequent customers (by number of orders) for each month in the past year.


*/


CREATE TABLE customers ( 
 customer_id INT, 
 name VARCHAR(50), 
); 

CREATE TABLE orders ( 
 order_id INT, 
 customer_id INT, 
 order_date DATE, 
);

INSERT INTO customers (customer_id, name) 
VALUES (1, 'John'), (2, 'Jane'), (3, 'Bob'), (4, 'Alice'), (5, 'Mike');

INSERT INTO orders (order_id, customer_id, order_date) 
VALUES (1, 1, '2020-01-01'), (2, 2, '2020-01-02'), (3, 3, '2020-01-03'), (4, 4, '2020-01-04'), (5, 5, '2020-01-05'), 
(6, 1, '2020-02-01'), (7, 2, '2020-02-02'), (8, 3, '2020-02-03'), (9, 4, '2020-02-04'), (10, 5, '2020-02-05'), 
(11, 1, '2020-03-01'), (12, 2, '2020-03-02'), (13, 3, '2020-03-03'), (14, 4, '2020-03-04'), (15, 5, '2020-03-05'), 
... 
(361, 1, '2020-12-01'), (362, 2, '2020-12-02'), (363, 3, '2020-12-03'), (364, 4, '2020-12-04'), (365, 5, '2020-12-05');




SELECT * FROM ( 
 SELECT c.name, COUNT(*) AS num_orders, MONTH(o.order_date) AS month 
 FROM customers c 
 INNER JOIN orders o ON c.customer_id = o.customer_id 
 WHERE o.order_date >= DATEADD(MONTH, -12, GETDATE()) 
 GROUP BY c.name, MONTH(o.order_date) 
 ORDER BY num_orders DESC 
) AS t 
WHERE num_orders <= 5;
