/*
1) INSERT
*/						

/*
	1) 	Insert Records With AutoIncerement
	2)  Insert Records From Another Table
*/

use mydb;

CREATE or REPLACE  TABLE iodku 
(
	id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(99) NOT NULL,
	misc INT NOT NULL,
	PRIMARY KEY(id),
	UNIQUE(name)
) ENGINE=InnoDB;


#Insert Into Auto_Increment
insert into 
iodku(id,name,misc)
values
(111,'Kite',75);


insert ignore into 
iodku(id,name,misc)
values
(110,'K',75),
(112,'Kite',75); #WithOut Ignore Keyword Error Will Come




#Insert With Auto_Increment + Last_Insert_ID()
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
('Dana', 789)
ON DUPLICATE KEY UPDATE
id = LAST_INSERT_ID(id),
misc = VALUES(misc);

SELECT LAST_INSERT_ID();


INSERT INTO iodku (name, misc)
VALUES
('Legar', 99);

SELECT LAST_INSERT_ID();


#Lost Auto_Increment ids

CREATE or REPLACE TABLE Burn (
	id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
	name VARCHAR(99) NOT NULL,
	PRIMARY KEY(id),
	UNIQUE(name)
) ENGINE=InnoDB;

INSERT IGNORE INTO Burn (name) 
VALUES 
('first'), ('second');

SELECT LAST_INSERT_ID();

SELECT * FROM Burn ORDER BY id;


INSERT IGNORE INTO Burn (name) VALUES ('second');-- dup 'IGNOREd', but id=3 is burned
SELECT LAST_INSERT_ID();
-- Still "1" -- can't trust in this situation
SELECT * FROM Burn ORDER BY id;

INSERT IGNORE INTO Burn (name) VALUES ('third');
SELECT LAST_INSERT_ID();
-- now "4"
SELECT * FROM Burn ORDER BY id;
-- note that id=3 was skipped over




#2)Insert Records From Another Table

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
where iodku.name <> 'radee'

