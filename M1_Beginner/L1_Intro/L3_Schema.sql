#SCHEMAS
#show all active & sleeping queries
#Here we can see DB ,command status(sleeping or process) ,memory used status, etc

SELECT 
* 
FROM 
information_schema.PROCESSLIST 
ORDER BY INFO DESC, TIME DESC


#Note : We can also kill the process list using ID in SQL query (Like sudo service mysql status)

#For Example	: kill ID (SQL query)


SELECT ID, USER, HOST, DB, COMMAND,
TIME as time_seconds,
ROUND(TIME / 60, 2) as time_minutes,
ROUND(TIME / 60 / 60, 2) as time_hours,
STATE, INFO
FROM information_schema.PROCESSLIST ORDER BY INFO DESC, TIME DESC;



SELECT 
* 
FROM 
information_schema.ROUTINES 
WHERE ROUTINE_DEFINITION LIKE '%word%';





