/*
Composite :

            Index on on multiple columns
            It is Useful when queries filter by multiple columns

*/

CREATE INDEX idx_dept_salary
ON employees(department_id, salary);

