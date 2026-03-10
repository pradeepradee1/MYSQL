/*

Identify customers who placed more than 5 orders but gave ratings for only one order in the 
last 6 months.


*/

CREATE or replace TABLE zomato_orders (
 order_id INT,
 customer_id INT,
 customer_name VARCHAR(50),
 order_date DATE
);

CREATE or replace TABLE zomato_ratings (
 rating_id INT,
 customer_id INT,
 rating INT,
 rating_date DATE
);

INSERT INTO zomato_orders VALUES
(1, 1001, 'Gowtham', '2025-01-01'),
(2, 1001, 'Gowtham', '2025-01-10'),
(3, 1001, 'Gowtham', '2025-01-20'),
(4, 1001, 'Gowtham', '2025-02-01'),
(5, 1001, 'Gowtham', '2025-02-15'),
(6, 1001, 'Gowtham', '2025-02-25');

INSERT INTO zomato_ratings VALUES
(1, 1001, 4, '2025-01-10');


SELECT 
    o.customer_id
FROM (
    SELECT customer_id, COUNT(*) AS total_orders
    FROM zomato_orders
    WHERE order_date >= DATE_SUB('2025-03-01', INTERVAL 6 MONTH)
    GROUP BY customer_id
) o
LEFT JOIN (
    SELECT customer_id, COUNT(*) AS total_ratings
    FROM zomato_ratings
    WHERE rating_date >= DATE_SUB('2025-03-01', INTERVAL 6 MONTH)
    GROUP BY customer_id
) r
ON o.customer_id = r.customer_id
WHERE o.total_orders > 5
  AND COALESCE(r.total_ratings, 0) = 1;








WITH order_counts AS (
 SELECT customer_id, COUNT(*) AS total_orders
 FROM zomato_orders
 WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
 GROUP BY customer_id
),
rating_counts AS (
 SELECT customer_id, COUNT(*) AS total_ratings
 FROM zomato_ratings
 WHERE rating_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
 GROUP BY customer_id
)
SELECT o.customer_id
FROM order_counts o
LEFT JOIN rating_counts r ON o.customer_id = r.customer_id
WHERE o.total_orders > 5 AND COALESCE(r.total_ratings, 0) = 1;




