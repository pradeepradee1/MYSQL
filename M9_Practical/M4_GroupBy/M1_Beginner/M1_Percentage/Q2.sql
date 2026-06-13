/*

Questions: 
Calculates the percentage contribution of each product's sales 


store_id | product_id | sales_amount
---------|------------|--------------
S1       | P1         | 100
S1       | P2         | 200
S1       | P3         | 300
S2       | P1         | 400
S2       | P2         | 100
S2       | P3         | 500


Sample Output :

store_id | product_id | sales_amount | percentage
---------|------------|--------------|------------
S1       | P1         | 100          | 16.67
S1       | P2         | 200          | 33.33
S1       | P3         | 300          | 50.00

S2       | P1         | 400          | 40.00
S2       | P2         | 100          | 10.00
S2       | P3         | 500          | 50.00

*/


/*

CREATE or replace TABLE store_sales (
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    sales_amount INT
);


INSERT INTO store_sales (store_id, product_id, sales_amount) VALUES
('S1', 'P1', 100), 
('S1', 'P2', 200),
('S1', 'P3', 300), 
('S2', 'P1', 400),
('S2', 'P2', 100), 
('S2', 'P3', 500);

*/


/*
using Group By
*/



WITH sum_sales AS (
    SELECT
        store_id,
        SUM(sales_amount) AS total_sales
    FROM store_sales
    GROUP BY store_id
)
SELECT
    s.store_id,
    s.product_id,
    s.sales_amount,
    ROUND((s.sales_amount * 100.0) / ss.total_sales, 2) AS percentage
FROM store_sales s
JOIN sum_sales ss ON s.store_id = ss.store_id;


/*
using over method
*/


SELECT 
    store_id,
    product_id,
    sales_amount,
    ROUND((sales_amount * 100.0 / SUM(sales_amount) OVER (PARTITION BY store_id)), 2) AS percentage_contribution
FROM 
    store_sales
ORDER BY 
    store_id, product_id;


/*
Using group by approach
*/


SELECT 
    s.store_id,
    s.product_id,
    s.sales_amount,
    ROUND(s.sales_amount * 100.0 / t.total_sales,2) AS percentage
FROM store_sales s
JOIN (SELECT 
    store_id,SUM(sales_amount) AS total_sales
    FROM store_sales
    GROUP BY store_id
) t
ON s.store_id = t.store_id
ORDER BY s.store_id, s.product_id;

