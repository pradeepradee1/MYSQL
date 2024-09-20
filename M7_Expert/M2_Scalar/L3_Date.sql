-- 1) DATE

SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY);
#SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);


SELECT SUBDATE("2017-06-15", INTERVAL 10 DAY);
#SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);


SELECT CURRENT_DATE();
#SELECT CURDATE();


SELECT DATE("2022-12-27");

#EXTRACT

#DAY
SELECT DAY("2022-12-27");
SELECT DAYNAME("2022-12-27");



#WEEK

SELECT WEEK("2022-12-27");
SELECT DAYOFWEEK("2022-12-27");

#SELECT EXTRACT(WEEK FROM "2022-12-27");
#Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.
#SELECT WEEKDAY("2022-12-27");
#Note: 1=Sunday, 2=Monday, 3=Tuesday, 4=Wednesday, 5=Thursday, 6=Friday, 7=Saturday.




#MONTH
SELECT MONTH("2022-12-27");
SELECT DAYOFMONTH("2022-12-27");
SELECT MONTHNAME("2022-12-27");
#SELECT EXTRACT(MONTH FROM "2022-12-27");



#QUARTER
SELECT QUARTER("2022-12-27");



#YEAR
SELECT YEAR("2022-12-27");
SELECT DAYOFYEAR("2022-12-27");


#Date Format
SELECT DATE_FORMAT("2017-12-27", "%d-%m-%Y");

#Note :
#In DATE_FORMAT functions
# date Format is not important
#SELECT DATE_FORMAT("2017-12-27", "%d-%m/%Y");


#STR_TO_DATE
SELECT STR_TO_DATE("August 10 2017", "%M %d %Y");
SELECT STR_TO_DATE("August/10/2017", "%M/%d/%Y");
SELECT STR_TO_DATE("August 5 2017", "%M %e %Y");
SELECT STR_TO_DATE("Monday  August 14 2017", "%W %M %e %Y");
SELECT STR_TO_DATE("12-27-2017", '%m-%d-%Y');
SELECT STR_TO_DATE('12/31/2011', '%m/%d/%Y');
select STR_TO_DATE('12/27/2022', '%m/%d/%Y')

#Note :
# In STR_TO_DATE functions 
# date Format is important
# IP and OP should be same format
	# Ex: STR_TO_DATE("2024 APR 15","%Y %M %d")

	# We can't do like this
	#STR_TO_DATE("2017-12-27", "%d %m %Y");
	#STR_TO_DATE("2017-12-27", "%d %m /%Y");

# OP is constant format (2020-08-10)


#Date Different
SELECT DATEDIFF("2022-12-27", "2022-11-1");
select DATEDIFF(CURRENT_DATE(),ADDDATE(CURRENT_DATE(),INTERVAL 10 day)) 

#MakeDate
SELECT MAKEDATE(2017, 3);











