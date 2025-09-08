/*

col1 
----- 
RCB 
CSK 
MI 
PBKS

Expected Output:

team1 team2

RCB CSK
RCB MI
RCB PBKS
CSK MI
CSK PBKS
MI PBKS

*/

SELECT t1.col1 AS team1, t2.col1 AS team2
FROM teams t1, teams t2
WHERE t1.col1 < t2.col1
ORDER BY team1, team2;
