
CREATE TABLE partitioning_employees 
(
id INT NOT NULL,
fname VARCHAR(30),
lname VARCHAR(30),
hired DATE NOT NULL DEFAULT '1970-01-01',
separated DATE NOT NULL DEFAULT '9999-12-31',
job_code INT NOT NULL,
store_id INT NOT NULL
);


desc partitioning_employees;

#1) Range Partition

ALTER TABLE employees PARTITION BY RANGE (store_id) 
(
PARTITION p0 VALUES LESS THAN (6),
PARTITION p1 VALUES LESS THAN (11),
PARTITION p2 VALUES LESS THAN (16),
PARTITION p3 VALUES LESS THAN MAXVALUE
);

#2) List Partition

ALTER TABLE partitioning_employees PARTITION BY LIST(store_id) 
(
PARTITION pNorth VALUES IN (3,5,6,9,17),
PARTITION pEast VALUES IN (1,2,10,11,19,20),
PARTITION pWest VALUES IN (4,12,13,14,18),
PARTITION pCentral VALUES IN (7,8,15,16)
);

#3) Hash Partition

# Hash :	Partitioning by HASH is used primarily to ensure an even distribution of data 
#			among a predetermined number of partitions.

CREATE or replace TABLE partitioning_employees 
(
id INT NOT NULL,
fname VARCHAR(30),
lname VARCHAR(30),
hired DATE NOT NULL DEFAULT '1970-01-01',
separated DATE NOT NULL DEFAULT '9999-12-31',
job_code INT NOT NULL,
store_id INT NOT NULL
)
PARTITION BY HASH(store_id)
PARTITIONS 4;

#partitions defaults to 1.