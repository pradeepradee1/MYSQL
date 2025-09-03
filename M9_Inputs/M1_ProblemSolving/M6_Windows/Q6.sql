/*


| customer\_id | product  | purchase\_date |
| ------------ | -------- | -------------- |
| 1            | Laptop   | 2024-08-01     |
| 1            | Mouse    | 2024-08-05     |
| 2            | Keyboard | 2024-08-02     |
| 2            | Monitor  | 2024-08-03     |


OP 

| customer\_id | product | purchase\_date |
| ------------ | ------- | -------------- |
| 1            | Mouse   | 2024-08-05     |
| 2            | Monitor | 2024-08-03     |


*/

WITH ranked AS (
    SELECT 
        customer_id,
        product,
        purchase_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY purchase_date DESC
        ) AS rn
    FROM purchases
)
SELECT customer_id, product, purchase_date
FROM ranked
WHERE rn = 1;
