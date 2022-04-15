/*
REVOKE: 
*/
# Used to get back permissions

/*
Syntax:
REVOKE <Previllage List> On <schemaName.UserName.objectName> FROM <servername.schemaname.username>;
*/

SHOW GRANTS FOR 'radee'@'%';

REVOKE ALL privileges ON mydb.Account  FROM  'radee'@'%';

SHOW GRANTS FOR 'radee'@'%';
