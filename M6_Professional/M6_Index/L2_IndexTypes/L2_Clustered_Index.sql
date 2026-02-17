/*
Clustered Index :

            Determines the physical order of rows in the table.
            One per table (because table rows can only be in one order)
            Faster retrieval for range queries (BETWEEN, <, >)
            Usually created on primary key by default

*/


CREATE CLUSTERED INDEX idx_employee_id
ON employees(employee_id);
