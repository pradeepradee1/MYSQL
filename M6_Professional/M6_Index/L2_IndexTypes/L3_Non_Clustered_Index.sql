/*
Non-Clustered Index

Definition: 
            Separate data structure from table then the stores indexed column values along with row
            Multiple per table

            It is Used for
                filtering (WHERE conditions)
                Joining (JOIN columns)
                Frequently searched columns
                

*/

CREATE NONCLUSTERED INDEX idx_employee_name
ON employees(name);
