/*

Pivot Table :
		
		11	english	88
		11	tamil	66
		11	maths	85
		12	english	81
		12	tamil	71
		12	maths	100

Output Table :
		
		id 		 englishMarks 	tamilMarks	mathsMarks
		11 			88				66			85
		12 			81				71			100


*/



create table ps3
(
id tinyint,
subject varchar(50),
marks int
)

insert into ps3 
values (11,"english",88),(11,"tamil",66),(11,"maths",85),(12,"english",81),(12,"tamil",71),(12,"maths",100)

select * from ps3

select 
	*,
	CASE when ps3.subject = "english" then ps3.marks else 0 END as english_details,
	CASE when ps3.subject = "tamil" then ps3.marks else 0 END as tamil_details,
	CASE when ps3.subject = "maths" then ps3.marks else 0 END as maths_details
from 
	ps3

select 
	*,
	CASE when ps3.subject = "english" then ps3.marks else 0 END as english_details,
	CASE when ps3.subject = "tamil" then ps3.marks else 0 END as tamil_details,
	CASE when ps3.subject = "maths" then ps3.marks else 0 END as maths_details
from 
	ps3
group by 
	ps3.id 

select 
	*,
	sum(CASE when ps3.subject = "english" then ps3.marks else 0 END) as english_details,
	sum(CASE when ps3.subject = "tamil" then ps3.marks else 0 END) as tamil_details,
	sum(CASE when ps3.subject = "maths" then ps3.marks else 0 END) as maths_details
from 
	ps3
group by
	ps3.id

