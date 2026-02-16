/*

Problem: Calculate the total sales for each product, including a column showing the percentage of total sales that 
product represents.

*/

/*
CREATE TABLE products1 (
 product_id INT,
 product_name VARCHAR(50)
);

INSERT INTO products1 VALUES (1, 'Shirt');
INSERT INTO products1 VALUES (2, 'Pants');
INSERT INTO products1 VALUES (3, 'Shoes');

CREATE TABLE sales1 (
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
-----------+--------------+-------------+------------------
3          | Shoes        | 600.00      | 36.36
2          | Pants        | 500.00      | 30.30
1          | Shirt        | 250.00      | 15.15


*/

SELECT 
    p.product_id,
    p.product_name,
    SUM(s.sale_amount) AS total_sales,
    ROUND((SUM(s.sale_amount) * 100.0 / SUM(SUM(s.sale_amount)) OVER ()),2) AS percentage_of_total
FROM 
    products1 p JOIN sales1 s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name;

