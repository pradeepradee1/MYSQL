/*

How would you spot products with 3 months of consecutive sales decline?


product_id | month     | sales
P1         | 2025-01   | 100
P1         | 2025-02   | 90
P1         | 2025-03   | 80
P1         | 2025-04   | 85
P2         | 2025-01   | 50
P2         | 2025-02   | 45
P2         | 2025-03   | 40


*/

CREATE or replace TABLE sales_data11 (
    product_id VARCHAR(10),
    month DATE,
    sales INT
);

INSERT INTO sales_data11 VALUES
('P1', '2025-01-01', 100),
('P1', '2025-02-01', 90),
('P1', '2025-03-01', 80),
('P1', '2025-04-01', 85),
('P2', '2025-01-01', 50),
('P2', '2025-02-01', 45),
('P2', '2025-03-01', 40);


SELECT DISTINCT product_id
FROM (
    SELECT 
        product_id,
        month,
        sales,
        LAG(sales,1) OVER (PARTITION BY product_id ORDER BY month) AS prev1,
        LAG(sales,2) OVER (PARTITION BY product_id ORDER BY month) AS prev2
    FROM product_sales
) t
WHERE sales < prev1
AND prev1 < prev2;