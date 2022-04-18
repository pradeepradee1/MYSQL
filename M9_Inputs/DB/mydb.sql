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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `AccountID` int(10) unsigned NOT NULL,
  `AccountNo` int(10) unsigned NOT NULL,
  `PersonID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `PersonID` (`PersonID`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BC_NF`
--

DROP TABLE IF EXISTS `BC_NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BC_NF` (
  `StudentID` int(11) DEFAULT NULL,
  `SubjectName` varchar(80) DEFAULT NULL,
  `Profesor` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BC_NF`
--

LOCK TABLES `BC_NF` WRITE;
/*!40000 ALTER TABLE `BC_NF` DISABLE KEYS */;
INSERT INTO `BC_NF` VALUES (10,'SQL','Prof.SQL'),(20,'Python','Prof.Python'),(30,'Java','Prof.Java'),(50,'SQL','Prof.SQL');
/*!40000 ALTER TABLE `BC_NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BC_NF_1`
--

DROP TABLE IF EXISTS `BC_NF_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BC_NF_1` (
  `StudentID` int(11) DEFAULT NULL,
  `ProfesorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BC_NF_1`
--

LOCK TABLES `BC_NF_1` WRITE;
/*!40000 ALTER TABLE `BC_NF_1` DISABLE KEYS */;
INSERT INTO `BC_NF_1` VALUES (10,100),(20,101),(30,102),(50,100);
/*!40000 ALTER TABLE `BC_NF_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BC_NF_2`
--

DROP TABLE IF EXISTS `BC_NF_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BC_NF_2` (
  `ProfesorID` int(11) DEFAULT NULL,
  `Subject` varchar(10) DEFAULT NULL,
  `Profesor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BC_NF_2`
--

LOCK TABLES `BC_NF_2` WRITE;
/*!40000 ALTER TABLE `BC_NF_2` DISABLE KEYS */;
INSERT INTO `BC_NF_2` VALUES (10,'SQL','Prof_SQL'),(20,'Java','Prof_Java'),(30,'python','Prof_python'),(50,'SQL','Prof_SQL');
/*!40000 ALTER TABLE `BC_NF_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Burn`
--

DROP TABLE IF EXISTS `Burn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Burn` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Burn`
--

LOCK TABLES `Burn` WRITE;
/*!40000 ALTER TABLE `Burn` DISABLE KEYS */;
INSERT INTO `Burn` VALUES (1,'first'),(2,'second'),(4,'third');
/*!40000 ALTER TABLE `Burn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUST_BR1`
--

DROP TABLE IF EXISTS `CUST_BR1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUST_BR1` (
  `CID` char(3) DEFAULT NULL,
  `CNAME` varchar(20) DEFAULT NULL,
  `MOBILE` int(10) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUST_BR1`
--

LOCK TABLES `CUST_BR1` WRITE;
/*!40000 ALTER TABLE `CUST_BR1` DISABLE KEYS */;
INSERT INTO `CUST_BR1` VALUES ('C1','VIJAY',1212121212,'HYD','MALE'),('C2','JOHN',1313131313,'DELHI','MALE'),('C3','SWATHI',1414141414,'HYD','FEMALE');
/*!40000 ALTER TABLE `CUST_BR1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUST_BR2`
--

DROP TABLE IF EXISTS `CUST_BR2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUST_BR2` (
  `CID` char(3) DEFAULT NULL,
  `CNAME` varchar(20) DEFAULT NULL,
  `MOBILE` bigint(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUST_BR2`
--

LOCK TABLES `CUST_BR2` WRITE;
/*!40000 ALTER TABLE `CUST_BR2` DISABLE KEYS */;
INSERT INTO `CUST_BR2` VALUES ('C1','KIRAN',9898989898,'HYD','MALE'),('C2','JOHN',1313131313,'DELHI','MALE'),('C3','LAKSHMI',8989898989,'DELHI','FEMALE');
/*!40000 ALTER TABLE `CUST_BR2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUST_BR3`
--

DROP TABLE IF EXISTS `CUST_BR3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUST_BR3` (
  `CID` char(3) DEFAULT NULL,
  `CNAME` varchar(20) DEFAULT NULL,
  `MOBILE` bigint(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUST_BR3`
--

LOCK TABLES `CUST_BR3` WRITE;
/*!40000 ALTER TABLE `CUST_BR3` DISABLE KEYS */;
INSERT INTO `CUST_BR3` VALUES ('C1','KIRAN',9898989898,'HYD','MALE'),('C2','JOHN',1313131313,'DELHI','MALE'),('C5','VINAY',7878787878,'DELHI','MALE');
/*!40000 ALTER TABLE `CUST_BR3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClonedPersons`
--

DROP TABLE IF EXISTS `ClonedPersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClonedPersons` (
  `LastName` varchar(66) NOT NULL,
  `FirstName` varchar(66) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClonedPersons`
--

LOCK TABLES `ClonedPersons` WRITE;
/*!40000 ALTER TABLE `ClonedPersons` DISABLE KEYS */;
INSERT INTO `ClonedPersons` VALUES ('10','100');
/*!40000 ALTER TABLE `ClonedPersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `First_1NF`
--

DROP TABLE IF EXISTS `First_1NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `First_1NF` (
  `EmployeeID` int(11) DEFAULT NULL,
  `EmployeeName` varchar(80) DEFAULT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `First_1NF`
--

LOCK TABLES `First_1NF` WRITE;
/*!40000 ALTER TABLE `First_1NF` DISABLE KEYS */;
INSERT INTO `First_1NF` VALUES (10,'First',4444455555,60),(20,'Second',99999,20),(30,'Third',11111,10),(50,'Fourth',2222299999,30);
/*!40000 ALTER TABLE `First_1NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `First_1NF_2`
--

DROP TABLE IF EXISTS `First_1NF_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `First_1NF_2` (
  `EmployeeID` int(11) DEFAULT NULL,
  `EmployeeName` varchar(80) DEFAULT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `First_1NF_2`
--

LOCK TABLES `First_1NF_2` WRITE;
/*!40000 ALTER TABLE `First_1NF_2` DISABLE KEYS */;
INSERT INTO `First_1NF_2` VALUES (10,'First',44444,60),(10,'First',55555,60),(20,'Second',99999,20),(30,'Third',11111,10),(50,'Fourth',99999,30),(50,'Fourth',99999,30);
/*!40000 ALTER TABLE `First_1NF_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModifiedPersons`
--

DROP TABLE IF EXISTS `ModifiedPersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ModifiedPersons` (
  `PersonID` int(10) unsigned NOT NULL,
  `FullName` double DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModifiedPersons`
--

LOCK TABLES `ModifiedPersons` WRITE;
/*!40000 ALTER TABLE `ModifiedPersons` DISABLE KEYS */;
INSERT INTO `ModifiedPersons` VALUES (1,110);
/*!40000 ALTER TABLE `ModifiedPersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PER_INCR`
--

DROP TABLE IF EXISTS `PER_INCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PER_INCR` (
  `INCRID` int(11) DEFAULT NULL,
  `INCRVAL` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PER_INCR`
--

LOCK TABLES `PER_INCR` WRITE;
/*!40000 ALTER TABLE `PER_INCR` DISABLE KEYS */;
INSERT INTO `PER_INCR` VALUES (101,'5%','Min INcrement'),(102,'10%','Second level INcrement'),(103,'15%','3rd level INcrement'),(104,'25%','Max level INcrement');
/*!40000 ALTER TABLE `PER_INCR` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `PersonID` int(10) unsigned NOT NULL,
  `LastName` varchar(66) NOT NULL,
  `FirstName` varchar(66) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(66) DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'10','100','chennai','chennai');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Second_2NF`
--

DROP TABLE IF EXISTS `Second_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Second_2NF` (
  `EmployeeID` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `OfficeLocation` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Second_2NF`
--

LOCK TABLES `Second_2NF` WRITE;
/*!40000 ALTER TABLE `Second_2NF` DISABLE KEYS */;
INSERT INTO `Second_2NF` VALUES (10,100,'pune'),(11,111,'Cheanni'),(12,123,'delhi'),(13,134,'Mumbai');
/*!40000 ALTER TABLE `Second_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Second_2NF_1`
--

DROP TABLE IF EXISTS `Second_2NF_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Second_2NF_1` (
  `EmployeeID` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Second_2NF_1`
--

LOCK TABLES `Second_2NF_1` WRITE;
/*!40000 ALTER TABLE `Second_2NF_1` DISABLE KEYS */;
INSERT INTO `Second_2NF_1` VALUES (10,100),(11,111),(12,123),(13,134);
/*!40000 ALTER TABLE `Second_2NF_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Second_2NF_2`
--

DROP TABLE IF EXISTS `Second_2NF_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Second_2NF_2` (
  `EmployeeID` int(11) DEFAULT NULL,
  `Office` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Second_2NF_2`
--

LOCK TABLES `Second_2NF_2` WRITE;
/*!40000 ALTER TABLE `Second_2NF_2` DISABLE KEYS */;
INSERT INTO `Second_2NF_2` VALUES (10,'pune'),(11,'Benguluru'),(12,'Delhi'),(13,'Chennai');
/*!40000 ALTER TABLE `Second_2NF_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seond_1NF`
--

DROP TABLE IF EXISTS `Seond_1NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seond_1NF` (
  `EmployeeID` int(11) DEFAULT NULL,
  `EmployeeName` varchar(80) DEFAULT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seond_1NF`
--

LOCK TABLES `Seond_1NF` WRITE;
/*!40000 ALTER TABLE `Seond_1NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seond_1NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestLastUpdate`
--

DROP TABLE IF EXISTS `TestLastUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestLastUpdate` (
  `ID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `LastUpdate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Last Update';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestLastUpdate`
--

LOCK TABLES `TestLastUpdate` WRITE;
/*!40000 ALTER TABLE `TestLastUpdate` DISABLE KEYS */;
INSERT INTO `TestLastUpdate` VALUES (1,'tmp','No:11','2022-04-11 11:00:38');
/*!40000 ALTER TABLE `TestLastUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Third_NF`
--

DROP TABLE IF EXISTS `Third_NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Third_NF` (
  `StudentID` int(11) DEFAULT NULL,
  `StudentName` varchar(80) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `SubjectName` varchar(80) DEFAULT NULL,
  `Address` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Third_NF`
--

LOCK TABLES `Third_NF` WRITE;
/*!40000 ALTER TABLE `Third_NF` DISABLE KEYS */;
INSERT INTO `Third_NF` VALUES (10,'A',100,'SQL','GOA'),(11,'B',101,'Python','Chennai'),(12,'C',102,'Java','Adyar'),(13,'D',103,'spark','AI');
/*!40000 ALTER TABLE `Third_NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Third_NF_1`
--

DROP TABLE IF EXISTS `Third_NF_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Third_NF_1` (
  `StudentID` int(11) DEFAULT NULL,
  `StudentName` varchar(80) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `Address` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Third_NF_1`
--

LOCK TABLES `Third_NF_1` WRITE;
/*!40000 ALTER TABLE `Third_NF_1` DISABLE KEYS */;
INSERT INTO `Third_NF_1` VALUES (10,'A',100,'GOA'),(11,'B',101,'Chennai'),(12,'C',102,'Adyar'),(13,'D',103,'AI');
/*!40000 ALTER TABLE `Third_NF_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Third_NF_2`
--

DROP TABLE IF EXISTS `Third_NF_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Third_NF_2` (
  `SubjectID` int(11) DEFAULT NULL,
  `Subject` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Third_NF_2`
--

LOCK TABLES `Third_NF_2` WRITE;
/*!40000 ALTER TABLE `Third_NF_2` DISABLE KEYS */;
INSERT INTO `Third_NF_2` VALUES (100,'GOA'),(101,'Chennai'),(102,'Adyar'),(103,'AI');
/*!40000 ALTER TABLE `Third_NF_2` ENABLE KEYS */;
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
INSERT INTO `car` VALUES (3,'second',3300.00),(4,NULL,1.00);
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
INSERT INTO `customer` VALUES (1,'kiran','Hyderabad'),(2,'Madhu','Hyderabad'),(3,'dinesh',NULL),(4,'john','Texas'),(NULL,'Radee','Hyderabad');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `dno` tinyint(4) DEFAULT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `loc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (10,'Productions','Hyderabad'),(20,'Sales','Hyderabad'),(30,'Finance','Chennai');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `eid` tinyint(4) DEFAULT NULL,
  `ename` varchar(20) DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `dno` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (5,'C',1000,NULL),(6,'S',1300,NULL),(7,'D',2300,NULL),(8,'X',1200,NULL),(9,'B',2200,NULL),(1,'A',2000,10),(2,'X',1200,10),(3,'A',3400,30),(4,'Z',5000,10),(10,'V',5000,30);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
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
  `sal` int(11) DEFAULT NULL,
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
INSERT INTO `emp_info` VALUES (111,'AB',11,'2023-04-14','developer','M'),(111,'AB',11,'2023-05-14','developer','M'),(112,'BC',14,'2021-11-13','Senior Developer','F'),(55,'aa',12,NULL,'salesman',NULL),(112,'BC',14,'0002-04-20','Senior Developer','M'),(113,'CD',22,'2022-04-20','developer','F');
/*!40000 ALTER TABLE `emp_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_info_child`
--

DROP TABLE IF EXISTS `emp_info_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_info_child` (
  `eid` tinyint(4) DEFAULT NULL,
  `ename` varchar(20) DEFAULT NULL,
  `sal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_info_child`
--

LOCK TABLES `emp_info_child` WRITE;
/*!40000 ALTER TABLE `emp_info_child` DISABLE KEYS */;
INSERT INTO `emp_info_child` VALUES (111,'AB',11),(111,'AB',11),(112,'BC',14),(112,'BC',14),(113,'CD',22);
/*!40000 ALTER TABLE `emp_info_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_mgr`
--

DROP TABLE IF EXISTS `emp_mgr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_mgr` (
  `eid` tinyint(4) DEFAULT NULL,
  `ename` varchar(20) DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `dno` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_mgr`
--

LOCK TABLES `emp_mgr` WRITE;
/*!40000 ALTER TABLE `emp_mgr` DISABLE KEYS */;
INSERT INTO `emp_mgr` VALUES (3,'A',3400,30);
/*!40000 ALTER TABLE `emp_mgr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `emp_mgr_info`
--

DROP TABLE IF EXISTS `emp_mgr_info`;
/*!50001 DROP VIEW IF EXISTS `emp_mgr_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `emp_mgr_info` (
  `eid` tinyint NOT NULL,
  `ename` tinyint NOT NULL,
  `sal` tinyint NOT NULL,
  `dno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `finance_informations`
--

DROP TABLE IF EXISTS `finance_informations`;
/*!50001 DROP VIEW IF EXISTS `finance_informations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `finance_informations` (
  `eid` tinyint NOT NULL,
  `ename` tinyint NOT NULL,
  `sal` tinyint NOT NULL,
  `dno` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
-- Table structure for table `invoice_line_items`
--

DROP TABLE IF EXISTS `invoice_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_line_items` (
  `LineNum` smallint(5) unsigned NOT NULL,
  `InvoiceNum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`InvoiceNum`,`LineNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_line_items`
--

LOCK TABLES `invoice_line_items` WRITE;
/*!40000 ALTER TABLE `invoice_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iodku`
--

DROP TABLE IF EXISTS `iodku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iodku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `misc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iodku`
--

LOCK TABLES `iodku` WRITE;
/*!40000 ALTER TABLE `iodku` DISABLE KEYS */;
INSERT INTO `iodku` VALUES (1,'A',1000),(2,'B',3333),(4,'C',1000),(5,'X',1000);
/*!40000 ALTER TABLE `iodku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iodkuchild`
--

DROP TABLE IF EXISTS `iodkuchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iodkuchild` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(99) NOT NULL,
  `misc` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iodkuchild`
--

LOCK TABLES `iodkuchild` WRITE;
/*!40000 ALTER TABLE `iodkuchild` DISABLE KEYS */;
INSERT INTO `iodkuchild` VALUES (1,'Leslie',123),(2,'Sally',3333),(3,'Dana',789);
/*!40000 ALTER TABLE `iodkuchild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mergeproducts`
--

DROP TABLE IF EXISTS `mergeproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mergeproducts` (
  `productid` int(11) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mergeproducts`
--

LOCK TABLES `mergeproducts` WRITE;
/*!40000 ALTER TABLE `mergeproducts` DISABLE KEYS */;
INSERT INTO `mergeproducts` VALUES (1,'parle G',100),(2,'butter',200),(3,'pista',300);
/*!40000 ALTER TABLE `mergeproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mergeproducts_child`
--

DROP TABLE IF EXISTS `mergeproducts_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mergeproducts_child` (
  `productid` int(11) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mergeproducts_child`
--

LOCK TABLES `mergeproducts_child` WRITE;
/*!40000 ALTER TABLE `mergeproducts_child` DISABLE KEYS */;
INSERT INTO `mergeproducts_child` VALUES (1,'parle G',100),(2,'butter',350),(3,'pista',450),(4,'dark',500),(5,'white',600);
/*!40000 ALTER TABLE `mergeproducts_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners` (
  `owner_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `owner` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Ben'),(2,'Jim'),(3,'Harry'),(6,'John'),(9,'Ellie');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Kathy','f'),(3,'Paul','m'),(4,'Kim','f');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,1,'Rover','beige'),(4,1,'Rover2','white');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
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
  KEY `fk` (`cmpId`),
  CONSTRAINT `fk` FOREIGN KEY (`cmpId`) REFERENCES `comp_dtls` (`cmpId`)
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
-- Temporary table structure for view `sales_informations`
--

DROP TABLE IF EXISTS `sales_informations`;
/*!50001 DROP VIEW IF EXISTS `sales_informations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `sales_informations` (
  `dno` tinyint NOT NULL,
  `dname` tinyint NOT NULL,
  `loc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stack`
--

DROP TABLE IF EXISTS `stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack` (
  `id_user` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `submit_date` datetime NOT NULL,
  `newcolumn` date NOT NULL,
  `newcolumn1` date DEFAULT NULL,
  `newcolumn11` date DEFAULT NULL,
  `newcolumn2` date DEFAULT NULL,
  `newcolumn12` date DEFAULT NULL,
  `newcolumn333` time DEFAULT NULL,
  KEY `stack_index` (`id_user`,`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack`
--

LOCK TABLES `stack` WRITE;
/*!40000 ALTER TABLE `stack` DISABLE KEYS */;
/*!40000 ALTER TABLE `stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack1`
--

DROP TABLE IF EXISTS `stack1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack1` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `stack2`
--

DROP TABLE IF EXISTS `stack2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack2` (
  `id_user` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `submit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack2`
--

LOCK TABLES `stack2` WRITE;
/*!40000 ALTER TABLE `stack2` DISABLE KEYS */;
/*!40000 ALTER TABLE `stack2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stack3`
--

DROP TABLE IF EXISTS `stack3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack3` (
  `LastName` int(11) NOT NULL,
  `FirstName` varchar(66) DEFAULT NULL,
  PRIMARY KEY (`LastName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stack3`
--

LOCK TABLES `stack3` WRITE;
/*!40000 ALTER TABLE `stack3` DISABLE KEYS */;
INSERT INTO `stack3` VALUES (10,'100');
/*!40000 ALTER TABLE `stack3` ENABLE KEYS */;
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
INSERT INTO `stud_dtls` VALUES (1,'a','oracle',7000,'1212'),(21,'hari','unix',9000,'1211');
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
  PRIMARY KEY (`rno`),
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

--
-- Table structure for table `tmp`
--

DROP TABLE IF EXISTS `tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp` (
  `rno` int(2) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `course` varchar(7) DEFAULT NULL,
  `fee` tinyint(5) DEFAULT NULL,
  `mobile` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`rno`),
  UNIQUE KEY `tmpmobilepkcn` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp`
--

LOCK TABLES `tmp` WRITE;
/*!40000 ALTER TABLE `tmp` DISABLE KEYS */;
INSERT INTO `tmp` VALUES (1,'first','sql',20,12);
/*!40000 ALTER TABLE `tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools` (
  `tool_id` int(11) NOT NULL AUTO_INCREMENT,
  `tool` varchar(30) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools`
--

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;
INSERT INTO `tools` VALUES (1,'Hammer',9),(2,'Pliers',1),(3,'Knife',1),(4,'Chisel',2),(5,'Hacksaw',1),(6,'Level',NULL),(7,'Wrench',NULL),(8,'Tape Measure',9),(9,'Screwdriver',NULL),(10,'Clamp',NULL);
/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_emp_dept_info`
--

DROP TABLE IF EXISTS `vw_emp_dept_info`;
/*!50001 DROP VIEW IF EXISTS `vw_emp_dept_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_emp_dept_info` (
  `ename` tinyint NOT NULL,
  `sal` tinyint NOT NULL,
  `dname` tinyint NOT NULL,
  `loc` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `emp_mgr_info`
--

/*!50001 DROP TABLE IF EXISTS `emp_mgr_info`*/;
/*!50001 DROP VIEW IF EXISTS `emp_mgr_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emp_mgr_info` AS select `emp`.`eid` AS `eid`,`emp`.`ename` AS `ename`,`emp`.`sal` AS `sal`,`emp`.`dno` AS `dno` from `emp` where `emp`.`dno` = 30 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `finance_informations`
--

/*!50001 DROP TABLE IF EXISTS `finance_informations`*/;
/*!50001 DROP VIEW IF EXISTS `finance_informations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `finance_informations` AS select `e`.`eid` AS `eid`,`e`.`ename` AS `ename`,`e`.`sal` AS `sal`,`e`.`dno` AS `dno` from (`emp` `e` join `dept` `d` on(`e`.`dno` = `d`.`dno`)) where `d`.`dname` = 'Finance' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_informations`
--

/*!50001 DROP TABLE IF EXISTS `sales_informations`*/;
/*!50001 DROP VIEW IF EXISTS `sales_informations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_informations` AS select `dept`.`dno` AS `dno`,`dept`.`dname` AS `dname`,`dept`.`loc` AS `loc` from `dept` where `dept`.`dname` = 'Sales' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_emp_dept_info`
--

/*!50001 DROP TABLE IF EXISTS `vw_emp_dept_info`*/;
/*!50001 DROP VIEW IF EXISTS `vw_emp_dept_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_emp_dept_info` AS select `emp`.`ename` AS `ename`,`emp`.`sal` AS `sal`,`dept`.`dname` AS `dname`,`dept`.`loc` AS `loc` from (`emp` join `dept` on(`emp`.`dno` = `dept`.`dno`)) where `dept`.`dname` = 'Finance' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18  8:47:53
