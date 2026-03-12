/*
Question : report the movies id with odd-numbered and a desctiption that is not boring


CREATE or replace TABLE Temp (
    id INT,
    title VARCHAR(50),
    description VARCHAR(50),
    rating INT
);

INSERT INTO Temp (id, title, description, rating) VALUES
(1, 'War', 'great 3D', 9),
(2, 'Science', 'fiction', 9),
(3, 'irish', 'boring', 6),
(4, 'Ice song', 'Fantacy', 9),
(5, 'House card', 'Interesting', 9);


OP:
		
		1	War	great 	3D				9
		5	House card	Interesting		9



*/

select * from Temp 


select 
	* 
from 
	pdcinema
where id%2 <>0 and description <> 'boring'
order by rating desc



#Response 2
select 
	* 
from 
	pdcinema as a 
where a.id mod 2 != 0 and a.description not like "%boring%"
