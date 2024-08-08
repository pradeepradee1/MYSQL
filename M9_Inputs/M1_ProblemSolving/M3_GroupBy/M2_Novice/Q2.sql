# Questions : 
# Find the user and number of the days between each user's first and last post.






select 
	user_id,
	max(Post_date) - min(Post_date) as diff_date
from 
	posts
group by 
	user_id
having count(*) > 1

