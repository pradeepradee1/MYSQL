/*
Non-Clustered Index

Definition: 
            Separate structure from table; contains pointers to table rows
            Multiple per table allowed
            Faster lookup but table rows remain unordered


*/

CREATE NONCLUSTERED INDEX idx_employee_name
ON employees(name);
