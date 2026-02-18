/*
Subquery in FROM Clause (Inline View / Derived Table) :

*) Subquery acts like a temporary table.

*/

SELECT dept_id, avg_salary
FROM (
    SELECT department_id AS dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) t
WHERE avg_salary > 50000;

/*

Note :
        This is Inline view or derived table

*/