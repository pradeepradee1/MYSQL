/*

cumulative distinct count

*/

/*
CREATE TABLE purchases (
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

*/

SELECT p1.customer_id,
       p1.purchase_date,
       p1.product_id,
       (
         SELECT COUNT(DISTINCT p2.product_id)
         FROM purchases p2
         WHERE p2.customer_id = p1.customer_id
           AND p2.purchase_date <= p1.purchase_date
       ) AS cumulative_distinct_count
FROM purchases p1
ORDER BY p1.customer_id, p1.purchase_date;
