#Adding comments

# This comment continues to the end of line
-- This comment continues to the end of line
/* This is an in-line comment */
/*
This is a
multiple-line comment
*/

#EXAMPLE:
SELECT * FROM t1; -- this is comment

CREATE TABLE stack(
/*id_user int,
username varchar(30),
password varchar(30)
*/
id int
);


CREATE TABLE menagerie.bird (
bird_id INT NOT NULL AUTO_INCREMENT,
species VARCHAR(300) DEFAULT NULL COMMENT 'You can include genus, but never subspecies.',
INDEX idx_species (species) COMMENT 'We must search on species often.',
PRIMARY KEY (bird_id)
) ENGINE=InnoDB COMMENT 'This table was inaugurated on February 10th.';


#NOTE:
#These comments, unlike the others, are saved with the schema and can be retrieved via SHOW CREATE TABLE or from information_schema .

