/*

3️⃣ Given this input table:

sensor_id | log_date | status 
----------|------------|-------- 
A | 2025-08-01 | OK 
A | 2025-08-02 | OK 
A | 2025-08-03 | FAIL 
A | 2025-08-04 | FAIL 
A | 2025-08-05 | OK 

Expected Output:
sensor_id | start_date | end_date | status 
----------|------------|------------|-------- 
A | 2025-08-01 | 2025-08-02 | OK 
A | 2025-08-03 | 2025-08-04 | FAIL 
A | 2025-08-05 | 2025-08-05 | OK 


*/


WITH numbered AS (
    SELECT 
        sensor_id,
        log_date,
        status,
        ROW_NUMBER() OVER (PARTITION BY sensor_id ORDER BY log_date) 
          - ROW_NUMBER() OVER (PARTITION BY sensor_id, status ORDER BY log_date) AS grp
    FROM sensor_logs
)
SELECT 
    sensor_id,
    MIN(log_date) AS start_date,
    MAX(log_date) AS end_date,
    status
FROM numbered
GROUP BY sensor_id, status, grp
ORDER BY sensor_id, start_date;
