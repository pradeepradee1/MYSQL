#Adding comments


-- This is single line comment(Ctrl + /) as like in python

/* This is an in-line comment */

/*
This is a
multiple-line comment
*/



#EXAMPLE

use mydb;
SELECT * FROM car; -- this is comment

#Using Keyword

CREATE or REPLACE TABLE stack1(
id int COMMENT 'You can include genus, but never subspecies.',
name varchar(10)
);


CREATE or REPLACE TABLE bird (
bird_id INT NOT NULL AUTO_INCREMENT,
species VARCHAR(300) DEFAULT NULL COMMENT 'You can include genus, but never subspecies.',
INDEX idx_species (species) COMMENT 'We must search on species often.',
PRIMARY KEY (bird_id)
) ENGINE=InnoDB COMMENT 'This table was inaugurated on February 10th.';

#View Comments
show full columns from bird;

ALTER table bird 
modify column bird_id tinyint comment "Changes in bird_id data type";

#View Comments
show full columns from bird;


#NOTE:
#1) These comments, unlike the others, are saved with the schema and can be retrieved via SHOW CREATE TABLE or from information_schema .

