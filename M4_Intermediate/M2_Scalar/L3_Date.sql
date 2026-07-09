-- 1) DATE

SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY);
/*#SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);*/
SELECT ADDDATE("2017-06-15", INTERVAL 10 MONTH);
SELECT ADDDATE("2017-06-15", INTERVAL 1 YEAR);


SELECT SUBDATE("2017-06-15", INTERVAL 10 DAY);
/*#SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);*/
SELECT SUBDATE("2017-06-15", INTERVAL 10 MONTH);
SELECT SUBDATE("2017-06-15", INTERVAL 1 year);


SELECT CURRENT_DATE();
/*#SELECT CURDATE();*/

SELECT DATE("2022-12-27");



/*#Date Different*/
SELECT DATEDIFF("2022-12-27", "2022-11-1");
select DATEDIFF(CURRENT_DATE(),ADDDATE(CURRENT_DATE(),INTERVAL 10 day)) 


#EXTRACT

/*#DAY*/
SELECT DAY("2022-12-27");
/*#OP : 27*/
SELECT DAYNAME("2022-12-27");
/*#OP : Tuesday*/


/*#WEEK*/

SELECT WEEK("2022-12-27");
/*#OP : 52*/
SELECT DAYOFWEEK("2022-12-27");
/*#Note: 1=Sunday, 2=Monday, 3=Tuesday, 4=Wednesday, 5=Thursday, 6=Friday, 7=Saturday*/

	
/*
#SELECT EXTRACT(WEEK FROM "2022-12-27");
#Note: 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.
#SELECT WEEKDAY("2022-12-27");
#Note: 1=Sunday, 2=Monday, 3=Tuesday, 4=Wednesday, 5=Thursday, 6=Friday, 7=Saturday.
*/


/* #MONTH */
SELECT MONTH("2022-12-27");
/* # OP : 12 */
SELECT MONTHNAME("2022-12-27");
/* #OP	:	December */
SELECT DAYOFMONTH("2022-12-27");
/* # OP : 27 */

/*
#SELECT EXTRACT(MONTH FROM "2022-12-27");
*/



/* #QUARTER */
SELECT QUARTER("2022-12-27");



/* #YEAR */
SELECT YEAR("2022-12-27");
/* OP : 2022 */
SELECT DAYOFYEAR("2022-12-27");
/* OP : 361 */



/* Data Convert */

/*

Date Format Specifiers

#Day
(d is start)
%d		=	26   	( Day (01–31) )
%e		=	6		( Day (1–31)) )

%W (Mon)=	Monday
%a		=	Mon
(a is ending and day has a)


#Month
(m is start)
%m		=	02		( Month (01–12) )
%c		=	2		( Month (1–12) )

%M		=	February
%b		=	Feb
(b is end, compare with o in month)

#Year
%Y      =	2026     
%y		=	26


*/

/*

Time Format Specifiers

%H		=	14  	( Hour (00–23) )
%h		=	02		( Hour (01–12) )

%i		=	30      ( Minutes )

%s		=	45		( Seconds )

%p		=	PM		( AM / PM )

*/



#Date Format
SELECT DATE_FORMAT("2017-12-27", "%d-%m-%Y");

/*
#Note :
#In DATE_FORMAT functions
# date Format is not important
#SELECT DATE_FORMAT("2017-12-27", "%d-%m/%Y");
*/

#STR_TO_DATE
SELECT STR_TO_DATE("August 10 2017", "%M %d %Y");
SELECT STR_TO_DATE("August/10/2017", "%M/%d/%Y");
SELECT STR_TO_DATE("August 5 2017", "%M %e %Y");
SELECT STR_TO_DATE("Monday  August 14 2017", "%W %M %e %Y");
SELECT STR_TO_DATE("12-27-2017", '%m-%d-%Y');
SELECT STR_TO_DATE('12/31/2011', '%m/%d/%Y');
select STR_TO_DATE('12/27/2022', '%m/%d/%Y')

/*
#Note :
# In STR_TO_DATE functions 
# date Format is important
# IP and OP should be same format
	# Ex: STR_TO_DATE("2024 APR 15","%Y %M %d")

	# We can't do like this
	#STR_TO_DATE("2017-12-27", "%d %m %Y");
	#STR_TO_DATE("2017-12-27", "%d %m /%Y");

*/




