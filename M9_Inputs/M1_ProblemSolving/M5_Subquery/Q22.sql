/*
Find Employees Whose Manager Left the Company 

Input: 
Employees table:
+-------------+-----------+------------+--------+
| employee_id | name | manager_id | salary |
+-------------+-----------+------------+--------+
| 3 | Mila | 9 | 60301 |
| 12 | Antonella | null | 31000 |
| 13 | Emery | null | 67084 |
| 1 | Kalel | 11 | 21241 |
| 9 | Mikaela | null | 50937 |
| 11 | Joziah | 6 | 28485 |
+-------------+-----------+------------+--------+

Output: 
+-------------+
| employee_id |
+-------------+
| 11 |
+-------------+


*/


/*Solution 1: Subquery with NOT IN */

SELECT employee_id
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN 
 (SELECT DISTINCT employee_id FROM Employees)
ORDER BY employee_id;


/* Solution 2: Self LEFT JOIN */

SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id
WHERE e.salary < 30000
 AND m.employee_id IS NULL
 AND e.manager_id IS NOT NULL
ORDER BY e.employee_id;