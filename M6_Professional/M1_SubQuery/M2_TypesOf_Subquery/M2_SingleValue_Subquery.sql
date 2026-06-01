/*
Single value Subquery :
                    Returns single values
                    Used with operators like =, >, <, >=, <= (Assignment and Relational operator)
*/


/*
    Find employees earning more than average salary
*/

SELECT name 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

