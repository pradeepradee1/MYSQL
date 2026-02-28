/*

Query names in alphabetical order with the first letter of their profession in parentheses.

Example :
                  Alice(D), 
                  Bob(A).
And

Count the number of individuals in each profession and format the output as:

There are a total of [count] [profession]s.

Example : 

          There are a total of 1 professors.
          There are a total of 2 actors.
          There are a total of 2 doctors.
          There are a total of 2 singers.

*/

-- 𝐂𝐫𝐞𝐚𝐭𝐞 𝐭𝐡𝐞 𝐎𝐂𝐂𝐔𝐏𝐀𝐓𝐈𝐎𝐍𝐒 𝐭𝐚𝐛𝐥𝐞 
CREATE or replace TABLE Temp ( name VARCHAR(50), occupation VARCHAR(50) ); 
-- 𝐈𝐧𝐬𝐞𝐫𝐭 𝐬𝐚𝐦𝐩𝐥𝐞 𝐝𝐚𝐭𝐚 𝐢𝐧𝐭𝐨 𝐭𝐡𝐞 𝐎𝐂𝐂𝐔𝐏𝐀𝐓𝐈𝐎𝐍𝐒 𝐭𝐚𝐛𝐥𝐞 
INSERT INTO Temp (name, occupation) 
VALUES ('Alice', 'Doctor'), ('Bob', 'Actor'), ('Charlie', 'Singer'), ('David', 'Actor'), 
('Eve', 'Professor'), ('Frank', 'Singer'), ('Grace', 'Doctor');


/*
 
 𝐐𝐮𝐞𝐫𝐲 𝟏: 𝐀𝐥𝐩𝐡𝐚𝐛𝐞𝐭𝐢𝐜𝐚𝐥𝐥𝐲 𝐎𝐫𝐝𝐞𝐫𝐞𝐝 𝐍𝐚𝐦𝐞𝐬 𝐰𝐢𝐭𝐡 𝐅𝐢𝐫𝐬𝐭 𝐋𝐞𝐭𝐭𝐞𝐫 𝐨𝐟 𝐏𝐫𝐨𝐟𝐞𝐬𝐬𝐢𝐨𝐧 
 
*/

SELECT  
	name,
	occupation,
	concat(name,'(',Left(occupation,1),')')
FROM 
	Temp 


/*

𝐐𝐮𝐞𝐫𝐲 𝟐: 𝐂𝐨𝐮𝐧𝐭 𝐨𝐟 𝐄𝐚𝐜𝐡 𝐎𝐜𝐜𝐮𝐩𝐚𝐭𝐢𝐨𝐧

*/

SELECT 
CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.') AS occupation_summary
FROM Temp
GROUP BY occupation
ORDER BY COUNT(*) ASC, occupation ASC;

