/*
Export Database Or Table Dump
*/

#Note:
/*
> = export
*/

/*
with data
*/

# sudo mysqldump  mydb  > database_with_data.sql

# sudo mysqldump  mydb car > table_with_data.sql

#OR

# mysqldump -uroot -ppassword mydb > database_with_data.sql

# mysqldump -uroot -ppassword mydb car > table_with_data.sql







/*
without data
*/

# sudo mysqldump --no-data mydb  > database_without_data.sql

#OR

# mysqldump -uroot -ppassword --no-data mydb > database_without_data.sql

# mysqldump -uroot -ppassword --no-data  mydb car > table_without_data.sql



