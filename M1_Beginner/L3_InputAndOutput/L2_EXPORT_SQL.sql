/*
EXPORT SQL DUMP OR DATABASE 
*/

# mysqldump -hlocalhost -uroot -ppassword mydb > mydb.sql

# mysqldump db_name table_name > table_name.sql



/*
without data
*/

# mysqldump -h yourhostnameorIP -u root -p --no-data dbname > schema.sql