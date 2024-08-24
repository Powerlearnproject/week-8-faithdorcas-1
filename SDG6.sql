-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: sdg6
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `population` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Village A','Region 1',1500,'2024-08-20 08:23:36','2024-08-20 08:23:36'),(2,'City B','Region 2',50000,'2024-08-20 08:23:36','2024-08-20 08:23:36');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterdistribution`
--

DROP TABLE IF EXISTS `waterdistribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waterdistribution` (
  `distribution_id` int NOT NULL AUTO_INCREMENT,
  `source_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `distribution_date` date NOT NULL,
  `amount_distributed` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`distribution_id`),
  KEY `source_id` (`source_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `waterdistribution_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `watersource` (`source_id`),
  CONSTRAINT `waterdistribution_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterdistribution`
--

LOCK TABLES `waterdistribution` WRITE;
/*!40000 ALTER TABLE `waterdistribution` DISABLE KEYS */;
INSERT INTO `waterdistribution` VALUES (1,1,1,'2024-02-01',1000.00,'2024-08-20 08:25:48','2024-08-20 08:25:48'),(2,2,2,'2024-02-02',5000.00,'2024-08-20 08:25:48','2024-08-20 08:25:48');
/*!40000 ALTER TABLE `waterdistribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watersource`
--

DROP TABLE IF EXISTS `watersource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watersource` (
  `source_id` int NOT NULL AUTO_INCREMENT,
  `source_name` varchar(255) NOT NULL,
  `location_id` int DEFAULT NULL,
  `water_quality` varchar(50) DEFAULT NULL,
  `last_tested_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`source_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `watersource_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watersource`
--

LOCK TABLES `watersource` WRITE;
/*!40000 ALTER TABLE `watersource` DISABLE KEYS */;
INSERT INTO `watersource` VALUES (1,'River X',1,'Contaminated','2024-01-10','2024-08-20 08:24:20','2024-08-20 08:24:20'),(2,'Well Y',2,'Safe','2024-01-15','2024-08-20 08:24:20','2024-08-20 08:24:20');
/*!40000 ALTER TABLE `watersource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watertesting`
--

DROP TABLE IF EXISTS `watertesting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watertesting` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `source_id` int DEFAULT NULL,
  `test_date` date NOT NULL,
  `contaminants_found` text,
  `safety_level` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`test_id`),
  KEY `source_id` (`source_id`),
  CONSTRAINT `watertesting_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `watersource` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watertesting`
--

LOCK TABLES `watertesting` WRITE;
/*!40000 ALTER TABLE `watertesting` DISABLE KEYS */;
INSERT INTO `watertesting` VALUES (1,1,'2024-01-10','Lead, E. Coli','Unsafe','2024-08-20 08:24:58','2024-08-20 08:24:58'),(2,2,'2024-01-15','None','Safe','2024-08-20 08:24:58','2024-08-20 08:24:58');
/*!40000 ALTER TABLE `watertesting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20 12:59:39
