/*

how to query employee manager hireachery

*/

CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee VALUES (1, 'CEO', NULL);
INSERT INTO employee VALUES (2, 'John', 1);
INSERT INTO employee VALUES (3, 'Mary', 1);
INSERT INTO employee VALUES (4, 'David', 2);
INSERT INTO employee VALUES (5, 'Alice', 2);
INSERT INTO employee VALUES (6, 'Bob', 4);

/*

| emp_id | emp_name | manager_id |
| ------ | -------- | ---------- |
| 1      | CEO      | NULL       |
| 2      | John     | 1          |
| 3      | Mary     | 1          |
| 4      | David    | 2          |
| 5      | Alice    | 2          |
| 6      | Bob      | 4          |


| employee | manager |
| -------- | ------- |
| CEO      | NULL    |
| John     | CEO     |
| Mary     | CEO     |
| David    | John    |
| Alice    | John    |
| Bob      | David   |

*/



WITH RECURSIVE emp_hierarchy AS
(
    SELECT emp_id,
           emp_name,
           manager_id,
           1 AS lvl
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id,
           e.emp_name,
           e.manager_id,
           h.lvl + 1
    FROM employee e
    JOIN emp_hierarchy h
      ON e.manager_id = h.emp_id
)
SELECT *
FROM emp_hierarchy;