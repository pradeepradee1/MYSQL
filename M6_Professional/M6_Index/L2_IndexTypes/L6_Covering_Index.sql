/*
Covering Index :

                Special non-clustered index that includes all columns needed by a query
                Query can be satisfied entirely from index without touching the table

*/

CREATE INDEX idx_covering
ON employees(department_id)
INCLUDE (name, salary);
