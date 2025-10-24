/*
Finding the Second Highest Salary 💼


Employee
+----+--------+
| id | salary |
+----+--------+
| 1 | 100 |
| 2 | 200 |
| 3 | 300 |
+----+--------+

The task: Return 200 — the second highest distinct salary.

*/

/* Solution 1: Using DENSE_RANK() – Great for handling duplicates */


WITH salary_rank AS (
 SELECT salary,
 DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank_col
 FROM Employee
)
SELECT MAX(salary) AS SecondHighestSalary
FROM salary_rank 
WHERE salary_rank_col = 2;
✅ Why it works:
DENSE_RANK() ranks salaries without skipping numbers (even if there are duplicates).

/*
Solution 2: Using LIMIT + OFFSET – Short, sweet, efficient */

SELECT 
 (SELECT DISTINCT salary 
 FROM Employee
 ORDER BY salary DESC
 LIMIT 1 OFFSET 1) AS SecondHighestSalary;

/* Solution 3: Subquery with MAX() – Portable and performant */

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
 SELECT MAX(salary) FROM Employee
);