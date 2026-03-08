/*

Who Wants Their Food Fast?

The Problem:

Find the percentage of customers whose first order was immediate.

What is immediate order ?
    Immediate order → order_date = customer_pref_delivery_date
    Consider only the first order of each customer


+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 |                  2019-08-02 |
| 2           | 2           | 2019-08-02 |                  2019-08-02 |
| 3           | 1           | 2019-08-11 |                  2019-08-12 |
| 4           | 3           | 2019-08-24 |                  2019-08-24 |
| 5           | 3           | 2019-08-21 |                  2019-08-22 |
| 6           | 2           | 2019-08-11 |                  2019-08-13 |
| 7           | 4           | 2019-08-09 |                  2019-08-09 |
+-------------+-------------+------------+-----------------------------+



Output:
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00 |

*/
/*

CREATE or replace TABLE Delivery (
    delivery_id INT,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);


INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 2, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-12'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 3, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13'),
(7, 4, '2019-08-09', '2019-08-09');

*/


SELECT 
	(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*) ) * 100 AS immediate_percentag1,
    ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 2) AS immediate_percentage
FROM 
(
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
) first_orders
JOIN Delivery d
   ON d.customer_id = first_orders.customer_id 
   AND d.order_date = first_orders.first_order_date;
