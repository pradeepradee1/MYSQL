/*

Problem Statement : 
		Calculate unique user count for each day (Customer should not repeat in another day)
		(for ex: user_id 1 should not repeat in another day)

Sample Input
date       	user_id   activity	
2022-02-20		1		abc
2022-02-20		2		xyz
2022-02-22		1		xyz
2022-02-22		3		klm
2022-02-24		1		abc
2022-02-24		2		abc
2022-02-24		3		abc




Output : 

date       	user_id   
2022-02-20		2
2022-02-22		1	
2022-02-24		0	




*/



create or replace table user_activity(date date,user_id int,activity varchar(50));

insert into user_activity values('2022-02-20',1,"abc");
insert into user_activity values('2022-02-20',2,"xyz");
insert into user_activity values('2022-02-22',1,"xyz");
insert into user_activity values('2022-02-22',3,"klm");
insert into user_activity values('2022-02-24',1,"abc");
insert into user_activity values('2022-02-24',2,"abc");
insert into user_activity values('2022-02-24',3,"abc");


select * from user_activity;


SELECT 
    first_date AS date,
    COUNT(user_id) AS user_count
FROM (
    SELECT 
        user_id,
        MIN(date) AS first_date
    FROM user_activity
    GROUP BY user_id
) t
GROUP BY first_date
ORDER BY first_date




WITH all_dates AS (SELECT DISTINCT date FROM user_activity),
first_users AS (SELECT user_id, MIN(date) AS first_date FROM user_activity GROUP BY user_id)
SELECT 
    d.date,
    COUNT(f.user_id) AS user_count
FROM all_dates d
LEFT JOIN first_users f
    ON d.date = f.first_date
GROUP BY d.date
ORDER BY d.date;
