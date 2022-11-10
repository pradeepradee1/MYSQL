/*
INSERT
*/						

/*
	1)  Insert Records From Another Table
*/


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

