Create table If Not Exists Patients_ps (patient_id int, patient_name varchar(30), conditions varchar(100));

insert into Patients_ps (patient_id, patient_name, conditions) values ('1', 'Daniel', 'YFEV COUGH');
insert into Patients_ps (patient_id, patient_name, conditions) values ('2', 'Alice', '');
insert into Patients_ps (patient_id, patient_name, conditions) values ('3', 'Bob', 'DIAB100 MYOP');
insert into Patients_ps (patient_id, patient_name, conditions) values ('4', 'George', 'ACNE DIAB100');
insert into Patients_ps (patient_id, patient_name, conditions) values ('5', 'Alain', 'DIAB201');


select 
	*
from 
	Patients_ps

#Question:
#			Get The Employee who has the diabetes 1 in condition attribute


#Right Approach
select 
	*
from 
	Patients_ps
WHERE conditions like '%DIAB1%'

#Right Approach
select 
	*
from 
	Patients_ps
WHERE conditions REGEXP 'DIAB1'

# It is not working
select 
	*
from 
	Patients_ps
WHERE conditions REGEXP '^[DIAB1]'

#Both Query are same
select 
	*
from 
	Patients_ps
WHERE conditions REGEXP '[DIAB1]'

