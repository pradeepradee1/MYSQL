/*

Problem: Find the top 5 customers with the highest total purchase amount in the past 3 months.

*/

CREATE TABLE customers_1 (
 id INT,
 name VARCHAR(50),
 state VARCHAR(2),
 country VARCHAR(50)
);

INSERT INTO customers_1 (id, name, state, country)
VALUES (1, 'John Smith', 'CA', 'USA'),
 (2, 'Jane Doe', 'NY', 'USA'),
 (3, 'Bob Johnson', 'TX', 'USA'),
 (4, 'Samantha Lee', 'CA', 'USA'),
 (5, 'Mike Brown', 'NY', 'USA');

CREATE TABLE orders_1 (
 id INT,
 customer_id INT,
 purchase_amount DECIMAL(10,2),
 purchase_date DATE
);

INSERT INTO orders_11 (id, customer_id, purchase_amount, purchase_date)
VALUES (1, 1, 100.00, '2021-05-01'),
 (2, 2, 50.00, '2021-05-02'),
 (3, 3, 200.00, '2021-05-03'),
 (4, 4, 300.00, '2021-05-04'),
 (5, 5, 150.00, '2021-05-05'),
 (6, 1, 250.00, '2021-06-01'),
 (7, 2, 75.00, '2021-06-02'),
 (8, 3, 350.00, '2021-06-03'),
 (9, 4, 400.00, '2021-06-04'),
 (10, 5, 200.00, '2021-06-05'),
 (11, 1, 150.00, '2021-07-01'),
 (12, 2, 100.00, '2021-07-02'),
 (13, 3, 500.00, '2021-07-03'),
 (14, 4, 200.00, '2021-07-04'),
 (15, 5, 100.00, '2021-07-05');


SELECT 
    c.id AS customer_id,
    c.name,
    SUM(o.purchase_amount) AS total_purchase
FROM 
    customers_1 c
JOIN 
    orders_11 o ON c.id = o.customer_id
WHERE 
    o.purchase_date >= CURDATE() - INTERVAL 3 MONTH
GROUP BY 
    c.id, c.name
ORDER BY 
    total_purchase DESC
LIMIT 5;

