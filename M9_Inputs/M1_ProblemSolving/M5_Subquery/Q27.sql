/*

⁠How would you detect anomalies or outliers in a dataset using SQL?

*/

/* 1️⃣ Z-Score Method (Standard Deviation Approach) */

WITH stats AS (
    SELECT 
        AVG(value) AS mean_val,
        STDDEV(value) AS stddev_val
    FROM sales
)
SELECT 
    s.value,
    (s.value - st.mean_val) / st.stddev_val AS z_score
FROM sales s
CROSS JOIN stats st
WHERE ABS((s.value - st.mean_val) / st.stddev_val) > 3;  -- threshold


/* 2️⃣ IQR Method (Interquartile Range) */

WITH quartiles AS (
    SELECT 
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY value) AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY value) AS Q3
    FROM sales
)
SELECT s.value
FROM sales s, quartiles q
WHERE s.value < q.Q1 - 1.5 * (q.Q3 - q.Q1)
   OR s.value > q.Q3 + 1.5 * (q.Q3 - q.Q1);

/* 3️⃣ Percentile Thresholds */

SELECT value
FROM (
    SELECT value,
           NTILE(100) OVER (ORDER BY value) AS percentile_rank
    FROM sales
) ranked
WHERE percentile_rank <= 5 OR percentile_rank >= 95;
