create table if not exists pdcinema (id int, movie varchar(255), description varchar(255), rating numeric);

insert into pdcinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9');
insert into pdcinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5');
insert into pdcinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2');
insert into pdcinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6');
insert into pdcinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1');

/*
Question : report the movies with odd-numbered id and a desctiption that is not boring



OP:
		
		1	War	great 	3D				9
		5	House card	Interesting		9



*/


select 
	* 
from 
	pdcinema
where id%2 <>0 and description <> 'boring'
order by rating desc