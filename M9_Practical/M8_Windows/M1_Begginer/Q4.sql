/*

Running Total with restrictions

Q : find running total score for each gender at each day

Q : cumulative score by gender ordered by date

*/

CREATE or replace TABLE pScores 
(
    player_name VARCHAR(50),
    gender CHAR(1),
    day DATE,
    score_points INT
);


INSERT INTO pScores (player_name, gender, day, score_points) VALUES
('Aron', 'F', '2020-01-01', 17),
('Alice', 'F', '2020-01-07', 23),
('Bajrang', 'M', '2020-01-07', 7),
('Khali', 'M', '2019-12-25', 11),
('Slaman', 'M', '2019-12-30', 13),
('Joe', 'M', '2019-12-31', 3),
('Jose', 'M', '2019-12-18', 2),
('Priya', 'F', '2019-12-31', 23),
('Priyanka', 'F', '2019-12-30', 17);


select * from pScores

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



SELECT 
    gender,
    day,
    SUM(score_points) OVER (PARTITION BY gender ORDER BY day) AS cumulative_score
FROM
(
    SELECT gender,day,SUM(score_points) AS score_points
    FROM pScores
    GROUP BY gender, day
) t
ORDER BY gender, day;
