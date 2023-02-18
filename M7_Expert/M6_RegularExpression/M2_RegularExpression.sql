/*
[abc]		=	a,b or c
[^abc]		=	Except  a,b or c  # i didn't get it
[a-z]		=	a to z
[A-Z]		=	A to Z
[a-zA-Z]	=	a to z,A to Z
[0-9]		=	0 to 9


#Quantifier

[]?			=	occurs 0 or 1 time 			# i didn't get it
[]*			=	occurs 0 or moretime
[]+			=	occurs 1 or moretimes
[]{n}		=	occurs n time
[]{n,}		=	occurs n or more time
[]{y,z}		=	occurs atleast y time but less than z time

#regex metacharacters
# Shortform
# \ tells comp to treat follwing character as search chatracter for '+' '''

\d			=	[0-9]
\^			=	[^0-9]
\w			=	[a-zA-Z_0-9]
\W			=	[^\w]


#Example

1) Mobile Number start with 8 or 9 and total digit = 10
		
		[89][0-9]{9}

2)First Character upper case , contains lower case alaphbets, only one digit allowed in between
		
		[A-Z][a-z]*[0-9][a-z]*

3) Email ID (Pradeepradee1@gmail.com)
		
		[a-zA-Z0-9_\-\.]+[@][a-z]+[\.][a-z]{2,3}
		


*/
