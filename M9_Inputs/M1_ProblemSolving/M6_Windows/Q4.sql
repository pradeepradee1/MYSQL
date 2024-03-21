/*
date       	user_id   activity	
2022-02-20		1		abc
2022-02-20		2		xyz
2022-02-22		1		xyz
2022-02-22		3		klm
2022-02-24		1		abc
2022-02-24		2		abc
2022-02-24		3		abc

Problem Statement : Calculate unique user count for each day (Customer should not repeat in another day)
															 (for ex: user_id 1 should not repeat in another day)

Output : 

date       	user_id   
2022-02-20		2
2022-02-22		1	
2022-02-24		0	




*/



create table user_activity(date date,user_id int,activity varchar(50));

insert into user_activity values('2022-02-20',1,"abc");
insert into user_activity values('2022-02-20',2,"xyz");
insert into user_activity values('2022-02-22',1,"xyz");
insert into user_activity values('2022-02-22',3,"klm");
insert into user_activity values('2022-02-24',1,"abc");
insert into user_activity values('2022-02-24',2,"abc");
insert into user_activity values('2022-02-24',3,"abc");


select * from user_activity;


with user_login as (
	select 
	* 
	from 
	(
		SELECT 
		*,
		row_number() over(partition by user_id order by date ) as seq_num
		from 
			user_activity
	) temp 
	where 
		seq_num = 1
	)

select 
	t1.`date`,
	case when t2.`date` is null then 0 else t2.unique_user_count end as unique_user_count
	from 
		(select distinct (`date`) from user_activity) t1 
	left join 
		(select `date`,count(*) as unique_user_count from user_login group by `date`) t2 
	on t1.`date` = t2.`date`
;

	