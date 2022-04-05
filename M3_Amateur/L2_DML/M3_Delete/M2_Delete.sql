/*
Delete 
*/

use mydb;

create or replace table people
(
id int primary key,
name varchar(100) not null,
gender char(1) not null
);

insert people (id,name,gender) values
(1,'Kathy','f'),(2,'John','m'),(3,'Paul','m'),(4,'Kim','f');

create or replace table pets
(
id int auto_increment primary key,
ownerId int not null,
name varchar(100) not null,
color varchar(100) not null
);

insert pets(ownerId,name,color) values
(1,'Rover','beige'),(2,'Bubbles','purple'),(3,'Spot','black and white'),
(1,'Rover2','white');



#Records Will be Deleted from pets
DELETE p2
FROM 
people p1 JOIN pets p2
ON p2.ownerId = p1.id
WHERE p1.name = 'Paul';

#Records Will be Deleted from both tables
DELETE p1, p2
FROM 
people p1
JOIN pets p2 ON p2.ownerId = p1.id
WHERE p1.name = 'John';


