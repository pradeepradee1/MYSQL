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

