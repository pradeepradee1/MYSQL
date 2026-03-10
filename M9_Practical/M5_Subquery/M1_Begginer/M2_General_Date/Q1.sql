/*

Problem Statement

find customers
who placed at least one order in January 
but did not place any orders in February.

*/

/*

CREATE or replace TABLE orders_1 (
 order_id INT,
 customer_id INT,
 order_date DATE
);

INSERT INTO orders_1 VALUES
(1, 101, '2024-01-05'),
(2, 102, '2024-01-10'),
(3, 103, '2024-01-15'),
(4, 101, '2024-02-03'),
(5, 104, '2024-01-20'),
(6, 105, '2024-01-25'),
(7, 106, '2024-02-05'),
(8, 102, '2024-02-10'),
(9, 107, '2024-01-30'),
(10, 108, '2024-03-01');


*/


SELECT 
    DISTINCT customer_id
FROM orders_1
WHERE EXTRACT(MONTH FROM order_date) = 1 AND 
customer_id NOT IN ( SELECT customer_id FROM orders WHERE EXTRACT(MONTH FROM order_date) = 2 );
