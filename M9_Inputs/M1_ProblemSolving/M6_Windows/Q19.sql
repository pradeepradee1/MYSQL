/*

⁠How do you calculate the median of a numeric column in SQL?

*/


WITH ordered AS (
    SELECT 
        value,
        ROW_NUMBER() OVER (ORDER BY value) AS rn,
        COUNT(*) OVER () AS cnt
    FROM sales
)
SELECT 
    CASE 
        WHEN cnt % 2 = 1 THEN 
            -- Odd count → middle element
            CAST(MAX(CASE WHEN rn = (cnt + 1) / 2 THEN value END) AS DECIMAL(10,2))
        ELSE 
            -- Even count → average of two middle elements
            CAST((
                (MAX(CASE WHEN rn = cnt / 2 THEN value END) +
                 MAX(CASE WHEN rn = (cnt / 2) + 1 THEN value END)) / 2.0
            ) AS DECIMAL(10,2))
    END AS median
FROM ordered;
