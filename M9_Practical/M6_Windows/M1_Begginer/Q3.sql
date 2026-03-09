/*
Question:
		
Get the first 2 and last 2 month of year salary  

*/

CREATE or replace TABLE tmptable2 (
    empid INT,
    monthno INT,
    salary INT
);


INSERT INTO tmptable2 (empid, monthno, salary) VALUES
(101, 1, 1000),
(101, 2, 1200),
(101, 3, 1100),
(101, 4, 1500),
(101, 5, 1700),
(101, 6, 1600),
(101, 7, 1800),
(101, 8, 2000),
(101, 9, 2100),
(101,10, 2200),
(101,11, 2300),
(101,12, 2400),
(102, 1, 900),
(102, 2, 950),
(102, 3, 1000),
(102, 4, 1050),
(102, 5, 1100),
(102, 6, 1200),
(102, 7, 1250),
(102, 8, 1300),
(102, 9, 1350),
(102,10, 1400),
(102,11, 1450),
(102,12, 1500);




SELECT 
    empid,
    monthno,
    SUM(salary) AS total_salary
FROM
(
    SELECT 
        empid,
        monthno,
        salary,
        DENSE_RANK() OVER (PARTITION BY empid ORDER BY monthno ASC)  AS row_num_asc,
        DENSE_RANK() OVER (PARTITION BY empid ORDER BY monthno DESC) AS row_num_desc
    FROM tmptable2
) a
WHERE row_num_asc <= 2 
   OR row_num_desc <= 2
GROUP BY empid, monthno
ORDER BY empid, monthno;