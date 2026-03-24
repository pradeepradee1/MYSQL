/*

Problem: 
Find the top 5 most frequent customers (by number of orders) for each month in the past year.


Sample Input :

| customer_id | name  |
| ----------- | ----- |
| 1           | John  |
| 2           | Jane  |
| 3           | Bob   |
| 4           | Alice |
| 5           | Mike  |


| order_id | customer_id | order_date |
| -------- | ----------- | ---------- |
| 1        | 1           | 2025-01-05 |
| 2        | 2           | 2025-01-10 |
| 3        | 3           | 2025-01-12 |
| 4        | 4           | 2025-01-15 |
| 5        | 5           | 2025-01-20 |
| 6        | 1           | 2025-01-25 |
| 7        | 1           | 2025-01-30 |

Sample Output :
| order_month | customer_id | name  | order_count |
| ----------- | ----------- | ----- | ----------- |
| 2025-01-01  | 1           | John  | 3           |
| 2025-01-01  | 2           | Jane  | 1           |
| 2025-01-01  | 3           | Bob   | 1           |
| 2025-01-01  | 4           | Alice | 1           |
| 2025-01-01  | 5           | Mike  | 1           |
| order_month | customer_id | name  | order_count |
| ----------- | ----------- | ----- | ----------- |
| 2025-02-01  | 1           | John  | 2           |
| 2025-02-01  | 2           | Jane  | 2           |
| 2025-02-01  | 3           | Bob   | 1           |
| 2025-02-01  | 4           | Alice | 1           |
| order_month | customer_id | name  | order_count |
| ----------- | ----------- | ----- | ----------- |
| 2025-03-01  | 3           | Bob   | 2           |
| 2025-03-01  | 1           | John  | 1           |
| 2025-03-01  | 2           | Jane  | 1           |
| 2025-03-01  | 4           | Alice | 1           |
| 2025-03-01  | 5           | Mike  | 1           |



CREATE or replace TABLE customers2 ( 
 customer_id INT, 
 name VARCHAR(50), 
); 

CREATE or replace TABLE orders2 ( 
 order_id INT, 
 customer_id INT, 
 order_date DATE, 
);

INSERT INTO customers2 (customer_id, name) 
VALUES 
(1, 'John'),
(2, 'Jane'),
(3, 'Bob'),
(4, 'Alice'),
(5, 'Mike');



INSERT INTO orders2 (order_id, customer_id, order_date) VALUES
(1, 1, '2025-01-05'), (2, 2, '2025-01-10'), (3, 3, '2025-01-12'),
(4, 4, '2025-01-15'), (5, 5, '2025-01-20'),
(6, 1, '2025-01-25'), (7, 1, '2025-01-30'),
(8, 2, '2025-02-02'), (9, 3, '2025-02-05'), (10, 4, '2025-02-07'),
(11, 1, '2025-02-10'), (12, 1, '2025-02-15'), (13, 2, '2025-02-20'),
(14, 3, '2025-03-01'), (15, 3, '2025-03-03'), (16, 4, '2025-03-05'),
(17, 5, '2025-03-07'), (18, 1, '2025-03-10'), (19, 2, '2025-03-12'),
(20, 1, '2025-04-05'), (21, 3, '2025-04-06'), (22, 4, '2025-04-08'),
(23, 5, '2025-04-09'), (24, 2, '2025-04-15'),
(25, 1, '2025-05-01'), (26, 1, '2025-05-05'), (27, 2, '2025-05-07'),
(28, 3, '2025-05-10'), (29, 4, '2025-05-12'),
(30, 1, '2025-06-01'), (31, 2, '2025-06-03'), (32, 3, '2025-06-05'),
(33, 4, '2025-06-08'), (34, 5, '2025-06-10'),
(35, 1, '2025-07-01'), (36, 1, '2025-07-03'), (37, 3, '2025-07-05'),
(38, 4, '2025-07-08'), (39, 5, '2025-07-10'),
(40, 1, '2025-08-01'), (41, 2, '2025-08-03'), (42, 3, '2025-08-05'),
(43, 4, '2025-08-08'), (44, 5, '2025-08-10'),
(45, 1, '2025-09-01'), (46, 2, '2025-09-03'), (47, 3, '2025-09-05'),
(48, 4, '2025-09-08'), (49, 5, '2025-09-10'),
(50, 1, '2025-10-01'), (51, 2, '2025-10-03'), (52, 3, '2025-10-05'),
(53, 4, '2025-10-08'), (54, 5, '2025-10-10'),
(55, 1, '2025-11-01'), (56, 2, '2025-11-03'), (57, 3, '2025-11-05'),
(58, 4, '2025-11-08'), (59, 5, '2025-11-10'),
(60, 1, '2025-12-01'), (61, 2, '2025-12-03'), (62, 3, '2025-12-05'),
(63, 4, '2025-12-08'), (64, 5, '2025-12-10');

*/

WITH monthly_orders AS (
    SELECT 
        c.customer_id,
        c.name,
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
        COUNT(*) AS order_count
    FROM 
        customers2 c
    JOIN 
        orders2 o ON c.customer_id = o.customer_id
    WHERE 
        o.order_date >= CURDATE() - INTERVAL 1 YEAR
    GROUP BY 
        c.customer_id, c.name, DATE_FORMAT(o.order_date, '%Y-%m')
),
ranked_customers AS (
    SELECT 
        customer_id,
        name,
        order_month,
        order_count,
        RANK() OVER (PARTITION BY order_month ORDER BY order_count DESC) AS rnk
    FROM 
        monthly_orders
)
SELECT 
    order_month,
    customer_id,
    name,
    order_count
FROM 
    ranked_customers
WHERE 
    rnk <= 5
ORDER BY 
    order_month, rnk;

