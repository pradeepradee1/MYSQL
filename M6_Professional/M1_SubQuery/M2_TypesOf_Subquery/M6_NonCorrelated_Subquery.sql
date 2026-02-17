/*
Non Correlated Subquery :

                        Inner query executes only once
                        Does NOT depend on outer query

*/

SELECT name
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE dept_name = 'HR');
