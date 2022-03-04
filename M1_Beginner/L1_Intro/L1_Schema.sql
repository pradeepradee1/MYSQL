#SCHEMAS
#Here we can see DB ,command status(sleeping or process) ,memory used status, etc

SELECT 
* 
FROM 
information_schema.PROCESSLIST 
ORDER BY INFO DESC, TIME DESC




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



