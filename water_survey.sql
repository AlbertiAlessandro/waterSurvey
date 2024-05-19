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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

INSERT INTO `options` VALUES (1,'Less than 50 liters',1,1,2,NULL),(2,'50-100 liters',1,1,2,NULL),(3,'100-150 liters',1,1,2,NULL),(4,'More than 150 liters',1,1,2,NULL),(5,'Not sure',1,1,2,NULL),(6,'Tap water',1,2,2,NULL),(7,'Bottled water',1,2,2,NULL),(8,'Filtered water',1,2,2,NULL),(9,'Well water',1,2,2,NULL),(10,'Other',1,2,2,NULL),(11,'Showering/Bathing',1,3,2,NULL),(12,'Washing dishes',1,3,2,NULL),(13,'Laundry',1,3,2,NULL),(14,'Toilet flushing',1,3,2,NULL),(15,'Gardening/Lawn care',1,3,2,NULL),(16,'Cooking',1,3,2,NULL),(17,'Cleaning',1,3,2,NULL),(18,'Other (please specify)',1,3,2,NULL),(19,'Less than 5 minutes',1,4,2,NULL),(20,'5-10 minutes',1,4,2,NULL),(21,'10-15 minutes',1,4,2,NULL),(22,'More than 15 minutes',1,4,2,NULL),(23,'Turning off the tap while brushing teeth',1,5,2,NULL),(24,'Taking shorter showers',1,5,2,NULL),(25,'Using a water-efficient dishwasher or washing machine',1,5,2,NULL),(26,'Fixing leaks promptly',1,5,2,NULL),(27,'Using a rain barrel for gardening',1,5,2,NULL),(28,'Other (please specify)',1,5,2,NULL),(29,'No, I do not use any water-saving techniques',1,5,2,NULL),(30,'Never',1,6,2,NULL),(31,'Once a month',1,6,2,NULL),(32,'2-3 times a month',1,6,2,NULL),(33,'Once a week',1,6,2,NULL),(34,'More than once a week',1,6,2,NULL),(35,'Yes',1,7,2,NULL),(36,'No',1,7,2,NULL),(37,'Environmental concerns',1,8,2,NULL),(38,'Reducing water bills',1,8,2,NULL),(39,'Community initiatives',1,8,2,NULL),(40,'Personal values',1,8,2,NULL),(41,'Awareness campaigns',1,8,2,NULL),(42,'Other (please specify)',1,8,2,NULL),(43,'Yes, I have significantly reduced my water usage',1,9,2,NULL),(44,'Yes, I have made some reductions',1,9,2,NULL),(45,'No, my water usage has remained the same',1,9,2,NULL),(46,'No, my water usage has increased',1,9,2,NULL),(47,'Please provide any additional comments or suggestions on how to improve water conservation efforts in your community.',1,10,2,NULL),(48,'50 gallons',1,11,3,NULL),(49,'80 gallons',1,11,3,1),(50,'100 gallons',1,11,3,NULL),(51,'150 gallons',1,11,3,NULL),(52,'Taking shorter showers',1,12,3,NULL),(53,'Running the dishwasher only when full',1,12,3,1),(54,'Watering the lawn in the evening',1,12,3,NULL),(55,'Using a broom instead of a hose to clean driveways',1,12,3,NULL),(56,'1%',1,13,3,NULL),(57,'2.5%',1,13,3,1),(58,'10%',1,13,3,NULL),(59,'25%',1,13,3,NULL),(60,'100 gallons',1,14,3,NULL),(61,'500 gallons',1,14,3,NULL),(62,'1,000 gallons',1,14,3,NULL),(63,'3,000 gallons',1,14,3,1),(64,'Fixing leaks',1,15,3,NULL),(65,'Using a high-efficiency washing machine',1,15,3,NULL),(66,'Watering plants during the hottest part of the day',1,15,3,1),(67,'Installing low-flow showerheads',1,15,3,NULL),(68,'Once a month',1,16,3,NULL),(69,'Every three months',1,16,3,NULL),(70,'Twice a year',1,16,3,1),(71,'Once a year',1,16,3,NULL),(72,'True',1,17,3,1),(73,'False',1,17,3,NULL),(74,'Watering every day',1,18,3,NULL),(75,'Planting drought-resistant plants',1,18,3,1),(76,'Using a sprinkler in the afternoon',1,18,3,NULL),(77,'Hosing down the driveway',1,18,3,NULL),(78,'Washing machine',1,19,3,NULL),(79,'Toilet',1,19,3,1),(80,'Dishwasher',1,19,3,NULL),(81,'Shower',1,19,3,NULL),(82,'Water that comes from the sewer system',1,20,3,NULL),(83,'Water that has been used for bathing, washing dishes, or laundry and can be reused for irrigation',1,20,3,1),(84,'Water that contains hazardous chemicals',1,20,3,NULL),(85,'Rainwater collected in barrels',1,20,3,NULL);

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

