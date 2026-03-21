/*

find the top 3 highest paid employees in each department.

*/

/*

Sample Input :

id | name | department | salary
---|------|------------|--------
1  | John | Sales      | 60000
2  | Jane | Sales      | 55000
3  | Bob  | Marketing  | 65000
4  | Sue  | Marketing  | 70000
5  | Mike | IT         | 80000
6  | Lisa | IT         | 75000

Sample Output :

id | name | department | salary
---|------|------------|--------
1  | John | Sales      | 60000
2  | Jane | Sales      | 55000
3  | Bob  | Marketing  | 65000
4  | Sue  | Marketing  | 70000
5  | Mike | IT         | 80000
6  | Lisa | IT         | 75000



CREATE or replace TABLE employees3 ( 
 id INT, 
 name VARCHAR(50), 
 department VARCHAR(50), 
 salary INT 
); 

INSERT INTO employees3 VALUES (1, 'John', 'Sales', 60000); 
INSERT INTO employees3 VALUES (2, 'Jane', 'Sales', 55000); 
INSERT INTO employees3 VALUES (3, 'Bob', 'Marketing', 65000); 
INSERT INTO employees3 VALUES (4, 'Sue', 'Marketing', 70000); 
INSERT INTO employees3 VALUES (5, 'Mike', 'IT', 80000); 
INSERT INTO employees3 VALUES (6, 'Lisa', 'IT', 75000); 

*/


WITH cte AS (
    SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn
    FROM employees3
)
SELECT 
    id,
    name,
    department,
    salary
FROM cte
WHERE rn <= 3
ORDER BY department, salary DESC;