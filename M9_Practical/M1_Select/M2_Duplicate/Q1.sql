/*

Remove duplicate rows based on multiple columns

Input:


| user\_id | product\_id | purchase\_date |
| -------- | ----------- | -------------- |
| 1        | P1          | 2025-03-01     |
| 1        | P1          | 2025-03-01     |
| 2        | P2          | 2025-03-02     |
| 2        | P2          | 2025-03-02     |
| 3        | P3          | 2025-03-03     |


Output: 

+-------+----------+-------------+
|user_id|product_id|purchase_date|
+-------+----------+-------------+
|      1|       P1 |   2025-03-01|
|      2|       P2 |   2025-03-02|
|      3|       P3 |   2025-03-03|
+-------+----------+-------------+

*/
/*

CREATE or replace TABLE purchases12 (
    user_id INT,
    product_id VARCHAR(10),
    purchase_date DATE
);

INSERT INTO purchases12 (user_id, product_id, purchase_date) VALUES
(1, 'P1', '2025-03-01'),
(1, 'P1', '2025-03-01'),
(2, 'P2', '2025-03-02'),
(2, 'P2', '2025-03-02'),
(3, 'P3', '2025-03-03');


*/

/* 
Method 1 :
using distinct 
*/
  
SELECT 
    DISTINCT user_id, 
    product_id, 
    purchase_date
FROM 
    purchases12;


