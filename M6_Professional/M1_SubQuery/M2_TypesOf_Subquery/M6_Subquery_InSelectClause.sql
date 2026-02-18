/*
Subquery in SELECT Clause (Scalar Subquery) :

                        *) Returns a single value (one row, one column)

                        *) Often used in SELECT clause

*/

SELECT name,
       (SELECT department_name 
        FROM departments d 
        WHERE d.department_id = e.department_id) AS dept_name
FROM employees e;

/*

Note :
        This is scalar subquery
        No aggregatiion function used
        since it return the single columns

*/