/*
Calculate total sales value per sales representative
Find the sales rep with highest total sales
Return one top rep per region (if tie → any one is fine)


Sample Input :

| sales_id | sales_rep_name | region | medicine_name | quantity_sold | price_per_unit | sale_date  |
| -------- | -------------- | ------ | ------------- | ------------- | -------------- | ---------- |
| 1        | Alice          | North  | PainRelief    | 200           | 10.50          | 2024-01-15 |
| 2        | Bob            | North  | VitaBoost     | 150           | 15.00          | 2024-01-20 |
| 3        | Charlie        | South  | PainRelief    | 300           | 10.50          | 2024-01-22 |
| 4        | Diana          | East   | ColdCare      | 100           | 8.00           | 2024-02-01 |
| 5        | Alice          | North  | VitaBoost     | 180           | 15.00          | 2024-02-10 |
| 6        | Eve            | West   | PainRelief    | 250           | 10.50          | 2024-02-12 |
| 7        | Frank          | West   | ColdCare      | 300           | 8.00           | 2024-02-14 |
| 8        | Bob            | North  | PainRelief    | 120           | 10.50          | 2024-03-01 |
| 9        | Charlie        | South  | VitaBoost     | 200           | 15.00          | 2024-03-05 |
| 10       | Diana          | East   | PainRelief    | 150           | 10.50          | 2024-03-10 |


Expected Output :

| region | top_sales_rep | total_sales |
| ------ | ------------- | ----------- |
| North  | Alice         | 4800        |
| South  | Charlie       | 6150        |
| East   | Diana         | 2375        |
| West   | Eve           | 2625        |

*/

CREATE or replace TABLE sales_data (
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





WITH rep_sales AS (
    SELECT 
        region,
        sales_rep_name,
        SUM(quantity_sold * price_per_unit) AS total_sales
    FROM sales_data
    GROUP BY region, sales_rep_name
),
ranked_reps AS (
    SELECT 
        region,sales_rep_name,total_sales,
        RANK() OVER (PARTITION BY region ORDER BY total_sales DESC) AS rnk
    FROM rep_sales
)
SELECT 
    region,
    sales_rep_name,
    total_sales
FROM ranked_reps
WHERE rnk = 1
ORDER BY region;