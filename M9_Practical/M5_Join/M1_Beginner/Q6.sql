/*

Questions : 
            IPL match schedule with Home & Away, each team must play twice with every other team

Input :

col1 
----- 
RCB 
CSK 
MI 
PBKS


Expected Output :

| home_team | away_team |
| --------- | --------- |
| CSK       | MI        |
| CSK       | PBKS      |
| CSK       | RCB       |
| MI        | CSK       |
| MI        | PBKS      |
| MI        | RCB       |
| PBKS      | CSK       |
| PBKS      | MI        |
| PBKS      | RCB       |
| RCB       | CSK       |
| RCB       | MI        |
| RCB       | PBKS      |

*/


/*

CREATE or replace TABLE teams (
    col1 VARCHAR(10)
);

INSERT INTO teams (col1) VALUES
('RCB'),
('CSK'),
('MI'),
('PBKS');

*/

SELECT t1.col1 AS team1, t2.col1 AS team2
FROM teams t1
JOIN teams t2
  ON t1.col1 <> t2.col1
ORDER BY t1.col1, t2.col1;



