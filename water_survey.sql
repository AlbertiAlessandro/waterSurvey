-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: water_survey
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `risposta` text DEFAULT NULL,
  `id_utente` int(10) unsigned NOT NULL,
  `id_domanda` int(10) unsigned NOT NULL,
  `id_questionario` int(10) unsigned DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `options_question_id_fk` (`id_domanda`),
  KEY `options_survey_id_fk` (`id_questionario`),
  KEY `options_user_id_fk` (`id_utente`),
  CONSTRAINT `options_question_id_fk` FOREIGN KEY (`id_domanda`) REFERENCES `question` (`id`),
  CONSTRAINT `options_survey_id_fk` FOREIGN KEY (`id_questionario`) REFERENCES `survey` (`id`),
  CONSTRAINT `options_user_id_fk` FOREIGN KEY (`id_utente`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

INSERT INTO `options` VALUES (1,'Less than 50 liters',5,1,2,NULL),(2,'50-100 liters',5,1,2,NULL),(3,'100-150 liters',5,1,2,NULL),(4,'More than 150 liters',5,1,2,NULL),(5,'Daily',5,2,2,NULL),(6,'Several times a week',5,2,2,NULL),(7,'Once a week',5,2,2,NULL),(8,'Rarely',5,2,2,NULL),(9,'Yes',5,3,2,NULL),(10,'No',5,3,2,NULL),(11,'Planning to install',5,3,2,NULL),(12,'Not sure',5,3,2,NULL),(13,'Daily',5,4,2,NULL),(14,'Several times a week',5,4,2,NULL),(15,'Once a week',5,4,2,NULL),(16,'Rarely',5,4,2,NULL),(17,'Yes, always',5,5,2,NULL),(18,'Sometimes',5,5,2,NULL),(19,'Rarely',5,5,2,NULL),(20,'Never',5,5,2,NULL),(21,'Yes',5,6,2,NULL),(22,'No',5,6,2,NULL),(23,'Sometimes',5,6,2,NULL),(24,'Never thought about it',5,6,2,NULL),(25,'Weekly',5,7,2,NULL),(26,'Monthly',5,7,2,NULL),(27,'Occasionally',5,7,2,NULL),(28,'Never',5,7,2,NULL),(29,'Yes, for gardening',5,8,2,NULL),(30,'Yes, for household cleaning',5,8,2,NULL),(31,'No',5,8,2,NULL),(32,'Planning to',5,8,2,NULL),(33,'Very aware',5,9,2,NULL),(34,'Somewhat aware',5,9,2,NULL),(35,'Not very aware',5,9,2,NULL),(36,'Not aware at all',5,9,2,NULL);

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domanda` text NOT NULL,
  `tipo` int(10) unsigned DEFAULT NULL,
  `id_survey` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`id_survey`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `questionario` FOREIGN KEY (`id_survey`) REFERENCES `survey` (`id`),
  CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo_domanda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

INSERT INTO `question` VALUES (1,'How many liters of water do you use daily?',1,2),(2,'How often do you take a shower?',1,2),(3,'Do you have water-saving devices installed at home?',1,2),(4,'How often do you water your garden/lawn?',1,2),(5,'Do you use a dishwasher?',1,2),(6,'Do you turn off the tap while brushing your teeth?',1,2),(7,'How often do you wash your car?',1,2),(8,'Do you use recycled water for any purposes?',1,2),(9,'How aware are you of your water consumption?',1,2),(10,'Please leave feedback on the survey',2,2),(11,'How do you rate the quality of water in your area? (1 to 7)',3,3),(12,'How satisfied are you with the taste of the water? (1 to 7)',3,3),(13,'How would you rate the smell of the water? (1 to 7)',3,3),(14,'How would you rate the clarity of the water? (1 to 7)',3,3),(15,'How confident are you in the safety of your water? (1 to 7)',3,3),(16,'How do you rate the water pressure in your home? (1 to 7)',3,3),(17,'How satisfied are you with the water service reliability? (1 to 7)',3,3),(18,'How do you rate the value for money of your water service? (1 to 7)',3,3),(19,'How environmentally friendly do you consider your water supplier? (1 to 7)',3,3),(20,'Please leave feedback on the survey',2,3);

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `risposta` text DEFAULT NULL,
  `id_utente` int(10) unsigned NOT NULL,
  `id_domanda` int(10) unsigned NOT NULL,
  `id_questionario` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `response_question_id_fk` (`id_domanda`),
  KEY `response_survey_id_fk` (`id_questionario`),
  KEY `response_user_id_fk` (`id_utente`),
  CONSTRAINT `response_question_id_fk` FOREIGN KEY (`id_domanda`) REFERENCES `question` (`id`),
  CONSTRAINT `response_survey_id_fk` FOREIGN KEY (`id_questionario`) REFERENCES `survey` (`id`),
  CONSTRAINT `response_user_id_fk` FOREIGN KEY (`id_utente`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--


--
-- Table structure for table `ruolo`
--

DROP TABLE IF EXISTS `ruolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruolo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruolo`
--

INSERT INTO `ruolo` VALUES (1,'Admin'),(2,'Users');

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `creatore` int(10) unsigned NOT NULL,
  `numero_domande` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creatore` (`creatore`),
  CONSTRAINT `creatore` FOREIGN KEY (`creatore`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` VALUES (2,'Personal Water Usage Survey','This survey aims to understand your daily water usage habits and preferences. The information collected will be used for educational purposes.',6,10),(3,'Water Quality Self-Assessment Survey','This survey aims to gather your self-assessment on various aspects of water quality in your area. The information collected will be used for educational purposes.',6,10);

--
-- Table structure for table `tipo_domanda`
--

DROP TABLE IF EXISTS `tipo_domanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_domanda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_domanda`
--

INSERT INTO `tipo_domanda` VALUES (1,'Opzioni'),(2,'Aperta'),(3,'Autovalutazione');

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `token_reset` varchar(50) DEFAULT NULL,
  `ruolo` int(10) unsigned NOT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `ruolo` (`ruolo`),
  CONSTRAINT `ruolo` FOREIGN KEY (`ruolo`) REFERENCES `ruolo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES (5,'albe','$2y$10$3BNLdqF8zUwruw440XayE.a2dRXyoZO3ATWAsOvII06PZhGajOoqS','albe@gmail.com','Alessandro','Alberti',NULL,2,'user.jpg'),(6,'admin','$2y$10$LdOIAHIPpN1Ay9iF3bjX8ulKdPiyQNR9avwJNHunm8IY8d2BNwkma','admin@gmail.com','Girolamo','Stalteri',NULL,1,'user.jpg'),(7,'zucca','$2y$10$rCtuZ9C45qVAgkdDr.QqfOpJ4E4kAO04O.ZaeaE..wnIcJ0gd/XQW','paolozucca03@gmail.com','Paolo','Zucca',NULL,2,'user.jpg'),(10,'ronaldo','$2y$10$.t44W2Hv7xWYhOlHhJXMQexT9wG8Fc9fbMBjctGBhUptKdpPfMxv6','cr7@gmail.com','Cristiano','Ronaldo',NULL,2,'cb2d8aa9a98fb2d12f29f6f585b1cca4d6c8a2f5.jpg');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-27 10:59:26
