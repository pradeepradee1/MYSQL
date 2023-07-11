Create table  pScores (player_name varchar(20), gender varchar(1), day date, score_points int);

insert into pScores (player_name, gender, day, score_points) values ('Aron', 'F', '2020-01-01', '17');
insert into pScores (player_name, gender, day, score_points) values ('Alice', 'F', '2020-01-07', '23');
insert into pScores (player_name, gender, day, score_points) values ('Bajrang', 'M', '2020-01-07', '7');
insert into pScores (player_name, gender, day, score_points) values ('Khali', 'M', '2019-12-25', '11');
insert into pScores (player_name, gender, day, score_points) values ('Slaman', 'M', '2019-12-30', '13');
insert into pScores (player_name, gender, day, score_points) values ('Joe', 'M', '2019-12-31', '3');
insert into pScores (player_name, gender, day, score_points) values ('Jose', 'M', '2019-12-18', '2');
insert into pScores (player_name, gender, day, score_points) values ('Priya', 'F', '2019-12-31', '23');
insert into pScores (player_name, gender, day, score_points) values ('Priyanka', 'F', '2019-12-30', '17');



/*

Q : Write Query to find total score for each gender at each day

*/

/*
	Output:

				F	2019-12-31	40
				F	2020-01-01	57
				F	2019-12-30	17
				F	2020-01-07	80
				M	2020-01-07	36
				M	2019-12-25	13
				M	2019-12-30	26
				M	2019-12-31	29
				M	2019-12-18	2

*/



select 
gender,
day,
sum(score_points) over(PARTITION by gender order by day) as total
from pScores ps 
order by gender
