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

CREATE TABLE purchases11 (
    customer_id INT,
    product VARCHAR(50),
    purchase_date DATE
);

INSERT INTO purchases11 (customer_id, product, purchase_date) VALUES
(1, 'Laptop', '2024-08-01'),
(1, 'Mouse', '2024-08-05'),
(2, 'Keyboard', '2024-08-02'),
(2, 'Monitor', '2024-08-03');


SELECT p.customer_id, p.product, p.purchase_date
FROM purchases11 p
JOIN (
    SELECT customer_id, MAX(purchase_date) AS latest_date
    FROM purchases11
    GROUP BY customer_id
) latest
ON p.customer_id = latest.customer_id
AND p.purchase_date = latest.latest_date
ORDER BY p.customer_id;
