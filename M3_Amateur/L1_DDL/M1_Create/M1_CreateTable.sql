/*
DDL
*/

/*
1) Create a Table
*/

CREATE TABLE <table_name>
(
<colname-1> DATATYPE (size),
<colname-2> DATATYPE (size),
:,
:,
:
);

use mydb;


CREATE or REPLACE  TABLE Person
(
`PersonID` INT,
`LastName` VARCHAR(80),
`FirstName` VARCHAR(80),
`Address` VARCHAR(80),
`City` VARCHAR(80)
)Engine=InnoDB;

#Note
#Where Engine  is an optional parameter used to specify the table storage engine.


#Default Keyword 
Create or replace Table customer
(
Cno int(2),
Cname varchar(20),
City varchar(10) DEFAULT 'Hyderabad'
);

#PrimaryKey
CREATE or REPLACE  TABLE Person 
(
PersonID INT UNSIGNED PRIMARY KEY,
LastName VARCHAR(66) NOT NULL,
FirstName VARCHAR(66),
Address VARCHAR(255),
City VARCHAR(66)
);


CREATE or REPLACE TABLE Person 
( 
PersonID INT UNSIGNED NOT NULL,
LastName VARCHAR(66) NOT NULL,
FirstName VARCHAR(66),
Address VARCHAR(255),
City VARCHAR(66),
PRIMARY KEY (PersonID)
);


#Multiple PrimaryKey
CREATE or REPLACE TABLE invoice_line_items 
(
LineNum SMALLINT UNSIGNED NOT NULL,
InvoiceNum INT UNSIGNED NOT NULL,
PRIMARY KEY (InvoiceNum, LineNum)
);


#Foreign KEY 
CREATE or REPLACE  TABLE Account (
AccountID INT UNSIGNED NOT NULL,
AccountNo INT UNSIGNED NOT NULL,
PersonID INT UNSIGNED,
PRIMARY KEY (AccountID),
FOREIGN KEY (PersonID) REFERENCES Person (PersonID)
) ENGINE=InnoDB;

#Note: foreign-key constraints are supported under the InnoDB storage engine (not MyISAM or MEMORY)




#Create Table With Time Stamp
CREATE or REPLACE  TABLE `TestLastUpdate` 
(
`ID` INT NULL,
`Name` VARCHAR(50) NULL,
`Address` VARCHAR(50) NULL,
`LastUpdate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
COMMENT='Last Update'
;



