/*
Single Row Subquery :
                        Returns only one row
                        Used with operators like =, >, <, >=, <= (relational operator)
*/

SELECT name 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

