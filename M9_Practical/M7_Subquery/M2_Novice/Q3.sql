/*

Calculate the cumulative count of distinct products purchased by each customer over time.

What is cumulative ?

| Date | Sales | Cumulative Sales |
| ---- | ----- | ---------------- |
| Day1 | 10    | 10               |
| Day2 | 20    | 30               |
| Day3 | 15    | 45               |
| Day4 | 25    | 70               |


*/

/*

CREATE or replace TABLE purchases (
    customer_id INT,
    purchase_date DATE,
    product_id VARCHAR(10)
);

INSERT INTO purchases (customer_id, purchase_date, product_id) VALUES
(1, '2025-09-01', 'P1'),
(1, '2025-09-02', 'P2'),
(1, '2025-09-03', 'P1'),
(2, '2025-09-01', 'P2'),
(2, '2025-09-02', 'P3');


Excepted Output :

| customer_id | purchase_date | product_id | cumulative_distinct_products |
| ----------- | ------------- | ---------- | ---------------------------- |
| 1           | 2025-09-01    | P1         | 1                            |
| 1           | 2025-09-02    | P2         | 2                            |
| 1           | 2025-09-03    | P1         | 2                            |
| 2           | 2025-09-01    | P2         | 1                            |
| 2           | 2025-09-02    | P3         | 2                            |


*/

SELECT p1.customer_id,
       p1.purchase_date,
       p1.product_id,
       (
       	 SELECT COUNT(DISTINCT p2.product_id) FROM purchases p2
         WHERE p2.customer_id = p1.customer_id AND 
         p2.purchase_date <= p1.purchase_date
       ) AS cumulative_distinct_count
FROM purchases p1
ORDER BY p1.customer_id, p1.purchase_date;

