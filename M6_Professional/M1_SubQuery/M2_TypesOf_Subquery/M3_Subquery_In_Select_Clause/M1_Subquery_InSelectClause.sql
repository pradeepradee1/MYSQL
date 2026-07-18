/*
Subquery in SELECT Clause (Scalar Subquery) :

                        *) It is also called as scalar subquery
                        *) It Returns a Single Column and multiple Value

*/

SELECT name,
       (SELECT department_name 
        FROM departments d 
        WHERE d.department_id = e.department_id) AS dept_name
FROM employees e;

/*

Note :
        This is scalar subquery ( Single Row Functions ) = 	It Produces a set of output values as per the input values
        No aggregatiion function used
        since it return the single columns

*/
