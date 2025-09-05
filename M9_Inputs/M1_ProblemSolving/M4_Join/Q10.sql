/*


Questions : Managers with at Least 5 Direct Reports


| emp\_id | emp\_name | manager\_id |
| ------- | --------- | ----------- |
| 1       | John      | NULL        |
| 2       | Alice     | 1           |
| 3       | Bob       | 1           |
| 4       | Charlie   | 1           |
| 5       | David     | 1           |
| 6       | Eva       | 1           |
| 7       | Frank     | 2           |
| 8       | Grace     | 2           |

*/

SELECT 
    m.emp_id AS manager_id,
    m.emp_name AS manager_name,
    COUNT(e.emp_id) AS num_reports
FROM employees e
JOIN employees m
    ON e.manager_id = m.emp_id
GROUP BY m.emp_id, m.emp_name
HAVING COUNT(e.emp_id) >= 5;
