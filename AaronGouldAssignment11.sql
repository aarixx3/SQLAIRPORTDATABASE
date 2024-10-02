CREATE DATABASE  IF NOT EXISTS `airline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airline`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: airline
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(50) NOT NULL,
  `icaoCode` varchar(5) NOT NULL,
  `model` varchar(50) NOT NULL,
  `engineClass` enum('Piston','Jet','Turboprop') NOT NULL DEFAULT 'Turboprop',
  `numEngine` int NOT NULL DEFAULT '1',
  `numSeat` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Acro Sport','ACRO','Acro Sport','Piston',1,10),(2,'Adam Aircraft Industries','A500','A-500','Piston',2,20),(3,'Beechcraft','B18T','Model 18 Turboliner','Turboprop',2,40),(4,'Boeing','B743','747-300SR','Jet',4,75),(5,'Cessna','C526','CitationJet','Jet',2,50),(6,'Embraer','E170','EMB 175-E2','Jet',2,30),(7,'Globe Aircraft/TEMCO','GC1','GC-1B Globe','Piston',1,40),(8,'Israel Aircraft Industries','WW23','1123 Westwind','Jet',4,60),(9,'North American Rockwell','SBR1','Sabre 40/60','Jet',2,50),(10,'Piper','PA18','PA-18-150 Super Cub','Piston',1,30);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `airlinemanifestview`
--

