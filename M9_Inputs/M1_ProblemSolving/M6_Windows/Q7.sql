/*

 13. Remove duplicate rows based on multiple columns


| user\_id | product\_id | purchase\_date |
| -------- | ----------- | -------------- |
| 1        | P1          | 2025-03-01     |
| 1        | P1          | 2025-03-01     |
| 2        | P2          | 2025-03-02     |
| 2        | P2          | 2025-03-02     |
| 3        | P3          | 2025-03-03     |


OP as 

+-------+----------+-------------+
|user_id|product_id|purchase_date|
+-------+----------+-------------+
|      1|       P1 |   2025-03-01|
|      2|       P2 |   2025-03-02|
|      3|       P3 |   2025-03-03|
+-------+----------+-------------+

*/

/* If you want to keep only unique combinations of (user_id, product_id, purchase_date): */
  
SELECT DISTINCT user_id, product_id, purchase_date
FROM purchases;


/* Or if you want to remove duplicates but keep one row (all columns retained): */

SELECT *
FROM (
   SELECT *,
          ROW_NUMBER() OVER (PARTITION BY user_id, product_id, purchase_date ORDER BY purchase_date) AS rn
   FROM purchases
) t
WHERE rn = 1;
