/*

Q:	Delete duplicate email entries based on its largest id ?

*/

create or replace table Temp  (Id int, Email varchar(255));

insert into Temp (Id, Email) 
values 
('1', 'john@example.com'),
('2', 'bob@example.com'),
('3', 'john@example.com');

select * from Temp 




DELETE FROM Temp
WHERE Id IN (
    SELECT Id FROM (
        SELECT Id,
        ROW_NUMBER() OVER (PARTITION BY Email ORDER BY Id DESC) AS rn
        FROM Temp
    ) t
    WHERE rn > 1
);
