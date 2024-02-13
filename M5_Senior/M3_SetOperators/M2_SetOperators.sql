/*
Set Operators

*/
use mydb;

#Combining data with different columns
select CNAME as name  from CUST_BR1
union
select CNAME as name from CUST_BR2;

#Combining and merging data on dierent MySQL tables
SELECT YEAR(date_time_column), MONTH(date_time_column), MIN(DATE(date_time_column)),
MAX(DATE(date_time_column)), COUNT(DISTINCT (ip)), COUNT(ip), (COUNT(ip) / COUNT(DISTINCT (ip))) AS Ratio
FROM (
(SELECT date_time_column, ip FROM server_log_1 WHERE state = 'action' AND log_id = 150) UNION
ALL
(SELECT date_time_column, ip FROM server_log_2 WHERE state = 'action' AND log_id = 150) UNION
ALL
(SELECT date_time_column, ip FROM server_log_3 WHERE state = 'action' AND log_id = 150) UNION
ALL
(SELECT date_time_column, ip FROM server_log WHERE state = 'action' AND log_id = 150)
) 
AS table_all
GROUP BY YEAR(date_time_column), MONTH(date_time_column);




