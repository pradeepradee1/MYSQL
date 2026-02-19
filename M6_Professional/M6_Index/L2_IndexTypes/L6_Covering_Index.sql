/*
Covering Index :

                It is Special non-clustered index that includes all columns 
                Query can be satisfied entirely without touching the table

*/

CREATE INDEX idx_covering
ON employees(department_id)
INCLUDE (name, salary);
