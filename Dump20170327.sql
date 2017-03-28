-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: userbase
-- ------------------------------------------------------
-- Server version	5.1.59-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `condidate_registration`
--

DROP TABLE IF EXISTS `condidate_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condidate_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `institute` varchar(45) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condidate_registration`
--

LOCK TABLES `condidate_registration` WRITE;
/*!40000 ALTER TABLE `condidate_registration` DISABLE KEYS */;
INSERT INTO `condidate_registration` VALUES (5,'Surabhi',NULL,'9876787678','surabhi@gmail.com','f','BE','Patna','Bihar','2017-03-13 20:19:28','Bihar Institute',1),(6,'Praveen Srivastava',NULL,'9876765456','praveen@gmail.com','m','MCA','Raipur','Chhatisgarh','2017-03-14 23:31:52','NIT Raipur',1),(7,'Devendra Kumar',NULL,'9876543212','dev@gmail.com','m','MCA','Raipur','Chhatisgarh','2017-03-14 23:45:36','NIT Raipur',1),(8,'Chandresh',NULL,'9878687968','chandu@gmail.com','m','MCA','Raipur','Chhatisgarh','2017-03-18 10:25:40','NIT Raipur',1),(9,'Karishma Srivastava',NULL,'9876545678','karishma@gmail.com','f','MCA','Raipur','Chhatisgarh','2017-03-26 02:50:25','NIT Raipur',1),(10,'Marry Fatima',NULL,'9876789876','marry@gmail.com','f','none','none','none','2017-03-26 02:54:14','NIT Raipur',1),(11,'Subrato Majumdar',NULL,'9868795867','subrato@gmail.com','m','BE','Bangalore','MadhayPradesh','2017-03-26 11:01:20','RKDF ',1);
/*!40000 ALTER TABLE `condidate_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) DEFAULT NULL,
  `answer1` varchar(45) DEFAULT NULL,
  `answer2` varchar(45) DEFAULT NULL,
  `answer3` varchar(45) DEFAULT NULL,
  `answer4` varchar(45) DEFAULT NULL,
  `correct_answer` varchar(45) DEFAULT NULL,
  `language_type` varchar(45) DEFAULT NULL,
  `question_set` varchar(45) DEFAULT NULL,
  `question_type` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Awebpage displays a picture. What tag was used to display that picture?','picture','image','img','src','img','e',NULL,NULL,'2017-03-05 01:13:16'),(2,' Output of XML document can be viewed ina','Word Processor','Web browser','Notepad','None of the above','Web browser','e',NULL,NULL,'2017-03-05 01:38:51'),(3,'The speed of a boat in still water in 15 km/hr and the rate of current is 3 km/hr. The distance travelled downstream in 12 minutes is:','1.2 km','1.8 km','2.4 km','3.6 km','3.6 km','e',NULL,NULL,'2017-03-25 15:41:22');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_userid_role` (`role`,`userid`),
  KEY `fk_user_idx` (`userid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,2,'ROLE_ADMIN'),(1,1,'ROLE_USER'),(8,8,'ROLE_USER'),(9,9,'ROLE_USER'),(10,10,'ROLE_USER'),(11,11,'ROLE_USER'),(12,12,'ROLE_USER'),(13,13,'ROLE_USER'),(14,14,'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'priya','abc@abc.com','$2a$04$CO93CT2ObgMiSnMAWwoBkeFObJlMYi/wzzOnPlsTP44r7qVq0Jln2',NULL,1),(2,'admin','def@def.com','$2a$12$U6T2Y0QYqNJJhmroilGSJOcX00QKf/RWfd/86O..Z4QoGNCUvd2Fu',NULL,1),(8,'surabhi@gmail.com','surabhi@gmail.com','$2a$12$kTj/q587fqdZYgDZBPEIFeqgVytI13wbK9J5i5C2BhZ17yhiDksBm',NULL,1),(9,'praveen','praveen@gmail.com','$2a$12$xfr72mO1etL7qXlFSIwjn.v.ePc29KBoAMXcfado2sm6MyIo8tRmS','Praveen Srivastava',1),(10,'dev','dev@gmail.com','$2a$12$wuoK0rfEUt3nCskWhMeQR.Ppk0NhObRhcLEbQS9EmYFKRTPrhDJn2','Devendra Kumar',1),(11,'chandu123','chandu@gmail.com','$2a$12$3Vz6kzP46AB.HpvB3JXece/HfQFmpeJaqTFj5H.8WJYNKJzpedWNa','Chandresh',1),(12,'karishma','karishma@gmail.com','$2a$12$bcsEX6L673tfwYuAioy/Te.fL.tfI0rafohFgw2zmUuqcHU6hnLWS','Karishma Srivastava',1),(13,'marry','marry@gmail.com','$2a$12$3GL9cbF5uE77wFezvGaVhOaXT2UsI1l1stx2YWElFYB/ZyDNB8r4y','Marry Fatima',1),(14,'subrato','subrato@gmail.com','$2a$12$Dl01jspZJvqGONbyOtSU7.TtBQQCNWJZZKcH3u4dpUd5sm4u.sqfu','Subrato Majumdar',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-27 22:47:19
