/*
#Character classes:

[abc] 			=	Either a or b or c
[^abc] 			=	Except a and b and c
[a-z] 			=	Lower alpha
[A-Z] 			=	Upper alpha
[0-9] 			=	Numeric
[a-zA-Z0-9] 	=	alphanumeric
[^a-zA-Z0-9] 	=	Except alphanumeric(Special Characters)


#Pre defined Character classes:
#Note : Pre defined class is not working

\s 				=	Space Character
\S 				=	Except Space Character
\w 				=	Alphanumeric [a-zA-Z0-9]
\W 				=	except Alphanumeric (Special Characters)
\d 				=	Numerical
\D 				=	Except Numerical
.  				=	Any character including special characters

#Quantifier

[]?				=	occurs 0 or 1 time 			# i didn't get it
[]*				=	occurs 0 or moretime
[]+				=	occurs 1 or moretimes
[]{n}			=	occurs n time
[]{n,}			=	occurs n or more time
[]{y,z}			=	occurs atleast y time but less than z time
^x 				= 	It will check whether target string starts with x or not
x$ 				= 	It will check whether target string ends with x or not



#Example

1) Mobile Number start with 8 or 9 and total digit = 10
		
		[89][0-9]{9}

2)First Character upper case , contains lower case alaphbets, only one digit allowed in between
		
		[A-Z][a-z]*[0-9][a-z]*

3) Email ID (Pradeepradee1@gmail.com)
		
		[a-zA-Z0-9_\-\.]+[@][a-z]+[\.][a-z]{2,3}
		


*/
