/*
DCL
*/

# By using these commands the DBA can assign permissions or get back permissions
# to / from the users on the data base objects.

/*
GRANT 
*/
# used to assign permissions.

/*
Syntax:
GRANT<Privillage list> On <schemaName.UserName.objectName> TO <servername.schemaname.username>;
*/

use mydb;

CREATE USER 'radee'@'%' IDENTIFIED BY 'password';

SELECT user,host,password 
from mysql.user 

SHOW GRANTS FOR 'radee'@'%';

GRANT ALL ON mydb.Account  TO 'radee'@'%';

SHOW GRANTS FOR 'radee'@'%';

/*
Privillage List
1) ALL				=	Complete Access
2) Create 			=	Create database and tables
3) drop				=	Drop database and tables
4) Insert			=	Insert a rows
5) update			=	update a rows
6) Delete			=	Delete a rows from table
7) select			=	select data from a database
8) Grant options	=	user to grant or remove another user's privillage
9) Execute			=	user to execute stored routines
10) show database	=	user to view list of all database

 */

