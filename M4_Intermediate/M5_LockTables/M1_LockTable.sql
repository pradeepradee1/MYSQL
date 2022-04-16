/*
Lock Table :
				If the tables use InnoDB, MySQL automatically uses row level locking so that multiple transactions 
				can use same table simultaneously for read and write, without making each other wait
				
				If two transactions trying to modify the same row and both uses row level locking, 
				one of the transactions waits for the other to complete
				
Row Level Locking in detail:
				
Consider two connections,
*/

#Connection 1 :
START TRANSACTION;

SELECT ledgerAmount FROM accDetails 
WHERE id = 1 FOR UPDATE;
				
#Connection 2 :
UPDATE accDetails 
SET ledgerAmount = ledgerAmount + 500 
WHERE id=1;

/*
Note :
		When some one try to update same row in connection 2, that will wait for connection 1 
		to ﬁnish transaction or error message will be displayed according to the 
		innodb_lock_wait_timeout setting, which defaults to 50 seconds
*/


use mydb;
#Note : To view details about this lock,

show engine innodb status

select * FROM tmp;

#Lock Table Explicitly
LOCK TABLES tmp READ;
LOCK TABLES tmp write;

SHOW OPEN TABLES 
where In_use > 0 and `Database` = 'mydb' and `Table` = 'tmp';

#UnLock Table Explicitly
UNLOCK TABLES;

SHOW OPEN TABLES 
where In_use > 0 and `Database` = 'mydb' and `Table` = 'tmp';


