/*
MERGE statement :

				Oracle’s MERGE statement is used for situations when you want to do an "upsert"
				i.e. update existing rows in a table or insert new rows depending on a match condition. This
				is typically the case when you have to synchronize a table periodically with data from
				another source (table/view/query)


*/
#Syntax:

MERGE into <target table>
USING
<source table/view/result of subquery>
ON
<match condition>
WHEN MATCHED THEN
<update clause>
<delete clause>
WHEN NOT MATCHED THEN
<insert clause>


#EXAMPLE
select * from student;

select * from student_n;


/*
As you can see, the following actions are required on table STUDENT:
1 row for id#7 to be corrected for score: Ruth had scored 690, not 680.
1 row for id#8 to be corrected for name: the student is called Spicer, not Spacer.
3 new rows (ids#9,10,11) to be inserted into STUDENT table.

Note: 5 rows should get processed in all.
*/

merge into student a
using
(select id, name, score
from student_n) b
on (a.id = b.id)
when matched then
update set a.name = b.name
, a.score = b.score
when not matched then
insert (a.id, a.name, a.score)
values (b.id, b.name, b.score);


select * from student;





