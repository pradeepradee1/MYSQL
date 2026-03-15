/*

Write an SQL query to fetch all rows where at least 2 columns have NULL values.

col1 | col2 | col3 | col4
-----+------+------+------
 a   | null | null | null
 a   | b    | c    | d


Expected Output :

| col1 | col2 | col3 | col4 |
| ---- | ---- | ---- | ---- |
| a    | NULL | NULL | NULL |


*/

create or replace TABLE test_nulls (
    col1 VARCHAR(10),
    col2 VARCHAR(10),
    col3 VARCHAR(10),
    col4 VARCHAR(10)
);

INSERT INTO test_nulls VALUES
('a', NULL, NULL, NULL),
('a', 'b', 'c', 'd');



SELECT *
FROM your_table
WHERE 
    (CASE WHEN col1 IS NULL THEN 1 ELSE 0 END +
     CASE WHEN col2 IS NULL THEN 1 ELSE 0 END +
     CASE WHEN col3 IS NULL THEN 1 ELSE 0 END +
     CASE WHEN col4 IS NULL THEN 1 ELSE 0 END) >= 2;