DROP TABLE IF EXISTS `airlinemanifestview`;
/*!50001 DROP VIEW IF EXISTS `airlinemanifestview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `airlinemanifestview` AS SELECT 
 1 AS `Name`,
 1 AS `Phone Number`,
 1 AS `Role`,
 1 AS `Origin`,
 1 AS `Departure`,
 1 AS `Destination`,
 1 AS `Arrival`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `faa` char(3) NOT NULL,
  `icao` char(4) NOT NULL,
  `cityServed` char(5) NOT NULL,
  PRIMARY KEY (`faa`),
  UNIQUE KEY `icao` (`icao`),
  KEY `cityServed` (`cityServed`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`cityServed`) REFERENCES `citystate` (`zipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('DAB','KDAB','32114'),('ECP','KECP','32401'),('EYW','KEYW','33041'),('FLL','KFLL','33301'),('GNV','KGNV','32601'),('JAX','KJAX','32099'),('MCO','KMCO','32801'),('MIA','KMIA','33109'),('MLB','KMLB','32904'),('PBI','KPBI','33401'),('PGD','KPGD','33950'),('PIE','KPIE','33701'),('PNS','KPNS','32501'),('RSW','KRSW','33900'),('SFB','KSFB','32771'),('SRQ','KSRQ','34231'),('TLH','KTLH','32301'),('TPA','KTPA','33602'),('VPS','KVPS','32547');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citystate`
--

DROP TABLE IF EXISTS `citystate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citystate` (
  `city` varchar(90) NOT NULL,
  `state` char(2) NOT NULL,
  `zipCode` char(5) NOT NULL,
  PRIMARY KEY (`zipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citystate`
--

LOCK TABLES `citystate` WRITE;
/*!40000 ALTER TABLE `citystate` DISABLE KEYS */;
INSERT INTO `citystate` VALUES ('Trumbull','CT','06611'),('Paterson','NJ','07501'),('Piscataway','NJ','08854'),('Ballston Spa','NY','12020'),('Havertown','PA','19083'),('Waldorf','MD','20601'),('Glenarden','MD','20706'),('Chesterfield','VA','23832'),('Abingdon','VA','24210'),('Indian Trail','NC','28079'),('Mooresville','NC','28115'),('Clover','SC','29710'),('Duluth','GA','30096'),('Jacksonville','FL','32099'),('Daytona Beach','FL','32114'),('Tallahassee','FL','32301'),('Panama City','FL','32401'),('Pensacola','FL','32501'),('Fort Walton Beach','FL','32547'),('Gainesville','FL','32601'),('Sanford','FL','32771'),('Orlando','FL','32801'),('Melbourne','FL','32904'),('Key West','FL','33041'),('Miami','FL','33109'),('Fort Lauderdale','FL','33301'),('West Palm Beach','FL','33401'),('Jupiter','FL','33458'),('Tampa','FL','33602'),('St. Petersburg','FL','33701'),('Fort Myers','FL','33900'),('Punta Gorda','FL','33950'),('Sarasota','FL','34231'),('Nashville','TN','37205'),('Memphis','TN','38117'),('Vicksburg','MS','39180'),('Willoughby','OH','44094'),('Cuyahoga Falls','OH','44223'),('Chillicothe','OH','45601'),('Noblesville','IN','46060'),('Battle Creek','MI','49016'),('Jefferson','LA','70121'),('Covington','LA','70433'),('Scottsdale','AZ','85260'),('Ontario','CA','91764'),('San Marcos','CA','92078'),('Huntington Beach','CA','92647'),('Santa Cruz','CA','95060');
/*!40000 ALTER TABLE `citystate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(90) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `zipCode` (`zipCode`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`zipCode`) REFERENCES `citystate` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Paris','Lindsey','763 West Mulberry St','29710','2025550132','plindsey@airline.com'),(2,'Umaiza','Melia','545 Ohio Ave','29710','2025550135','umelia@airline.com'),(3,'Nico','Prince','20 Middle River Street','44094','2025550137','nprince@airline.com'),(4,'Javan','Rennie','8112 North Country St','44094','2025550139','jrennie@airline.com'),(5,'Ali','Waters','83 Rockland Lane','44094','2025550144','awaters@airline.com'),(6,'JohnPaul','Clarke','1 Riverside Lane','44094','2025550153','jpcClarke@airline.com'),(7,'Dane','Kaiser','694 Wall Road','44094','2025550155','kdaiser@airline.com'),(8,'Hammad','Newman','9970 State Court','30096','2025550157','hnewman@airline.com'),(9,'Maha','Guthrie','54 Woodsman Drive','30096','2025550161','mguthrie@airline.com'),(10,'Tulisa','Roberts','7174 Studebaker Street','30096','2025550163','troberts@airline.com'),(11,'Raheem','Montgomery','71 Paris Hill Rd.','39180','4134849795','rmontgomery@airline.com'),(13,'Oliwier','Barnett','81 Cedar Swamp St.','39180','2764343958','obarnett@airline.com'),(15,'Dawson','Marquez','90 Mammoth Street','45601','7634882879','dmarquez@airline.com'),(16,'Raja','Glass','7918 Talbot Ave.','45601','2319969540','rglass@airline.com'),(18,'Nicholas','Pena','8123 Race Ave.','95060','7815242242','npena@airline.com'),(20,'Aamina','Dillon','9 West Boston Lane','95060','2035745299','adillon@airline.com'),(22,'Krystal','Walters','583 North Nichols Street','95060','3232591832','kwalters@airline.com'),(30,'Kaya','Hodge','9572 William Lane','46060','2125271561','khodge@airline.com'),(34,'Brodie','Gordon','71 Jackson Ave.','46060','9016899813','bgordon@airline.com'),(38,'Mathew','Horton','1 Rockland Ave.','46060','7195789907','mhorton@airline.com'),(71,'Leo','Bird','201 Eagle Dr.','12020','7747829407','lbird@airline.com'),(73,'Fern','Garner','37 Gartner Court','12020','2256254378','fgarner@airline.com'),(83,'Rebekah','Morgan','9437 East 6th Street','20601','6073928343','rmorgan@airline.com'),(85,'Malik','Vincent','312 Colonial Ave.','19083','9149573014','mvincent@airline.com'),(87,'Lyra','Murphy','400 Nut Swamp Drive','19083','3527673126','lmurphy@airline.com'),(91,'Laila','Christensen','15 Rose Avenue','07501','9017396978','lchristensen@airline.com'),(95,'Ty','Bell','921 Brook St.','07501','2393336881','tbell@airline.com'),(99,'Kamil','Lozano','75 N. Golden Star Street','07501','7638554744','klozano@airline.com'),(141,'Alissa','Ortiz','7756 Fulton Court','23832','2397268929','aortiz@airline.com'),(143,'Harvey','West','9 Cherry Ave','23832','7326232762','hwest@airline.com'),(145,'Louis','Giles','598 North Road','28115','2708583758','lgiles@airline.com'),(147,'Alexa','Preston','9227 North Bow Ridge Street','28115','4098496634','apreston@airline.com'),(149,'Ethan','Ali','167 NE. Depot Dr.','28115','2245499884','eali@airline.com'),(151,'Sara','Barron','9064 E. Swanson St.','20601','8707743244','sbarron@airline.com'),(153,'Awais','Carrillo','225 South Manhattan Street','28079','6369577670','acarrillo@airline.com'),(155,'Jemima','Miller','9290 Indian Spring Rd.','28079','6206673264','jmiller@airline.com'),(157,'Honey','Warren','7946 Leeton Ridge Street','06611','5858531050','hwarren@airline.com'),(159,'Lauren','Morton','7931 Rockaway Street','28079','4476721422','lmorton@airline.com'),(161,'Floyd','Johns','2 Shore Street','06611','4065842872','fjohns@airline.com'),(163,'Ernest','Higgins','451 Marshall Lane','06611','7637651247','ehiggins@airline.com'),(164,'Fatima','Robles','2519 Bottom Lane','33900','5126024452','frobles@airline.com'),(165,'Angelita','Turner','3447 Valley Lane','33109','8574960348','aturner@airline.com'),(166,'Robert','Johnson','526 Metz Lane','32401','5306942786','rjohnson@airline.com'),(167,'Francisca','Spence','1253 Coulter Lane','32547','8043389754','fspence@airline.com'),(168,'Matthew','Lee','756 Long Street','32601','3522635642','mlee@airline.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeaudit`
--

DROP TABLE IF EXISTS `employeeaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeaudit` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeNumber` int NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(90) NOT NULL,
  `changeDate` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeaudit`
--

LOCK TABLES `employeeaudit` WRITE;
/*!40000 ALTER TABLE `employeeaudit` DISABLE KEYS */;
INSERT INTO `employeeaudit` VALUES (1,11,'Raheem','Montgomery','rmontgomery@cruise.com','2023-12-04 10:17:48','UPDATE'),(2,13,'Oliwier','Barnett','obarnett@cruise.com','2023-12-04 10:17:48','UPDATE'),(3,15,'Dawson','Marquez','dmarquez@cruise.com','2023-12-04 10:17:48','UPDATE'),(4,16,'Raja','Glass','rglass@cruise.com','2023-12-04 10:17:48','UPDATE'),(5,18,'Nicholas','Pena','npena@cruise.com','2023-12-04 10:17:48','UPDATE'),(6,20,'Aamina','Dillon','adillon@cruise.com','2023-12-04 10:17:48','UPDATE'),(7,22,'Krystal','Walters','kwalters@cruise.com','2023-12-04 10:17:48','UPDATE'),(8,30,'Kaya','Hodge','khodge@cruise.com','2023-12-04 10:17:48','UPDATE'),(9,34,'Brodie','Gordon','bgordon@cruise.com','2023-12-04 10:17:48','UPDATE'),(10,38,'Mathew','Horton','mhorton@cruise.com','2023-12-04 10:17:48','UPDATE'),(11,71,'Leo','Bird','lbird@cruise.com','2023-12-04 10:17:48','UPDATE'),(12,73,'Fern','Garner','fgarner@cruise.com','2023-12-04 10:17:48','UPDATE'),(13,83,'Rebekah','Morgan','rmorgan@cruise.com','2023-12-04 10:17:48','UPDATE'),(14,85,'Malik','Vincent','mvincent@cruise.com','2023-12-04 10:17:48','UPDATE'),(15,87,'Lyra','Murphy','lmurphy@cruise.com','2023-12-04 10:17:48','UPDATE'),(16,91,'Laila','Christensen','lchristensen@cruise.com','2023-12-04 10:17:48','UPDATE'),(17,95,'Ty','Bell','tbell@cruise.com','2023-12-04 10:17:48','UPDATE'),(18,99,'Kamil','Lozano','klozano@cruise.com','2023-12-04 10:17:48','UPDATE'),(19,141,'Alissa','Ortiz','aortiz@cruise.com','2023-12-04 10:17:48','UPDATE'),(20,143,'Harvey','West','hwest@cruise.com','2023-12-04 10:17:48','UPDATE'),(21,145,'Louis','Giles','lgiles@cruise.com','2023-12-04 10:17:48','UPDATE'),(22,147,'Alexa','Preston','apreston@cruise.com','2023-12-04 10:17:48','UPDATE'),(23,149,'Ethan','Ali','eali@cruise.com','2023-12-04 10:17:48','UPDATE'),(24,151,'Sara','Barron','sbarron@cruise.com','2023-12-04 10:17:48','UPDATE'),(25,153,'Awais','Carrillo','acarrillo@cruise.com','2023-12-04 10:17:48','UPDATE'),(26,155,'Jemima','Miller','jmiller@cruise.com','2023-12-04 10:17:48','UPDATE'),(27,157,'Honey','Warren','hwarren@cruise.com','2023-12-04 10:17:48','UPDATE'),(28,159,'Lauren','Morton','lmorton@cruise.com','2023-12-04 10:17:48','UPDATE'),(29,161,'Floyd','Johns','fjohns@cruise.com','2023-12-04 10:17:48','UPDATE'),(30,163,'Ernest','Higgins','ehiggins@cruise.com','2023-12-04 10:17:48','UPDATE'),(31,1,'Paris','Lindsey','plindsey@isp.com','2023-12-04 10:17:51','UPDATE'),(32,2,'Umaiza','Melia','umelia@isp.com','2023-12-04 10:17:51','UPDATE'),(33,3,'Nico','Prince','nprince@isp.com','2023-12-04 10:17:51','UPDATE'),(34,4,'Javan','Rennie','jrennie@isp.com','2023-12-04 10:17:51','UPDATE'),(35,5,'Ali','Waters','awaters@isp.com','2023-12-04 10:17:51','UPDATE'),(36,6,'JohnPaul','Clarke','jpcClarke@isp.com','2023-12-04 10:17:51','UPDATE'),(37,7,'Dane','Kaiser','kdaiser@isp.com','2023-12-04 10:17:51','UPDATE'),(38,8,'Hammad','Newman','hnewman@isp.com','2023-12-04 10:17:51','UPDATE'),(39,9,'Maha','Guthrie','mguthrie@isp.com','2023-12-04 10:17:51','UPDATE'),(40,10,'Tulisa','Roberts','troberts@isp.com','2023-12-04 10:17:51','UPDATE');
/*!40000 ALTER TABLE `employeeaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeflight`
--

DROP TABLE IF EXISTS `employeeflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeflight` (
  `employeeId` int NOT NULL,
  `flightId` int NOT NULL,
  PRIMARY KEY (`employeeId`,`flightId`),
  KEY `flightId` (`flightId`),
  CONSTRAINT `employeeflight_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`),
  CONSTRAINT `employeeflight_ibfk_2` FOREIGN KEY (`flightId`) REFERENCES `flight` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeflight`
--

LOCK TABLES `employeeflight` WRITE;
/*!40000 ALTER TABLE `employeeflight` DISABLE KEYS */;
INSERT INTO `employeeflight` VALUES (2,100),(3,100),(34,100),(83,100),(95,100),(38,106),(71,106),(85,106),(87,106),(91,106),(1,113),(3,113),(73,113),(85,113),(95,113),(34,116),(71,116),(83,116),(87,116),(91,116);
/*!40000 ALTER TABLE `employeeflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employeeflightview`
--

DROP TABLE IF EXISTS `employeeflightview`;
/*!50001 DROP VIEW IF EXISTS `employeeflightview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeeflightview` AS SELECT 
 1 AS `Employee`,
 1 AS `Origin`,
 1 AS `Departure`,
 1 AS `Destination`,
 1 AS `Arrival`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employeeposition`
--

DROP TABLE IF EXISTS `employeeposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeposition` (
  `employeeId` int NOT NULL,
  `positionId` int NOT NULL,
  PRIMARY KEY (`employeeId`,`positionId`),
  UNIQUE KEY `employeeId` (`employeeId`),
  KEY `positionId` (`positionId`),
  CONSTRAINT `employeeposition_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`),
  CONSTRAINT `employeeposition_ibfk_2` FOREIGN KEY (`positionId`) REFERENCES `position` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeposition`
--

LOCK TABLES `employeeposition` WRITE;
/*!40000 ALTER TABLE `employeeposition` DISABLE KEYS */;
INSERT INTO `employeeposition` VALUES (1,18),(2,19),(3,20),(4,23),(5,24),(6,28),(7,31),(8,32),(9,32),(10,33),(11,25),(13,29),(15,30),(16,34),(18,21),(20,26),(22,27),(30,22),(34,18),(38,18),(71,19),(73,19),(83,20),(85,20),(87,20),(91,20),(95,20),(99,23),(141,23),(143,23),(145,34),(147,34),(149,34),(151,32),(153,32),(155,32),(157,25),(159,25),(161,28),(163,31);
/*!40000 ALTER TABLE `employeeposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `origin` char(3) NOT NULL,
  `destination` char(3) NOT NULL,
  `aircraft` int NOT NULL,
  `departure` timestamp NOT NULL,
  `arrival` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `aircraft` (`aircraft`),
  KEY `origin` (`origin`),
  KEY `destination` (`destination`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`aircraft`) REFERENCES `aircraft` (`ID`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`origin`) REFERENCES `airport` (`faa`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`destination`) REFERENCES `airport` (`faa`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (100,'DAB','FLL',1,'2023-11-01 11:00:00','2023-11-01 12:00:00'),(101,'FLL','RSW',9,'2023-11-01 12:00:00','2023-11-01 13:00:00'),(102,'RSW','VPS',2,'2023-11-01 13:00:00','2023-11-01 14:00:00'),(103,'VPS','GNV',8,'2023-11-01 14:00:00','2023-11-01 15:00:00'),(104,'GNV','JAX',3,'2023-11-11 16:00:00','2023-11-11 17:00:00'),(105,'JAX','EYW',7,'2023-11-11 17:00:00','2023-11-11 18:00:00'),(106,'EYW','MLB',4,'2023-11-04 17:00:00','2023-11-04 18:00:00'),(107,'MLB','MIA',6,'2023-11-04 18:00:00','2023-11-04 19:00:00'),(108,'MIA','MCO',5,'2023-11-05 20:00:00','2023-11-05 21:00:00'),(109,'MCO','ECP',5,'2023-11-05 21:00:00','2023-11-05 22:00:00'),(110,'ECP','PNS',6,'2023-11-06 22:00:00','2023-11-06 23:00:00'),(111,'PNS','PGD',4,'2023-11-07 00:00:00','2023-11-07 01:00:00'),(112,'PGD','SFB',7,'2023-11-07 12:00:00','2023-11-07 13:00:00'),(113,'SFB','SRQ',3,'2023-11-07 14:00:00','2023-11-07 15:00:00'),(114,'SRQ','PIE',8,'2023-11-08 12:00:00','2023-11-08 13:00:00'),(115,'PIE','TLH',2,'2023-11-08 14:00:00','2023-11-08 15:00:00'),(116,'TLH','TPA',9,'2023-11-09 12:00:00','2023-11-09 13:00:00'),(117,'TPA','PBI',1,'2023-11-09 15:00:00','2023-11-09 16:00:00'),(118,'PBI','DAB',10,'2023-11-10 16:00:00','2023-11-10 17:00:00');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(90) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `zipCode` (`zipCode`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`zipCode`) REFERENCES `citystate` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=784 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (585,'Dante','Rennie','137 Wall St','38117','2225550112','drennie@isp.com'),(587,'Avaya','Clarke','7771 Border Court','92078','2225550119','aclarke@isp.com'),(589,'Victor','Newman','942 New Saddle Drive','70433','2225550122','vnewman@isp.com'),(591,'Brian','Roberts','7319 S. Greenview Drive','44223','2225550125','broberts@isp.com'),(593,'Umaiza','Heath','545 Ohio Ave','85260','2025550135','uheath@isp.com'),(595,'Dante','Mackenzie','137 Wall St','37205','2025550112','dmackenzie@isp.com'),(597,'Avaya','Gonzalez','7771 Border Court','37205','2025550119','agonzalez@isp.com'),(599,'Nathalie','Chambers','942 New Saddle Drive','29710','2025550122','nchambers@isp.com'),(601,'Beverley','Mckee','7319 S. Greenview Drive','29710','2025550125','bmckee@isp.com'),(603,'Kavita','Heath','796 Hartford St','30096','2025550165','kheath@isp.com'),(605,'Bradlee','Esparza','7031 Gainsway St','08854','2025550173','besparza@isp.com'),(607,'Stefanie','Brook','7990 West Surrey St','08854','2025550179','sbrook@isp.com'),(609,'Jonathan','Kumar','25 Annadale Court','33458','2025550182','jkumar@isp.com'),(611,'Uzair','Sparrow','7999 Hall Street','33458','2025550188','usparrow@isp.com'),(613,'Imaani','Wallace','33 Pierce Rd','33458','2025550195','iwallace@isp.com'),(615,'Atticus','Atkinson','66 Harrison Dr','20706','2025550197','aatkinson@isp.com'),(617,'Remy','Hassan','249 Devon Lane','20706','2225550199','rhassan@isp.com'),(649,'Igor','Prince','12 Creekside St','92647','2025550199','iprince@isp.com'),(651,'Thomas','Waters','411 Shirley St','24210','2225550115','twaters@isp.com'),(653,'Haniya','Kaiser','6 South Sulphur Springs Street','70121','2225550121','hkaiser@isp.com'),(655,'Douglas','Guthrie','9 Wrangler Ave','91764','2225550124','dguthrie@isp.com'),(657,'Paris','Solis','763 West Mulberry St','49016','2025550132','psolis@isp.com'),(659,'Yvonne','Goodman','12 Creekside St','37205','2025550109','ygoodman@isp.com'),(661,'Alysha','Rollins','411 Shirley St','37205','2025550115','arollins@isp.com'),(663,'Haniya','Kelly','6 South Sulphur Springs Street','37205','2025550121','hkelly@isp.com'),(665,'Dante','Rollins','9 Wrangler Ave','29710','2025550124','drollins@isp.com'),(667,'Robin','Solis','8474 Wentworth Street','30096','2025550164','rsolis@isp.com'),(669,'Meera','White','484 Bridge St','08854','2025550166','mwhite@isp.com'),(671,'Leilani','Leonard','37 Monroe Street','08854','2025550175','lleonard@isp.com'),(673,'Grover','Squires','7618 Madison Court','08854','2025550180','gsquires@isp.com'),(675,'Angus','Neville','9841 Smith Drive','33458','2025550187','aneville@isp.com'),(677,'Amari','Currie','8411 Pleasant St','33458','2025550194','acurrie@isp.com'),(679,'Efe','House','97 High Point Street','20706','2025550196','ehouse@isp.com'),(681,'Michelle','Ramirez','370 Hill Field Ave','20706','2025550198','mramirez@isp.com'),(783,'Jordana','Beck','7911 Carson Lane','20706','2025550200','jbeck@isp.com');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengerflight`
--

DROP TABLE IF EXISTS `passengerflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengerflight` (
  `passengerId` int NOT NULL,
  `flightId` int NOT NULL,
  PRIMARY KEY (`passengerId`,`flightId`),
  KEY `flightId` (`flightId`),
  CONSTRAINT `passengerflight_ibfk_1` FOREIGN KEY (`passengerId`) REFERENCES `passenger` (`ID`),
  CONSTRAINT `passengerflight_ibfk_2` FOREIGN KEY (`flightId`) REFERENCES `flight` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengerflight`
--

LOCK TABLES `passengerflight` WRITE;
/*!40000 ALTER TABLE `passengerflight` DISABLE KEYS */;
INSERT INTO `passengerflight` VALUES (585,100),(651,100),(661,100),(667,100),(783,100),(587,106),(613,106),(653,106),(673,106),(681,106),(589,113),(593,113),(603,113),(659,113),(679,113),(591,116),(597,116),(601,116),(649,116),(677,116);
/*!40000 ALTER TABLE `passengerflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `passengerflightview`
--

DROP TABLE IF EXISTS `passengerflightview`;
/*!50001 DROP VIEW IF EXISTS `passengerflightview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passengerflightview` AS SELECT 
 1 AS `Passenger`,
 1 AS `Origin`,
 1 AS `Departure`,
 1 AS `Desitination`,
 1 AS `Arrival`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `hourly` decimal(5,2) NOT NULL DEFAULT '11.00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (18,'Pilot',58.00),(19,'Co-pilot',40.00),(20,'Flight Attendant',48.00),(21,'Cabin Attendant',38.00),(22,'Aeronautical Engineer',42.00),(23,'Aircraft Mechanic',33.00),(24,'Airport Police',20.00),(25,'Security',14.00),(26,'Airport Planner',46.00),(27,'Airfield Operations Specialists',22.00),(28,'Airline Ticket Agent',13.00),(29,'Reservation Service Agent',15.00),(30,'Passenger Service Agent',11.00),(31,'Meteorologist',37.00),(32,'Baggage Handler',13.00),(33,'Administrative Jobs',17.00),(34,'Cleaning Jobs',13.00);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `sun` int NOT NULL DEFAULT '0',
  `mon` int NOT NULL DEFAULT '0',
  `tues` int NOT NULL DEFAULT '0',
  `wed` int NOT NULL DEFAULT '0',
  `thurs` int NOT NULL DEFAULT '0',
  `fri` int NOT NULL DEFAULT '0',
  `sat` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `employeeId` (`employeeId`),
  CONSTRAINT `timesheet_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (1,163,0,8,8,8,8,8,0),(2,145,6,6,6,6,6,5,0),(3,73,0,12,6,10,6,8,0),(4,10,10,8,0,0,8,10,10),(5,2,8,8,0,0,8,10,6),(6,87,0,12,6,10,6,8,0),(7,157,8,8,0,0,8,10,6),(8,141,0,8,8,8,8,8,0),(9,155,10,8,0,0,8,10,10),(10,91,12,0,12,0,4,12,0),(11,30,0,12,6,10,6,8,0),(12,153,12,0,12,0,4,12,0),(13,83,6,6,6,6,6,5,0),(14,22,8,8,0,0,8,10,6),(15,11,0,8,8,8,8,8,0),(16,1,10,8,0,0,8,10,10),(17,6,12,0,12,0,4,12,0),(18,13,0,12,6,10,6,8,0),(19,20,7,4,9,0,0,10,3),(20,38,6,6,6,6,6,5,0),(21,15,12,0,12,0,4,12,0),(22,161,0,8,8,8,8,8,0),(23,159,7,4,9,0,0,10,3),(24,151,10,8,0,0,8,10,10),(25,149,7,4,9,0,0,10,3),(26,147,0,12,6,10,6,8,0),(27,143,12,0,12,0,4,12,0),(28,3,6,6,6,6,6,5,0),(29,4,7,4,9,0,0,10,3),(30,5,0,8,8,8,8,8,0),(31,99,10,8,0,0,8,10,10),(32,95,12,0,12,0,4,12,0),(33,71,6,6,6,6,6,5,0),(34,7,8,8,0,0,8,10,6),(35,8,0,8,8,8,8,8,0),(36,9,10,8,0,0,8,10,10),(37,85,0,12,6,10,6,8,0),(38,34,6,6,6,6,6,5,0),(39,18,8,8,0,0,8,10,6),(40,16,0,8,8,8,8,8,0),(41,164,0,0,0,0,0,0,0),(42,165,0,0,0,0,0,0,0),(43,166,0,0,0,0,0,0,0),(44,167,0,0,0,0,0,0,0),(45,168,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `timesheetview`
--

DROP TABLE IF EXISTS `timesheetview`;
/*!50001 DROP VIEW IF EXISTS `timesheetview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `timesheetview` AS SELECT 
 1 AS `Employee`,
 1 AS `Position`,
 1 AS `Hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'airline'
--

--
-- Final view structure for view `airlinemanifestview`
--

/*!50001 DROP VIEW IF EXISTS `airlinemanifestview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `airlinemanifestview` AS select concat(`e`.`firstname`,' ',`e`.`lastname`) AS `Name`,`e`.`phone` AS `Phone Number`,`p`.`description` AS `Role`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Destination`,`f`.`arrival` AS `Arrival` from ((((`employee` `e` join `flight` `f`) join `employeeflight` `ef`) join `position` `p`) join `employeeposition` `ep`) where ((`ef`.`flightId` = `f`.`ID`) and (`ef`.`employeeId` = `e`.`ID`) and (`ep`.`employeeId` = `ef`.`employeeId`) and (`ep`.`positionId` = `p`.`ID`)) union select concat(`p`.`firstName`,' ',`p`.`lastName`) AS `Name`,`p`.`phone` AS `Phone Number`,'Passenger' AS `Role`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Destination`,`f`.`arrival` AS `Arrival` from ((`passenger` `p` join `flight` `f`) join `passengerflight` `pf`) where ((`pf`.`flightId` = `f`.`ID`) and (`pf`.`passengerId` = `p`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeeflightview`
--

/*!50001 DROP VIEW IF EXISTS `employeeflightview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeeflightview` AS select concat(`e`.`firstname`,' ',`e`.`lastname`) AS `Employee`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Destination`,`f`.`arrival` AS `Arrival` from ((`employee` `e` join `flight` `f`) join `employeeflight` `ef`) where ((`ef`.`flightId` = `f`.`ID`) and (`ef`.`employeeId` = `e`.`ID`)) order by `f`.`departure`,`e`.`lastname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passengerflightview`
--

/*!50001 DROP VIEW IF EXISTS `passengerflightview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passengerflightview` AS select concat(`p`.`firstName`,' ',`p`.`lastName`) AS `Passenger`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Desitination`,`f`.`arrival` AS `Arrival` from ((`passenger` `p` join `flight` `f`) join `passengerflight` `pf`) where ((`pf`.`flightId` = `f`.`ID`) and (`pf`.`passengerId` = `p`.`ID`)) order by `f`.`departure`,`p`.`lastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timesheetview`
--

/*!50001 DROP VIEW IF EXISTS `timesheetview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `timesheetview` AS select concat(`e`.`firstname`,' ',`e`.`lastname`) AS `Employee`,`p`.`description` AS `Position`,((((((`t`.`sun` + `t`.`mon`) + `t`.`tues`) + `t`.`wed`) + `t`.`thurs`) + `t`.`fri`) + `t`.`sat`) AS `Hours` from (((`timesheet` `t` join `employee` `e`) join `position` `p`) join `employeeposition` `ep`) where ((`t`.`employeeId` = `e`.`ID`) and (`t`.`employeeId` = `ep`.`employeeId`) and (`ep`.`positionId` = `p`.`ID`)) order by `e`.`lastname` */;
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

-- Dump completed on 2023-12-04 10:18:51
