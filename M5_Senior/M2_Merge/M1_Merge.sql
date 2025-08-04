/*
Merge Statement : Not Supported in MYSQL

It also known as "upsert" 
It is used to perform insert, update, or delete operations in a single statement

#Note
Explain the merge statement

Merging the target table using source table with equi join conditions
when matched then update statement will execute
when not matched then insert statment will execute
					
*/

use mydb;

MERGE INTO target_table AS target 
USING source_table AS source
ON target.id = source.id
WHEN MATCHED THEN
    UPDATE SET target.name = source.name
WHEN NOT MATCHED THEN
    INSERT (id, name) VALUES (source.id, source.name);



/*


Explanation :

MERGE INTO target_table: Specifies the table you want to update or insert into.

USING source_table: The table or dataset that has the new data.

ON condition: Defines how rows are matched between source and target.

WHEN MATCHED: Defines what happens when a match is found.

WHEN NOT MATCHED: Defines what happens when no match is found in the target



*/



