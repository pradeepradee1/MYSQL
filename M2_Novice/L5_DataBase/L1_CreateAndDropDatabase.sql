/*
Create And Drop Database
*/

#Create
CREATE DATABASE Baseball;

CREATE DATABASE IF NOT EXISTS Baseball; -- If the database already exists, Error 1007 is returned.


#Drop
DROP DATABASE IF EXISTS Baseball;

DROP DATABASE xyz; -- If xyz does not exist, ERROR 1008 will occur




#Create a DataBase With CharacterSet
CREATE DATABASE Baseball CHARACTER SET utf8 COLLATE utf8_general_ci;

SHOW CREATE DATABASE Baseball;

SELECT @@character_set_database as cset,@@collation_database as col;






