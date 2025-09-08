/*

: Who Wants Their Food Fast?
🧾 The Problem:
You're given a Delivery table :
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1 | 1 | 2019-08-01 | 2019-08-02 |
| 2 | 2 | 2019-08-02 | 2019-08-02 |
| 3 | 1 | 2019-08-11 | 2019-08-12 |
| 4 | 3 | 2019-08-24 | 2019-08-24 |
| 5 | 3 | 2019-08-21 | 2019-08-22 |
| 6 | 2 | 2019-08-11 | 2019-08-13 |
| 7 | 4 | 2019-08-09 | 2019-08-09 |
+-------------+-------------+------------+-----------------------------+


We want to:
 Find the percentage of customers whose first order was immediate.
 Round the result to 2 decimal places.
 
Output:
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00 |

*/

WITH ORDER_STATUS AS (
 SELECT 
 ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_num,
 CASE 
 WHEN order_date = customer_pref_delivery_date THEN 'immediate'
 ELSE 'scheduled'
 END AS order_status
 FROM Delivery
)

SELECT 
 ROUND(SUM(CASE WHEN order_status = 'immediate' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
 AS immediate_percentage
FROM ORDER_STATUS
WHERE order_num = 1;