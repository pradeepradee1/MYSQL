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

WITH sales_with_prev AS (
    SELECT 
        product_id,
        month,
        sales,
        LAG(sales, 1) OVER (PARTITION BY product_id ORDER BY month) AS prev_sales,
        LAG(sales, 2) OVER (PARTITION BY product_id ORDER BY month) AS prev_sales_2
    FROM sales
),
decline_flag AS (
    SELECT
        product_id,
        month,
        sales,
        prev_sales,
        prev_sales_2,
        CASE 
            WHEN sales < prev_sales AND prev_sales < prev_sales_2 THEN 1
            ELSE 0
        END AS three_month_decline
    FROM sales_with_prev
)
SELECT DISTINCT product_id
FROM decline_flag
WHERE three_month_decline = 1;
