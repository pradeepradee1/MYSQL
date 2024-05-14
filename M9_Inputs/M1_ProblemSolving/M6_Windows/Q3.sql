/*

# Running Total with restrictions

Q : find running total score for each gender at each day

*/

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



select 
gender,
day,
sum(score_points) over(PARTITION by gender order by day) as total
from pScores ps 
order by gender
