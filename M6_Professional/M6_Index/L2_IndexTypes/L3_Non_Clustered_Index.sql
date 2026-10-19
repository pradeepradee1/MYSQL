/*
Non-Clustered Index

Definition: 
            separate index structure that stores indexed column values along with row
            Multiple per table

            It is Used for
                filtering (WHERE clause)
                Joining (JOIN columns)
                searching columns (select clause)


Note : index structure = B-tree structure 
                

*/

CREATE NONCLUSTERED INDEX idx_employee_name
ON employees(name);
