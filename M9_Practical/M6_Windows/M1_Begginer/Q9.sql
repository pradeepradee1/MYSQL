/*
Questions : Merge continuous date rows with same ID


Sample IP :

| id | start\_date | end\_date  |
| -- | ----------- | ---------- |
| 1  | 2024-01-01  | 2024-01-10 |
| 1  | 2024-01-11  | 2024-01-15 |
| 2  | 2024-02-01  | 2024-02-05 |
| 2  | 2024-02-10  | 2024-02-15 |


Sample OP :

| id | start\_date | end\_date  |
| -- | ----------- | ---------- |
| 1  | 2024-01-01  | 2024-01-15 |
| 2  | 2024-02-01  | 2024-02-05 |
| 2  | 2024-02-10  | 2024-02-15 |


*/

/*

CREATE or replace TABLE date_ranges (
    id INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO date_ranges (id, start_date, end_date) VALUES
(1, '2024-01-01', '2024-01-10'),
(1, '2024-01-11', '2024-01-15'),
(2, '2024-02-01', '2024-02-05'),
(2, '2024-02-10', '2024-02-15');

*/


WITH ordered_ranges AS (
    SELECT id,start_date,end_date,
    LAG(end_date) OVER (PARTITION BY id ORDER BY start_date) AS prev_end
    FROM date_ranges
),
grouped AS (
    SELECT id,start_date,end_date,
        SUM(CASE WHEN DATEDIFF(start_date, prev_end) > 1 OR prev_end IS NULL THEN 1 ELSE 0 END)
            OVER (PARTITION BY id ORDER BY start_date) AS grp
    FROM ordered_ranges
)
SELECT
    id,
    MIN(start_date) AS start_date,
    MAX(end_date) AS end_date
FROM grouped
GROUP BY id, grp
ORDER BY id, start_date;

