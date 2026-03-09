/*
Track medicine sales across multiple regions.

Track medicine sales across multiple regions. Each region has multiple sales representatives who sell different medicines. 
Management wants answers to the following:
Which sales representative has the highest total sales value in each region?

*/

CREATE TABLE sales_data (
 sales_id INT,
 sales_rep_name VARCHAR(50),
 region VARCHAR(50),
 medicine_name VARCHAR(50),
 quantity_sold INT,
 price_per_unit DECIMAL(10, 2),
 sale_date DATE
);

INSERT INTO sales_data VALUES
(1, 'Alice', 'North', 'PainRelief', 200, 10.50, '2024-01-15'),
(2, 'Bob', 'North', 'VitaBoost', 150, 15.00, '2024-01-20'),
(3, 'Charlie', 'South', 'PainRelief', 300, 10.50, '2024-01-22'),
(4, 'Diana', 'East', 'ColdCare', 100, 8.00, '2024-02-01'),
(5, 'Alice', 'North', 'VitaBoost', 180, 15.00, '2024-02-10'),
(6, 'Eve', 'West', 'PainRelief', 250, 10.50, '2024-02-12'),
(7, 'Frank', 'West', 'ColdCare', 300, 8.00, '2024-02-14'),
(8, 'Bob', 'North', 'PainRelief', 120, 10.50, '2024-03-01'),
(9, 'Charlie', 'South', 'VitaBoost', 200, 15.00, '2024-03-05'),
(10, 'Diana', 'East', 'PainRelief', 150, 10.50, '2024-03-10');


SELECT
    region,
    sales_rep_name,
    total_sales_value
FROM (
    SELECT
        region,
        sales_rep_name,
        SUM(quantity_sold * price_per_unit) AS total_sales_value,
        RANK() OVER (PARTITION BY region ORDER BY SUM(quantity_sold * price_per_unit) DESC) AS rnk
    FROM sales_data1
    GROUP BY region, sales_rep_name
) AS ranked_sales
WHERE rnk = 1
ORDER BY region;

