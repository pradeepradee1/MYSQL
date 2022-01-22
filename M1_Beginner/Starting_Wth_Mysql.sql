
#Creating The Databases
CREATE database mydatabase;

#Useing The Database
use mydatabase;

#Creating The Table in Mysql
Create table mytable
(
id int not null auto_increment,
name varchar(100) not null,
email varchar(100) not null,
primary key (id)
);

#Inserting a Row into a mysql table
insert into mytable (name,email)
values ("pradeep","pradeepradee1@gmail.com");

#Note:
#We can also use single quotes
insert into mytable (name,email)
values ('pradeep1','pradeepradee1@gmail.com');

#Update a Row into a mysql table
update mytable set name="pradeep1" where id=2

#Delete w Row into a mysql table
delete from mytable where id=3

#Selecting rows based on the conditions in mysql
select * from mytable m where id = 2


#showing list of database
show databases;

#showing list of tables
show tables;

#showing all the fields of a table
describe mydatabase.mytable ;

#OR

describe mytable ;


#Creating The User
create user 'username'@'localhost' identified by 'some_password';

#we can also create user that can only connect on the local machine where the database is hosted
create user 'username'@'%' identified by 'some_password';


#Adding Privileges

# Grant common basic privileges to the user for all tables of the specified database
grant SELECT,INSERT,UPDATE on mydatabase.* TO 'username'@'localhost' ;

# grant all Privileges to the user for all tables on ALL databases
GRANT all on *.* to 'username'@'localhost' WITH GRANT OPTION ;


# To avoid confilt words between keyword or reserved words and identifier 
## we are using back-tick(`)
CREATE table `table` 
(
`firstname` varchar(100)
)
;

select `firstname` from `table`

#Note I will get error on below query 
select `firstname` from table


#schema Examples

select * from information_schema.PROCESSLIST p order by INFO DESC , Time Desc ;


SELECT ID , USER ,  HOST , DB , COMMAND ,
TIME as time_seconds,
ROUND(TIME/60,2) as time_minutes,
ROUND(TIME/60/60,2) as time_hours,
STATE , INFO
from information_schema.PROCESSLIST p order by info DESC , time desc;


select * from information_schema.ROUTINES r where ROUTINE_DEFINITION like '%word%'





