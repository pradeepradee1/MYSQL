/*
REVOKE: 
*/
# Used to get back permissions

REVOKE <Previllage List> On <schemaName.UserName.objectName> 
FROM <servername.schemaname.username>;

REVOKE SELECT ON ORCL.USER_1.PRODUCTS FROM USER-2;
