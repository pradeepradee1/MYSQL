/*
Single Row Subquery :
                    Returns single values
                    Used with operators like =, >, <, >=, <= (Assignment and Relational operator)
*/

SELECT name 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

