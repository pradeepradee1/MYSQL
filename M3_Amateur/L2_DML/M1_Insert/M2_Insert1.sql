/*
INSERT
*/						

/*
	1) 	AutoIncerement
	2)	Unique Constraint (Igonre and Included)
	3)  Insert Records From Another Table
*/

use mydb;

CREATE or REPLACE  TABLE iodku 
(
	id INT unsigned AUTO_INCREMENT,
	name VARCHAR(10),
	misc INT,
	PRIMARY KEY(id),
	UNIQUE(name)
) ENGINE=InnoDB;


#Auto_Increment
insert into iodku(id,name,misc)
values
(100,'Kite',75);

insert into iodku(name,misc)
values
('Kite123',75);

#Unique Constraint (Igonre)
insert ignore into iodku(id,name,misc)
values
(102,'K',75),
(103,'Kite',95); 
#WithOut Ignore Keyword Error Will Come 
#because name columns has unique constraints
#(103,'Kite',95) will be ignored


#Unique Constraint (Included)
TRUNCATE table iodku 

INSERT INTO iodku (name, misc)
VALUES
('Leslie', 123),
('Sally', 456);


INSERT INTO iodku (name, misc)
VALUES
('Sally', 3333)
ON DUPLICATE KEY UPDATE
id = LAST_INSERT_ID(id),
misc = VALUES(misc);

SELECT LAST_INSERT_ID();


INSERT INTO iodku (name, misc)
VALUES
('Dana', 789);

SELECT LAST_INSERT_ID();

INSERT INTO iodku (name, misc)
VALUES
('Legar', 99);

SELECT LAST_INSERT_ID();


#Insert Records From Another Table
CREATE or REPLACE  TABLE iodkuchild 
(
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(99) NOT NULL,
	misc INT NOT NULL,
	PRIMARY KEY(id),
	UNIQUE(name)
) ENGINE=InnoDB;

Insert into iodkuchild (name,misc)
select iodku.name ,iodku.misc 
from iodku 
where iodku.name <> 'Legar'

