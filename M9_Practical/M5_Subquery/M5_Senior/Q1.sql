/*
Questions :

            find the missing order IDs.



| order\_id |
| --------- |
| 101       |
| 102       |
| 104       |
| 105       |
| 107       |


OP : 

103
106


*/

/*

CREATE or replace TABLE orders_5 (
    order_id INT
);


INSERT INTO orders_5 (order_id) VALUES
(101),
(102),
(104),
(105),
(107);

*/

WITH RECURSIVE all_orders AS (
    SELECT MIN(order_id) AS order_id, MAX(order_id) AS max_id
    FROM orders_5
    UNION ALL
    SELECT order_id + 1, max_id
    FROM all_orders
    WHERE order_id + 1 <= max_id
)
SELECT a.order_id
FROM all_orders a
LEFT JOIN orders_5 o ON a.order_id = o.order_id
WHERE o.order_id IS NULL
ORDER BY a.order_id;


