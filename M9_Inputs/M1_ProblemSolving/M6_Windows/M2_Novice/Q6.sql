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

CREATE TABLE sales_data11 (
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


WITH sales_trend AS (
    SELECT 
        product_id,
        month,
        sales,
        LAG(sales, 1) OVER (PARTITION BY product_id ORDER BY month) AS prev_sales1,
        LAG(sales, 2) OVER (PARTITION BY product_id ORDER BY month) AS prev_sales2
    FROM sales_data11
)
SELECT DISTINCT product_id
FROM sales_trend
WHERE sales < prev_sales1
  AND prev_sales1 < prev_sales2;
