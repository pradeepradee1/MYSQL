Create table If Not Exists psLogins (user_id int, time_stamp timestamp);

insert into psLogins (user_id, time_stamp) values ('6', '2020-06-30 15:06:07');
insert into psLogins (user_id, time_stamp) values ('6', '2021-04-21 14:06:06');
insert into psLogins (user_id, time_stamp) values ('6', '2019-03-07 00:18:15');
insert into psLogins (user_id, time_stamp) values ('8', '2020-02-01 05:10:53');
insert into psLogins (user_id, time_stamp) values ('8', '2020-12-30 00:46:50');
insert into psLogins (user_id, time_stamp) values ('2', '2020-01-16 02:49:50');
insert into psLogins (user_id, time_stamp) values ('2', '2019-08-25 07:59:08');
insert into psLogins (user_id, time_stamp) values ('14', '2019-07-14 09:00:00');
insert into psLogins (user_id, time_stamp) values ('14', '2021-01-06 11:59:59');

select * from psLogins

/*
Report the lateset login for all user in the year 2020.Do not include the users who did not login in 2020
*/

SELECT 
user_id ,
max(time_stamp) as last_Stamp
from 
psLogins pl 
where extract(year from time_stamp) = 2020
group by user_id 


select 
	user_id ,
	,max(time_stamp)
from 
	psLogins
where left(CAST(time_stamp as char),4) = 2020
group by user_id 
