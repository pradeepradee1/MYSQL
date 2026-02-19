/*
Non-Clustered Index

Definition: 
            Separate index structure from table and stores index key + pointers to table rows
            Multiple per table

            It is Best for
                WHERE conditions
                Frequently searched columns
                JOIN columns

*/

CREATE NONCLUSTERED INDEX idx_employee_name
ON employees(name);
