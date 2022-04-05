/*
DCL
*/
# By using these commands the DBA can assign permissions or get back permissions
# to / from the users on the data base objects.


/*
GRANT 
*/
# used to assign permissions.

GRANT<Privillage list> On <schemaName.UserName.objectName> TO <servername.schemaname.username>;

GRANT SELECT ON ORCL.USER_1.PRODUCTS TO USER_2;	