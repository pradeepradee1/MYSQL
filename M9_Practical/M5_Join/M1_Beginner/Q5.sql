

/*

Questions : get all unique pairs of teams from a single-column table


Input :

col1 
----- 
RCB 
CSK 
MI 
PBKS


Expected Output:

team1   team2

RCB     CSK
RCB     MI
RCB     PBKS
CSK     MI
CSK     PBKS
MI      PBKS

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
  ON t1.col1 < t2.col1
ORDER BY t1.col1, t2.col1;


/*
How is this working ?
    Note : This is working based on the alphabetacial order

CSK
MI
PBKS
RCB

*/

