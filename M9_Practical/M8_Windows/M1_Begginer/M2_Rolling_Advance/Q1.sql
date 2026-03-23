/*

Problem : 
Calculating the 3-month (quarter) rolling average for each employee


empid | monthno | salary
------|---------|--------
101   | 1       | 1000
101   | 2       | 1200
101   | 3       | 1100
101   | 4       | 1500
101   | 5       | 1700
101   | 6       | 1600


Output :

empid | monthno | salary | avg_sal
------|---------|--------|---------
101   | 1       | 1000   | 1000.00
101   | 2       | 1200   | 1100.00
101   | 3       | 1100   | 1100.00
101   | 4       | 1500   | 1266.67   -- (2,3,4)
101   | 5       | 1700   | 1433.33   -- (3,4,5)
101   | 6       | 1600   | 1600.00   -- (4,5,6)


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
(102, 1, 900),
(102, 2, 1000),
(102, 3, 1200),
(102, 4, 1300),
(102, 5, 1400),
(102, 6, 1500);


SELECT 
    *,
    AVG(salary) OVER w AS avg_sal
FROM tmptable2
WINDOW w AS (PARTITION BY empid ORDER BY monthno 
             ROWS BETWEEN 2 PRECEDING AND CURRENT ROW);




/*


Moving average is of two types

1. Simple moving average 

2. Exponential moving average


*/
