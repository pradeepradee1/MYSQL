/*

Find all customers who have placed orders in at least 3 different product categories in the same calendar month.




*/

/*

CREATE or replace TABLE customers6 (
 customer_id INT,
 customer_name VARCHAR(100)
);

CREATE or replace TABLE orders6 (
 order_id INT,
 customer_id INT,
 order_date DATE,
 category VARCHAR(50)
);

INSERT INTO customers6 VALUES
(1, 'Gowtham'), 
(2, 'Sneha'), 
(3, 'Arjun');

INSERT INTO orders6 VALUES
(101, 1, '2024-04-05', 'Shirts'),
(102, 1, '2024-04-15', 'Shoes'),
(103, 1, '2024-04-22', 'Watches'),
(104, 2, '2024-04-10', 'Shirts'),
(105, 2, '2024-05-11', 'Shirts'),
(106, 3, '2024-04-03', 'Shoes'),
(107, 3, '2024-04-14', 'Shoes'),
(108, 3, '2024-04-29', 'Shoes');


Sample Input :

| customer_id | customer_name |
| ----------- | ------------- |
| 1           | Gowtham       |
| 2           | Sneha         |
| 3           | Arjun         |


| order_id | customer_id | order_date | category |
| -------- | ----------- | ---------- | -------- |
| 101      | 1           | 2024-04-05 | Shirts   |
| 102      | 1           | 2024-04-15 | Shoes    |
| 103      | 1           | 2024-04-22 | Watches  |
| 104      | 2           | 2024-04-10 | Shirts   |
| 105      | 2           | 2024-05-11 | Shirts   |
| 106      | 3           | 2024-04-03 | Shoes    |
| 107      | 3           | 2024-04-14 | Shoes    |
| 108      | 3           | 2024-04-29 | Shoes    |


Expected Output :

| customer_id | customer_name | year | month | category_count |
| ----------- | ------------- | ---- | ----- | -------------- |
| 1           | Gowtham       | 2024 | 4     | 3              |


*/

SELECT 
    c.customer_id,
    c.customer_name,
    YEAR(o.order_date)  AS order_year,
    MONTH(o.order_date) AS order_month,
    COUNT(DISTINCT o.category) AS category_count
FROM orders6 o
JOIN customers6 c
  ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name,
    YEAR(o.order_date),
    MONTH(o.order_date)
HAVING COUNT(DISTINCT o.category) >= 3;

