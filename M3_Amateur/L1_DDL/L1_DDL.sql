/*
DDL
*/

/*
1) CREATE
*/

CREATE TABLE <table_name>
(
<colname-1> DATATYPE (size),
<colname-2> DATATYPE (size),
:,
:,
:
);

use mydb;

CREATE or REPLACE  TABLE emp_info
(
eid TINYINT ,
ename VARCHAR(20),
sal TINYINT,
jdate DATE,
desg VARCHAR(20),
gender VARCHAR(20)
);



# Default Keyword :

Create or replace Table customer
(
Cno int(2),
Cname varchar(20),
City varchar(10) DEFAULT 'Hyderabad'
);


/*
Alter
*/
#It is used to change the structure of the table by

#Adding a Columns
alter table <table_name> 
ADD <col_name> datatype(size);

#Adding a Multiple Columns
alter table <table_name> 
ADD
(
<col_name> datatype(size),
<col_name> datatype(size),
:
:
);

#deleting existed columns

alter table <table_name> 
DROP COLUMN <col_name>;


#changing the datatype and size (increasing / decreasing) of column

alter table <table_name> 
MODIFY <colname> new_datatype(new_size);

#Rename a column with New Name.
alter table <table_name>
RENAME COLUMN<oldcolname>to<newcolname>;

/*
Drop
*/
#It is used to delete any data base object.

drop table <table_name>;



/*
Truncate
*/
#It deletes all the data from the table, it cannot deletes the partial data from a table
#Here the deletion is permanent. We cannot get back or restore deleted data.

truncate table <table_name>;

