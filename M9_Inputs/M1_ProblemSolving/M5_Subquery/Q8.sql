/*
Questions : Merge continuous date rows with same ID

| id | start\_date | end\_date  |
| -- | ----------- | ---------- |
| 1  | 2024-01-01  | 2024-01-10 |
| 1  | 2024-01-11  | 2024-01-15 |
| 2  | 2024-02-01  | 2024-02-05 |
| 2  | 2024-02-10  | 2024-02-15 |



| id | start\_date | end\_date  |
| -- | ----------- | ---------- |
| 1  | 2024-01-01  | 2024-01-15 |
| 2  | 2024-02-01  | 2024-02-05 |
| 2  | 2024-02-10  | 2024-02-15 |


*/

WITH cte AS (
    SELECT
        id,
        start_date,
        end_date,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY start_date) -
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY end_date) AS grp
    FROM ranges
)
SELECT 
    id,
    MIN(start_date) AS start_date,
    MAX(end_date) AS end_date
FROM cte
GROUP BY id, grp
ORDER BY id, start_date;
