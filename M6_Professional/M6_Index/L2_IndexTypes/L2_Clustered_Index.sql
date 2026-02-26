/*
Clustered Index :

        It Store Physically data on disk and sorts the data in the table
        Only One per table (because table rows can only be in one order)
        It automatically creates on Primary Key
        
        It is used for 
                Range queries (BETWEEN)
                Sorting queries (ORDER BY)
*/


CREATE CLUSTERED INDEX idx_employee_id
ON employees(employee_id);
