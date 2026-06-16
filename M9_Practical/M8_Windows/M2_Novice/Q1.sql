/*
Finding the Second Highest Salary


Employee
+----+--------+
| id | salary |
+----+--------+
| 1 | 100     |
| 2 | 200     |
| 3 | 300     |
+----+--------+

The task: Return 200 — the second highest distinct salary.

*/

/* 
Solution 1
    Using DENSE_RANK() – Great for handling duplicates 
*/


SELECT salary
FROM (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = 2;



/*
Solution 2: Using LIMIT + OFFSET – Short, sweet, efficient 
*/

SELECT 
    DISTINCT salary 
FROM
    Employee
ORDER BY salary DESC
LIMIT 1,1


/* 

Solution 3 :
Subquery with MAX() – Portable and performant 

*/

SELECT 
    MAX(salary) AS SecondHighestSalary
FROM 
    Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
