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



WITH ordered AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY start_date) AS rn1,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY end_date) AS rn2
    FROM date_ranges
),
grp_data AS (
    SELECT *,
           DATE_SUB(start_date, INTERVAL rn1 DAY) AS grp
    FROM ordered
)
SELECT 
    id,
    MIN(start_date) AS start_date,
    MAX(end_date) AS end_date
FROM grp_data
GROUP BY id, grp
ORDER BY id, start_date;

