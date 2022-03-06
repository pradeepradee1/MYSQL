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

/*
REVOKE: 
*/
# Used to get back permissions

REVOKE <Previllage List> On <schemaName.UserName.objectName> 
FROM <servername.schemaname.username>;

REVOKE SELECT ON ORCL.USER_1.PRODUCTS FROM USER-2;