select * from psRelations

/*

#Question : Find the user who has more follower

find all the pairs of users with maximum number of common folowers

for ex : 
		 1 and 2 have 2 common (3 and 4)

		 1 and 7 have 3 common (3,4,5)

		 2 and 7 have 2 common (3,4)

So , Ans is 1 and 7

*/


# Try 1

select user_id from (select user_id , count(*) as follwers from psRelations group by user_id) a 
where a.follwers IN 
(select max(follwers) from (select user_id , count(*) as follwers from psRelations group by user_id) a)


# Try 2 
with follower_count as
(
select 
t1.user_id  as user1_id,
t1.user_id as user2_id,
count(*) as common_follower_count 
from 
psRelations t1 inner join psRelations t2 on t1.follower_id =t2.follower_id and t1.user_id < t2.user_id 
group by t1.user_id ,t2.user_id 
)
select 
user1_id,
user2_id
from follower_count where common_follower_count = (select max(common_follower_count) from follower_count);

