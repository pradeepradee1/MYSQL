/*

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



WITH RECURSIVE seq AS (
    SELECT MIN(order_id) AS id, MAX(order_id) AS max_id
    FROM Orders
    UNION ALL
    SELECT id + 1, max_id
    FROM seq
    WHERE id + 1 <= max_id
)
SELECT id AS missing_order_id
FROM seq
WHERE id NOT IN (SELECT order_id FROM Orders);
