/*

Questions : Your task is to calculates the percentage contribution of each product's sales relative to the 
total sales of that store

*/


/*
CREATE TABLE store_sales (
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

SELECT 
    store_id,
    product_id,
    sales_amount,
    ROUND(
        (sales_amount * 100.0 / SUM(sales_amount) OVER (PARTITION BY store_id)), 2
    ) AS percentage_contribution
FROM 
    store_sales
ORDER BY 
    store_id, product_id;

