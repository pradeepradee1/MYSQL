/*
✅ 11. What is ROLLUP and CUBE? (Advanced)
*/

/* ROLLUP → Subtotals */
SELECT department, SUM(salary)
FROM employees
GROUP BY ROLLUP(department);


/* CUBE → All combinations */
SELECT department, gender, SUM(salary)
FROM employees
GROUP BY CUBE(department, gender);
