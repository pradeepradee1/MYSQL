/*

Write an SQL query to combine transactions between the same pair of entities, regardless of order.

Input :

| Col1 | Col2 | Amount |
| ---- | ---- | ------ |
| A    | B    | 100    |
| B    | A    | 40     |
| A    | C    | 30     |
| NULL | A    | 25     |
| A    | NULL | 30     |
| C    | A    | 15     |


Output :

| Col1 | Col2 | Total_Amount |
| ---- | ---- | ------------ |
| A    | B    | 140          |
| A    | C    | 45           |
| NULL | A    | 25           |
| A    | NULL | 30           |


*/


CREATE or replace TABLE transactions (
 Col1 VARCHAR(10),
 Col2 VARCHAR(10),
 Amount INT
);

INSERT INTO transactions (Col1, Col2, Amount) VALUES 
('A', 'B', 100), 
('B', 'A', 40), 
('A', 'C', 30), 
(NULL, 'A', 25), 
('A', NULL, 30), 
('C', 'A', 15);


select
    t1.col1,
    t1.col2,
    t1.amount + COALESCE(t2.amount, 0) AS total_amount
FROM transactions t1
LEFT JOIN transactions t2 ON t1.col1 = t2.col2 AND t1.col2 = t2.col1 
WHERE t1.col1 <= t1.col2
   OR t1.col2 IS NULL
   OR t1.col1 IS NULL;


/* Alternative Approach */


SELECT
    CASE
        WHEN col1 IS NULL OR col2 IS NULL THEN col1
        ELSE LEAST(col1, col2)
    END AS col1,
 
    CASE
        WHEN col1 IS NULL OR col2 IS NULL THEN col2
        ELSE GREATEST(col1, col2)
    END AS col2,
 
    SUM(amount) AS total_amount
FROM your_table
 
GROUP BY
    CASE
        WHEN col1 IS NULL OR col2 IS NULL THEN col1
        ELSE LEAST(col1, col2)
    END,

    CASE
        WHEN col1 IS NULL OR col2 IS NULL THEN col2
        ELSE GREATEST(col1, col2)
    END;
