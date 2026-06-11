/*

Write a query to:

Find customers who purchased product_id = 101 more than once.
Calculate each customer's total spend across all products (quantity × price).
Return the top 3 customers by total spend.




| sale_id | sale_date  | details                                                                                                              |
| ------- | ---------- | -------------------------------------------------------------------------------------------------------------------- |
| 1       | 2024-03-01 | `{"customer_id":10,"items":[{"product_id":101,"quantity":2,"price":50},{"product_id":102,"quantity":1,"price":30}]}` |
| 2       | 2024-03-02 | `{"customer_id":11,"items":[{"product_id":103,"quantity":1,"price":60}]}`                                            |
| 3       | 2024-03-03 | `{"customer_id":10,"items":[{"product_id":101,"quantity":1,"price":50}]}`                                            |
| 4       | 2024-03-04 | `{"customer_id":12,"items":[{"product_id":101,"quantity":3,"price":50}]}`                                            |
| 5       | 2024-03-05 | `{"customer_id":13,"items":[{"product_id":101,"quantity":1,"price":50},{"product_id":102,"quantity":2,"price":30}]}` |
| 6       | 2024-03-06 | `{"customer_id":10,"items":[{"product_id":104,"quantity":2,"price":80}]}`                                            |
| 7       | 2024-03-07 | `{"customer_id":13,"items":[{"product_id":101,"quantity":1,"price":50}]}`                                            |



Excepeted Output :

| customer_id | total_spend |
| ----------- | ----------- |
| 10          | 340         |
| 13          | 160         |


*/




CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    details JSON
);

INSERT INTO sales VALUES
(1, '2024-03-01', '{"customer_id": 10, "items": [{"product_id": 101, "quantity": 2, "price": 50}, {"product_id": 102, "quantity": 1, "price": 30}]}'),
(2, '2024-03-02', '{"customer_id": 11, "items": [{"product_id": 103, "quantity": 1, "price": 60}]}'),
(3, '2024-03-03', '{"customer_id": 10, "items": [{"product_id": 101, "quantity": 1, "price": 50}]}'),
(4, '2024-03-04', '{"customer_id": 12, "items": [{"product_id": 101, "quantity": 3, "price": 50}]}'),
(5, '2024-03-05', '{"customer_id": 13, "items": [{"product_id": 101, "quantity": 1, "price": 50}, {"product_id": 102, "quantity": 2, "price": 30}]}'),
(6, '2024-03-06', '{"customer_id": 10, "items": [{"product_id": 104, "quantity": 2, "price": 80}]}'),
(7, '2024-03-07', '{"customer_id": 13, "items": [{"product_id": 101, "quantity": 1, "price": 50}]}');



WITH item_details AS (
    SELECT
        (details->>'customer_id')::INT AS customer_id,
        (item->>'product_id')::INT AS product_id,
        (item->>'quantity')::INT AS quantity,
        (item->>'price')::NUMERIC AS price
    FROM sales
    CROSS JOIN LATERAL json_array_elements(details->'items') AS item
),
customer_spend AS (
    SELECT
        customer_id,
        SUM(quantity * price) AS total_spend
    FROM item_details
    GROUP BY customer_id
),
product_101_buyers AS (
    SELECT
        customer_id
    FROM item_details
    WHERE product_id = 101
    GROUP BY customer_id
    HAVING COUNT(*) > 1
)
SELECT
    cs.customer_id,
    cs.total_spend
FROM customer_spend cs
JOIN product_101_buyers p
    ON cs.customer_id = p.customer_id
ORDER BY cs.total_spend DESC
LIMIT 3;