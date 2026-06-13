/*

Problem: 
Out of all sales, how much does this product contribute
For each product.

*/

/*
Input :

products1

product_id | product_name
-----------+-------------
1          | Shirt
2          | Pants
3          | Shoes

sales1 

sale_id | product_id | sale_amount
--------+------------+-------------
1       | 1          | 100.00
2       | 1          | 150.00
3       | 2          | 200.00
4       | 2          | 300.00
5       | 3          | 250.00
6       | 3          | 350.00


Expected Output :

product_id | product_name | total_sales | sales_percentage
-----------|--------------|-------------|------------------
3          | Shoes        | 600.00      | 44.44
2          | Pants        | 500.00      | 37.04
1          | Shirt        | 250.00      | 18.52

*/

CREATE or replace TABLE products1 (
 product_id INT,
 product_name VARCHAR(50)
);

INSERT INTO products1 VALUES (1, 'Shirt');
INSERT INTO products1 VALUES (2, 'Pants');
INSERT INTO products1 VALUES (3, 'Shoes');

CREATE or replace TABLE sales1 (
 sale_id INT,
 product_id INT,
 sale_amount DECIMAL(10,2)
);

INSERT INTO sales1 VALUES (1, 1, 100.00);
INSERT INTO sales1 VALUES (2, 1, 150.00);
INSERT INTO sales1 VALUES (3, 2, 200.00);
INSERT INTO sales1 VALUES (4, 2, 300.00);
INSERT INTO sales1 VALUES (5, 3, 250.00);
INSERT INTO sales1 VALUES (6, 3, 350.00);



WITH product_totals AS (
    SELECT 
        product_id,
        SUM(sale_amount) AS total_sales
    FROM sales1
    GROUP BY product_id
)
SELECT 
    p.product_id,
    p.product_name,
    pt.total_sales,
    pt.total_sales * 100.0 / SUM(pt.total_sales) OVER () AS sales_percentage
FROM product_totals pt
JOIN products1 p 
    ON pt.product_id = p.product_id
ORDER BY pt.total_sales DESC;

