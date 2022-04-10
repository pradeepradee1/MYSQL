/*
Create User And Password For Database
Grant a Database For New User
*/


#Create User And Password For Database
use Baseball;

CREATE USER 'John123'@'%' IDENTIFIED BY 'password123';
CREATE USER 'John456'@'%' IDENTIFIED BY 'somePassword';


# Here I can able login mysql by using John123 as UserName and password123 as Password
# For ex : mysql -uJohn123 -ppassword123

SELECT user,host,password 
from mysql.user 
where user in ('John123','John456');




#Grant A Permission For New User in Database 

GRANT ALL ON Baseball.* TO 'John123'@'%';
GRANT SELECT ON Baseball.* TO 'John456'@'%';
SHOW GRANTS FOR 'John123'@'%';
SHOW GRANTS FOR 'John456'@'%';


