/*
Single Row Subquery :
                        Returns only one row
                        Used with operators like =, >, <, >=, <=
*/

SELECT name 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