INSERT INTO `question` VALUES (1,'How many liters of water do you estimate you use per day?',1,2),(2,'What is your primary source of drinking water?',1,2),(3,'Which activities in your household consume the most water? (Select all that apply)',1,2),(4,'How long is your average shower?',1,2),(5,'Do you practice any water-saving techniques in your daily routine? (Select all that apply)',1,2),(6,'How often do you wash your car at home?',1,2),(7,'Are you aware of the concept of a water footprint (the total volume of freshwater used to produce the goods and services consumed)?',1,2),(8,'What motivates you to conserve water? (Select all that apply)',1,2),(9,'Have you made any changes to your water usage habits in the past year?',1,2),(10,'Please provide any additional comments or suggestions on how to improve water conservation efforts in your community.',2,2),(11,'What is the average amount of water used per person per day in the United States?',1,3),(12,'Which of the following is the most effective way to reduce water usage in the home?',1,3),(13,'What percentage of the Earth\'s water is freshwater?',1,3),(14,'How much water can a leaky faucet waste in a year?',1,3),(15,'Which of these practices does NOT save water?',1,3),(16,'How often should you check your home for leaks to prevent water waste?',1,3),(17,'True or False: Turning off the tap while brushing your teeth can save up to 8 gallons of water per day.',1,3),(18,'What is a common method to reduce water use in the garden?',1,3),(19,'Which appliance typically uses the most water in a household?',1,3),(20,'What is greywater?',1,3);

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `risposta` text NOT NULL,
  `id_domanda` int(10) unsigned NOT NULL,
  `id_questionario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `response_question_id_fk` (`id_domanda`),
  KEY `response_survey_id_fk` (`id_questionario`),
  CONSTRAINT `response_question_id_fk` FOREIGN KEY (`id_domanda`) REFERENCES `question` (`id`),
  CONSTRAINT `response_survey_id_fk` FOREIGN KEY (`id_questionario`) REFERENCES `survey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--


--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descrizione` text DEFAULT NULL,
  `creatore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creatore` (`creatore`),
  CONSTRAINT `creatore` FOREIGN KEY (`creatore`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` VALUES (2,'Personal Water Consumption Habits','This survey aims to gather information about your daily water usage habits. Your responses will help us understand how individuals use water and identify areas where water conservation efforts can be improved. Please answer the following questions based on your typical daily routine.',1),(3,'Water Conservation Knowledge and Practices','This survey aims to assess your knowledge and practices regarding water conservation. Your responses will help identify areas where more education or resources might be needed to promote efficient water use. Your answers are anonymous and will only be use for the research',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_domanda`
--

INSERT INTO `tipo_domanda` VALUES (1,'opzioni'),(2,'aperta');

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
  `image` blob NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `ruolo` varchar(100) NOT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES (1,'albe','albe','﻿1','albe@gmail.com','Alessandro','admin','Alberti');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 18:17:00
