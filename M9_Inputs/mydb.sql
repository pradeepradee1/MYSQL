-- MariaDB dump 10.19  Distrib 10.5.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	10.5.13-MariaDB-1:10.5.13+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `PROCESS_LIST`
--

DROP TABLE IF EXISTS `PROCESS_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_LIST` (
  `ID` int(11) DEFAULT NULL,
  `CATEGORY` varchar(250) DEFAULT NULL,
  `INTEREST` varchar(250) DEFAULT NULL,
  `PRODUCT` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROCESS_LIST`
--

LOCK TABLES `PROCESS_LIST` WRITE;
/*!40000 ALTER TABLE `PROCESS_LIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROCESS_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persons`
--

DROP TABLE IF EXISTS `Persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persons` (
  `ID` int(11) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  CONSTRAINT `CHK_Person` CHECK (`Age` >= 18 and `City` = 'Sandnes')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persons`
--

LOCK TABLES `Persons` WRITE;
/*!40000 ALTER TABLE `Persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `Persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wheather`
--

DROP TABLE IF EXISTS `Wheather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wheather` (
  `Temp` varchar(250) DEFAULT NULL,
  `Wind` varchar(250) DEFAULT NULL,
  `Event` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wheather`
--

LOCK TABLES `Wheather` WRITE;
/*!40000 ALTER TABLE `Wheather` DISABLE KEYS */;
INSERT INTO `Wheather` VALUES ('32','6','Rain'),('35','7','Sunny'),('28','2','Snow'),('24','7','Snow'),('32','4','Rain'),('31','2','Sunny');
/*!40000 ALTER TABLE `Wheather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bird`
--

DROP TABLE IF EXISTS `bird`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bird` (
  `bird_id` int(11) NOT NULL AUTO_INCREMENT,
  `species` varchar(300) DEFAULT NULL COMMENT 'You can include genus, but never subspecies.',
  PRIMARY KEY (`bird_id`),
  KEY `idx_species` (`species`) COMMENT 'We must search on species often.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table was inaugurated on February 10th.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird`
--

LOCK TABLES `bird` WRITE;
/*!40000 ALTER TABLE `bird` DISABLE KEYS */;
/*!40000 ALTER TABLE `bird` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `car_id` int(10) unsigned NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'first',300.00),(2,'second',300.00),(3,'second',3300.00),(4,NULL,1.00);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_dtls`
--

DROP TABLE IF EXISTS `comp_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_dtls` (
  `cmpId` char(5) NOT NULL,
  `cmpName` varchar(20) NOT NULL,
  `cmpCountry` varchar(20) NOT NULL,
  PRIMARY KEY (`cmpId`),
  CONSTRAINT `ck_country_cmp` CHECK (`cmpCountry` in ('india','usa','japan','uk'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_dtls`
--

LOCK TABLES `comp_dtls` WRITE;
/*!40000 ALTER TABLE `comp_dtls` DISABLE KEYS */;
INSERT INTO `comp_dtls` VALUES ('cmp01','sony','japan'),('cmp02','wipro','india'),('cmp03','Philips','india'),('cmp04','semantic','usa');
/*!40000 ALTER TABLE `comp_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust`
--

DROP TABLE IF EXISTS `cust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust` (
  `cid` char(3) DEFAULT NULL,
  `cname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust`
--

LOCK TABLES `cust` WRITE;
/*!40000 ALTER TABLE `cust` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Cno` int(2) DEFAULT NULL,
  `Cname` varchar(20) DEFAULT NULL,
  `City` varchar(10) DEFAULT 'Hyderabad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'kiran','Hyderabad'),(2,'Madhu','Hyderabad'),(3,'dinesh',NULL),(4,'john','Texas'),(1,'kiran','Hyderabad'),(2,'Madhu','Hyderabad'),(3,'dinesh',NULL),(4,'john','Texas');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_info`
--

DROP TABLE IF EXISTS `emp_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_info` (
  `eid` tinyint(4) DEFAULT NULL,
  `ename` varchar(20) DEFAULT NULL,
  `sal` tinyint(4) DEFAULT NULL,
  `jdate` date DEFAULT NULL,
  `desg` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_info`
--

LOCK TABLES `emp_info` WRITE;
/*!40000 ALTER TABLE `emp_info` DISABLE KEYS */;
INSERT INTO `emp_info` VALUES (111,'Dinesh',75,'2023-04-14','developer','M'),(111,'john',117,'2023-05-14','developer','M'),(112,'dilroop',61,'2021-11-13','developer','F'),(55,'john',12,NULL,'salesman',NULL);
/*!40000 ALTER TABLE `emp_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firsttable`
--

DROP TABLE IF EXISTS `firsttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firsttable` (
  `id` tinyint(4) DEFAULT NULL,
  `marks` decimal(10,0) DEFAULT NULL,
  `marks1` float DEFAULT NULL,
  `marks2` double DEFAULT NULL,
  `check1` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firsttable`
--

LOCK TABLES `firsttable` WRITE;
/*!40000 ALTER TABLE `firsttable` DISABLE KEYS */;
/*!40000 ALTER TABLE `firsttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_DTLS`
--

DROP TABLE IF EXISTS `prod_DTLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_DTLS` (
  `pid` char(4) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `cost` float(7,2) DEFAULT NULL,
  `mfg` date DEFAULT NULL,
  `warrenty` varchar(10) DEFAULT NULL,
  `cmpId` char(5) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_prod_cmpid` (`cmpId`),
  CONSTRAINT `fk_prod_cmpid` FOREIGN KEY (`cmpId`) REFERENCES `comp_dtls` (`cmpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_DTLS`
--

LOCK TABLES `prod_DTLS` WRITE;
/*!40000 ALTER TABLE `prod_DTLS` DISABLE KEYS */;
INSERT INTO `prod_DTLS` VALUES ('p001','smart phone',34000.00,'2012-01-14','1 year','cmp01'),('p002','laptop',54000.00,'2003-01-14','3 years','cmp01'),('p003','Television',24000.00,'2008-08-14','5 years','cmp03'),('p004','Home Theatre',55000.00,'2011-08-13','2 years','cmp03'),('p005','Mobile',24000.00,'2008-08-14','1 year',NULL),('p006','vmware',64000.00,'2022-10-10','1 year','cmp04');
/*!40000 ALTER TABLE `prod_DTLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack`
--

DROP TABLE IF EXISTS `stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack` (
  `stack_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack`
--

LOCK TABLES `stack` WRITE;
/*!40000 ALTER TABLE `stack` DISABLE KEYS */;
INSERT INTO `stack` VALUES (1,'firs',100.00),(2,'second',200.00);
/*!40000 ALTER TABLE `stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack1`
--

DROP TABLE IF EXISTS `stack1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack1` (
  `id` int(11) DEFAULT NULL COMMENT 'You can include genus, but never subspecies.',
  `name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack1`
--

LOCK TABLES `stack1` WRITE;
/*!40000 ALTER TABLE `stack1` DISABLE KEYS */;
/*!40000 ALTER TABLE `stack1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_dtls`
--

DROP TABLE IF EXISTS `stud_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stud_dtls` (
  `rno` int(2) NOT NULL,
  `sname` varchar(10) NOT NULL,
  `course` varchar(15) NOT NULL,
  `fee` int(5) NOT NULL,
  `mobile` char(10) DEFAULT NULL,
  PRIMARY KEY (`rno`),
  UNIQUE KEY `mobile` (`mobile`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`rno` between 1 and 60),
  CONSTRAINT `CONSTRAINT_2` CHECK (`course` in ('oracle','sql server','unix')),
  CONSTRAINT `CONSTRAINT_3` CHECK (`fee` between 5000 and 10000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_dtls`
--

LOCK TABLES `stud_dtls` WRITE;
/*!40000 ALTER TABLE `stud_dtls` DISABLE KEYS */;
INSERT INTO `stud_dtls` VALUES (1,'a','oracle',7000,'1212'),(12,'b','sql server',7000,NULL),(21,'hari','unix',9000,'1211');
/*!40000 ALTER TABLE `stud_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `rno` int(2) NOT NULL,
  `sname` varchar(10) NOT NULL,
  `course` varchar(15) NOT NULL,
  `fee` int(5) NOT NULL,
  `mobile` char(10) DEFAULT NULL,
  PRIMARY KEY (`rno`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (0,'b','java',2000,'8787878787'),(1,'a','oracle',9000,'8989898989'),(2,'x','oracle',9000,NULL),(11,'s','abc',100,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_details` (
  `rno` int(2) NOT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_dtls`
--

DROP TABLE IF EXISTS `student_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_dtls` (
  `rno` int(2) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `course` varchar(7) NOT NULL,
  `fee` tinyint(5) DEFAULT NULL,
  `mobile` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`rno`) COMMENT 'We must search on species often.',
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_dtls`
--

LOCK TABLES `student_dtls` WRITE;
/*!40000 ALTER TABLE `student_dtls` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_dtls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-06 16:48:15
