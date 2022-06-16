/*
Export Database Or Table Dump
*/

#Note:
/*
> = Export
*/

/*
with data
*/

# sudo mysqldump  mydb  > database_name.sql

# sudo mysqldump  mydb car > table_name.sql

#OR

# mysqldump -uroot -ppassword mydb > database_name.sql

# mysqldump -uroot -ppassword mydb car > table_name.sql







/*
without data
*/

# sudo mysqldump --no-data mydb  > database_name.sql

#OR

# mysqldump -uroot -ppassword --no-data mydb > database_name.sql

# mysqldump -uroot -ppassword --no-data  mydb car > table_name.sql



