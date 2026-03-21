/*

⁠How do you calculate the median of a numeric column in SQL?

*/

/*

CREATE TABLE sales2 (
    sale_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO sales2 VALUES
(1, 100), (2, 150), (3, 120), (4, 200), (5, 80);

*/


WITH ranked AS (
    SELECT 
        amount,
        ROW_NUMBER() OVER (ORDER BY amount) AS rn,
        COUNT(*) OVER () AS total_count
    FROM sales2
)
SELECT 
    ROUND(AVG(amount), 2) AS median
FROM ranked
WHERE rn IN ((total_count + 1)/2, (total_count + 2)/2);
