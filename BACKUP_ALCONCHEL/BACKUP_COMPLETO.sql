CREATE DATABASE  IF NOT EXISTS `tp_alconchel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tp_alconchel`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: tp_alconchel
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `email_user` varchar(50) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `card_number` varchar(30) DEFAULT NULL,
  `service_name` varchar(30) DEFAULT NULL,
  `type_service` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_card` (`card_number`),
  KEY `fk_servicio` (`service_name`),
  CONSTRAINT `fk_card` FOREIGN KEY (`card_number`) REFERENCES `tarjeta` (`card_number`) ON DELETE CASCADE,
  CONSTRAINT `fk_servicio` FOREIGN KEY (`service_name`) REFERENCES `servicio` (`service_name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'maynard_penn@aol.com','maybard_penn','ajkosnf124','5317-6612-0661-0764','Platzi','Educacion'),(2,'kelli_brett@protonmail.com','BrettKel','bUtMATINdo','3546-9540-5360-2564','SoundCloud','Streaming'),(3,'hilde_milne@protonmail.com','milnehilde','stOrANIaNc','5086-3467-5068-2166','Drive','Nube'),(4,'hilde_milne@protonmail.com','milnehilde','PIRflAtegI','5086-3467-5068-2166','YoutubeMusic','Streaming'),(5,'levi_west@yandex.com','wevi','ArDAbcarIN','4953-1354-8126-0076','HBOMAX','Streaming'),(6,'levi_west@yandex.com','levi_west','ComPEneriL','4953-1354-8126-0076','Udemy','Educacion'),(7,'miguel_boyce@gmail.com','boycemig','opyaNAnETA','5030-6937-1756-2651','HBOMAX','Streaming'),(8,'lissette_silva@yandex.com','Silvalissette','oUgeNdRaPO','4146-7691-1911-4632','Dropbox','Nube'),(9,'refugio_reynolds@outlook.com',NULL,'nfiRsTICEo','4204-2672-6934-7929','Mega','Nube'),(10,'rosalyn_matthams@gmail.com','mattrosa','RpSEdGeNta','4201-6811-9381-2100','Spotify','Streaming'),(11,'ardell_samuels@mail.com',NULL,'acaNTAwmaTiv','5025-8381-1770-9900','Mega','Nube'),(12,'albertina_redman@yahoo.com','albertinaman','escUBsIBluSc','3536-8288-6563-3243','Spotify','Streaming'),(13,'ardell_samuels@mail.com','elsard','teRnaPORnOrM','5025-8381-1770-9900','Spotify','Streaming'),(14,'albertina_redman@yahoo.com','albertina_redman','CASpiSeCieSt','3536-8288-6563-3243','Platzi','Educacion'),(15,'tasia_lloyd@hotmail.com',NULL,'cTiaLdUMPReC','3597-7985-3560-3668','SoundCloud','Streaming');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_cuenta_after` AFTER INSERT ON `cuenta` FOR EACH ROW BEGIN
	INSERT INTO log_cuenta (email, user, password, card_number, date, state, user_1)
    VALUES (NEW.email_user,NEW.user, NEW.password, NEW.card_number, current_timestamp(), 'INSERT', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_cuenta_before` BEFORE UPDATE ON `cuenta` FOR EACH ROW BEGIN
	INSERT INTO log_cuenta (email, user, password, card_number, date, state, user_1)
    VALUES (OLD.email_user, OLD.user, OLD.password, OLD.card_number, current_timestamp(), 'UPDATE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_cuenta_before` BEFORE DELETE ON `cuenta` FOR EACH ROW BEGIN
	INSERT INTO log_cuenta (email, user, password, card_number, date, state, user_1)
    VALUES (OLD.email_user, OLD.user, OLD.password, OLD.card_number, current_timestamp(), 'DELETE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuento` (
  `discount_id` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `discount_name` varchar(30) DEFAULT NULL,
  `service_name` varchar(30) DEFAULT NULL,
  `expiration_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`discount_id`),
  KEY `fk_user_3` (`id_user`),
  KEY `fk_servicio_1` (`service_name`),
  CONSTRAINT `fk_servicio_1` FOREIGN KEY (`service_name`) REFERENCES `servicio` (`service_name`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_3` FOREIGN KEY (`id_user`) REFERENCES `cuenta` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuento`
--

LOCK TABLES `descuento` WRITE;
/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
INSERT INTO `descuento` VALUES (117,5,'MESGRATIS','YoutubeMusic','2021-02-18','Primer mes GRATIS'),(121,8,'MESESPRUEBA','HBOMAX','2022-09-27','Tres meses de PRUEBA'),(126,3,'50%OFF','Soundcloud','2022-01-04','50% OFF en el segundo mes'),(140,11,'REINTEGRO40%','Dropbox','2022-05-22','Reintegro del 40% de tu suscripcion'),(152,4,'25%DESCUENTO','Drive','2022-12-02','25% descuento'),(158,2,'10%DESCUENTO','Mega','2022-01-16','10% de descuento'),(168,15,'HBOMAXGRATIS','HBOMAX','2022-02-12','Suscripcion gratis en HBO MAX por un mes'),(171,1,'50%OFFEN1ANIO','Udemy','2022-11-26','50% OFF pagando un anio'),(181,1,'REINTEGRO35%','Platzi','2022-12-04','35% reintegro con la suscripcion de un anio'),(191,4,'65%OFF','Spotify','2021-03-25','65% OFF en seis meses');
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_descuento_after` AFTER INSERT ON `descuento` FOR EACH ROW BEGIN
	INSERT INTO log_descuento (discount_id, discount_name, service_name, expiration_date, date, state, user)
    VALUES (NEW.discount_id, NEW.discount_name, NEW.service_name, NEW.expiration_date, current_timestamp(),'INSERT', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_expiration_date_descuento_before` BEFORE UPDATE ON `descuento` FOR EACH ROW BEGIN
	INSERT INTO log_descuento (discount_id, discount_name, service_name, expiration_date, date, state, user)
    VALUES (OLD.discount_id, OLD.discount_name, OLD.service_name, OLD.expiration_date, current_timestamp(),'UPDATE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_descuento_before` BEFORE DELETE ON `descuento` FOR EACH ROW BEGIN
	INSERT INTO log_descuento (discount_id, discount_name, service_name, expiration_date, date, state, user)
    VALUES (OLD.discount_id, OLD.discount_name, OLD.service_name, OLD.expiration_date, current_timestamp(),'DELETE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_cuenta`
--

DROP TABLE IF EXISTS `log_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cuenta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `user` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `card_number` varchar(30) NOT NULL,
  `date` timestamp NOT NULL,
  `state` varchar(6) NOT NULL,
  `user_1` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_cuenta`
--

LOCK TABLES `log_cuenta` WRITE;
/*!40000 ALTER TABLE `log_cuenta` DISABLE KEYS */;
INSERT INTO `log_cuenta` VALUES (2,'maynard_penn@aol.com','maybard_penn','NAtontLeAMil','5317-6612-0661-0764','2023-02-27 01:27:05','UPDATE','senior@localhost'),(3,'maynard_penn@aol.com','maybard_penn','GatitaMimosa','5317-6612-0661-0764','2023-02-27 01:27:16','UPDATE','senior@localhost');
/*!40000 ALTER TABLE `log_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_descuento`
--

DROP TABLE IF EXISTS `log_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_descuento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount_id` int DEFAULT NULL,
  `discount_name` varchar(30) DEFAULT NULL,
  `service_name` varchar(30) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `state` varchar(6) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_descuento`
--

LOCK TABLES `log_descuento` WRITE;
/*!40000 ALTER TABLE `log_descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_pais`
--

DROP TABLE IF EXISTS `log_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_country` varchar(20) NOT NULL,
  `change_dollar` float DEFAULT '1',
  `date` timestamp NULL DEFAULT NULL,
  `state` varchar(6) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_pais`
--

LOCK TABLES `log_pais` WRITE;
/*!40000 ALTER TABLE `log_pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_pay`
--

DROP TABLE IF EXISTS `log_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_code` varchar(20) DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `pay_day` timestamp NULL DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_pay`
--

LOCK TABLES `log_pay` WRITE;
/*!40000 ALTER TABLE `log_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_service`
--

DROP TABLE IF EXISTS `log_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `state` varchar(6) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_service`
--

LOCK TABLES `log_service` WRITE;
/*!40000 ALTER TABLE `log_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_tarjeta`
--

DROP TABLE IF EXISTS `log_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_tarjeta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `card_number` varchar(30) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `extension` int DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `date_operation` timestamp NULL DEFAULT NULL,
  `state` varchar(6) DEFAULT NULL,
  `user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_tarjeta`
--

LOCK TABLES `log_tarjeta` WRITE;
/*!40000 ALTER TABLE `log_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_usuario`
--

DROP TABLE IF EXISTS `log_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `nationality` varchar(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` timestamp NOT NULL,
  `state` varchar(6) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_usuario`
--

LOCK TABLES `log_usuario` WRITE;
/*!40000 ALTER TABLE `log_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `payment_code` varchar(20) NOT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`payment_code`),
  KEY `fk_user` (`id_user`),
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `cuenta` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES ('B4H9UMZK',1),('LCBHMVBY',2),('D6BG9AZU',3),('2FWYBYRB',4),('XNUTUJ9K',5),('LBF2NNWF',6),('7PE8DLNC',7),('EW6BPHPV',8),('DUCK982T',9),('AFUS3D73',10),('Q6FFPS9P',11),('JY574JYK',12),('TCRR8FL9',13),('TPUP6MQL',14),('7WHGBQAW',15);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_pay_after` AFTER INSERT ON `pago` FOR EACH ROW BEGIN
	INSERT INTO log_pay (payment_code, id_user, pay_day,user)
    VALUES (NEW.payment_code, NEW.id_user, current_timestamp(), USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id_country` varchar(5) NOT NULL,
  `name_country` varchar(20) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'U$D',
  `change_dollar` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('ARG','Argentina','Peso AR',189.14),('BR','Brasil','Real',5.15),('COL','Colombia','Peso CL',4714.27),('CR','Costa Rica','CRC',566.86),('ESP','Espania','Euro',0.93),('MEX','Mexico','Peso MX',19.17),('USA','Estados Unidos','U$D',1),('UY','Uruguay','Peso UY',39.13);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_pais_after` AFTER INSERT ON `pais` FOR EACH ROW BEGIN
	INSERT INTO log_pais (name_country, change_dollar, date, state, user)
    VALUES (NEW.name_country, NEW.change_dollar, current_timestamp(), 'INSERT', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_old_dollar_pais_before` BEFORE UPDATE ON `pais` FOR EACH ROW BEGIN
	INSERT INTO log_pais (name_country, change_dollar, date, state, user)
    VALUES (OLD.name_country, OLD.change_dollar, current_timestamp(), 'UPDATE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_pais_before` BEFORE DELETE ON `pais` FOR EACH ROW BEGIN
		INSERT INTO log_pais (name_country, change_dollar, date, state, user)
    VALUES (OLD.name_country, OLD.change_dollar, current_timestamp(), 'DELETE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma` (
  `plataform` varchar(30) NOT NULL,
  `id_user` int DEFAULT NULL,
  `so_name` varchar(20) NOT NULL,
  `resolution` varchar(10) DEFAULT NULL,
  KEY `fk_user_2` (`id_user`),
  KEY `fk_so` (`so_name`),
  CONSTRAINT `fk_so` FOREIGN KEY (`so_name`) REFERENCES `sistema_operativo` (`so_name`),
  CONSTRAINT `fk_user_2` FOREIGN KEY (`id_user`) REFERENCES `cuenta` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
INSERT INTO `plataforma` VALUES ('Movil',1,'¡OS_13','720X1280'),('Movil',2,'Android_12L','720X1280'),('Web',3,'MAC_OS_Mojave',NULL),('Tv',4,'Android_13','3840X2160'),('Movil',5,'Android_11','720X1280'),('Tv',6,'Android_12L','3840X2160'),('Movil',7,'¡OS_12','720X1280'),('Pc',8,'Windows_11','1920X1080'),('Pc',9,'MAC_OS_Catalina','1920X1080'),('Pc',10,'Windows_11','1920X1080'),('Tv',11,'Android_12L',NULL),('Pc',12,'Windows_11','1920X1080'),('Pc',13,'MAC_OS_Catalina','1920X1080'),('Pc',14,'Windows_11','1920X1080'),('Tv',15,'Android_12L',NULL);
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamo` (
  `claim_id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`claim_id`),
  KEY `fk_user_1` (`id_user`),
  CONSTRAINT `fk_user_1` FOREIGN KEY (`id_user`) REFERENCES `cuenta` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
INSERT INTO `reclamo` VALUES (1,1,'2021-11-16','No se acredito mi suscripcion'),(2,12,'2022-12-23','Caidas intermitentes en el servicio'),(3,7,'2022-11-24','No es lo que esperaba'),(4,9,'2022-07-06','Catalogo reducido y no cuenta con proteccion para menores');
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `service_name` varchar(30) NOT NULL,
  `type_service` varchar(30) DEFAULT NULL,
  `price` float NOT NULL,
  `plataform` varchar(30) NOT NULL,
  PRIMARY KEY (`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('Drive','Nube',2.99,'Web, Movil'),('Dropbox','Nube',11.99,'Web, Pc, Movil'),('HBOMAX','Streaming',14.99,'Web, Movil, Tv'),('Mega','Nube',5.44,'Web, Movil, Pc'),('Netflix','Streaming',20,'Web, Pc, Movil, Tv'),('Platzi','Educacion',2.99,'Web'),('SoundCloud','Streaming',12,'Web'),('Spotify','Streaming',5.99,'Web, Pc, Movil, Tv'),('Udemy','Educacion',14.99,'Web'),('YoutubeMusic','Streaming',7.99,'Web');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_service_after` AFTER INSERT ON `servicio` FOR EACH ROW BEGIN
	INSERT INTO log_service (service_name, price, date, state, user)
    VALUES (NEW.service_name, NEW.price, current_timestamp(), 'INSERT', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_price_service_before` BEFORE UPDATE ON `servicio` FOR EACH ROW BEGIN
	INSERT INTO log_service (service_name, price, date, state, user)
    VALUES (OLD.service_name, OLD.price, current_timestamp(), 'UPDATE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_service_before` BEFORE DELETE ON `servicio` FOR EACH ROW BEGIN
	INSERT INTO log_service (service_name, price, date, state, user)
    VALUES (OLD.service_name, OLD.price, current_timestamp(), 'DELETE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sistema_operativo`
--

DROP TABLE IF EXISTS `sistema_operativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema_operativo` (
  `so_name` varchar(20) NOT NULL,
  `so_version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`so_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_operativo`
--

LOCK TABLES `sistema_operativo` WRITE;
/*!40000 ALTER TABLE `sistema_operativo` DISABLE KEYS */;
INSERT INTO `sistema_operativo` VALUES ('¡OS_12','12.5.5'),('¡OS_13','13.7'),('Android_11','11'),('Android_12L','12.1'),('Android_13','13'),('MAC_OS_Catalina','10.15'),('MAC_OS_Mojave','10.14'),('Windows_10','22h2'),('Windows_11','22h2'),('Windows_8.1','6.3');
/*!40000 ALTER TABLE `sistema_operativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `card_number` varchar(30) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `security_code` int NOT NULL,
  `expiration_date` date NOT NULL,
  `type_card` varchar(30) NOT NULL DEFAULT 'MASTERCARD',
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `dni` varchar(8) DEFAULT '99999999',
  `extension` int DEFAULT '0',
  PRIMARY KEY (`card_number`),
  KEY `fk_documento` (`dni`),
  CONSTRAINT `fk_documento` FOREIGN KEY (`dni`) REFERENCES `usuario` (`dni`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES ('3536-8288-6563-3243','American Express Bank',635,'2027-06-01','EXPRESS','Albertina','Redman','42754535',1),('3546-9540-5360-2564','American Express Bank',79,'2028-04-01','EXPRESS','Kelli','Brett','44419722',1),('3597-7985-3560-3668','American Express Bank',317,'2027-06-01','EXPRESS','Tasia','Lloyd','43900273',1),('4146-7691-1911-4632','BBVA',801,'2025-11-01','VISA','Lissette','Silva','44165687',0),('4201-6811-9381-2100','BBVA',847,'2024-08-01','VISA','Rosalyn','Matthams','39458059',1),('4204-2672-6934-7929','Banco Sabadell',427,'2024-05-01','VISA','Refugio','Reynolds','44570437',0),('4953-1354-8126-0076','Evo Banco',87,'2028-10-01','VISA','Levi','West','43296287',0),('5025-8381-1770-9900','Banco Sabadell',209,'2027-08-01','MASTERCARD','Ardell','Samuels','40589745',0),('5030-6937-1756-2651','Wizink',414,'2026-11-01','MASTERCARD','Miguel','Boyce','39681299',0),('5086-3467-5068-2166','Banco Santander',324,'2026-09-01','MASTERCARD','Hilde','Milene','39559124',0),('5317-6612-0661-0764','Wizink',138,'2027-02-01','MASTERCARD','Maynard','Penn','39478272',1);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_tarjeta_after` AFTER INSERT ON `tarjeta` FOR EACH ROW BEGIN
	INSERT INTO log_tarjeta (card_number, bank_name, dni, extension, expiration_date, date_operation, state, user)
    VALUES (NEW.card_number, NEW.bank_name, NEW.dni, NEW.extension, NEW.expiration_date, current_timestamp(), 'INSERT', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_tarjeta_before` BEFORE DELETE ON `tarjeta` FOR EACH ROW BEGIN
	INSERT INTO log_tarjeta (card_number, bank_name, dni, extension, expiration_date, date_operation, state, user)
    VALUES (OLD.card_number, OLD.bank_name, OLD.dni, OLD.extension, OLD.expiration_date, current_timestamp(), 'DELETE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `dni` varchar(8) NOT NULL DEFAULT '99999999',
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `nationality` varchar(5) DEFAULT NULL,
  `email_user` varchar(50) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_nationality` (`nationality`),
  CONSTRAINT `fk_nationality` FOREIGN KEY (`nationality`) REFERENCES `pais` (`id_country`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('39458059','Rosalyn','Matthams',17,'ARG','rosalyn_matthams@gmail.com'),('39478272','Maynard','Penn',16,'ESP','maynard_penn@aol.com'),('39559124','Hilde','Milene',25,'ESP','hilde_milne@protonmail.com'),('39681299','Miguel','Boyce',19,'MEX','miguel_boyce@gmail.com'),('40589745','Ardell','Samuels',20,'USA','ardell_samuels@mail.com'),('42754535','Albertina','Redman',15,'BR','albertina_redman@yahoo.com'),('43296287','Levi','West',29,'BR','levi_west@yandex.com'),('43900273','Tasia','Lloyd',15,'MEX','tasia_lloyd@hotmail.com'),('44165687','Lissette','Silva',23,'UY','lissette_silva@yandex.com'),('44419722','Kelli','Brett',15,'COL','kelli_brett@protonmail.com'),('44570437','Refugio','Reynolds',23,'CR','refugio_reynolds@outlook.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_new_usuario_after` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
	INSERT INTO log_usuario (dni, first_name, last_name, age, nationality, email, date, state, user)
    VALUES (NEW.dni, NEW.first_name, NEW.last_name, NEW.age, NEW.nationality, NEW.email_user, current_timestamp(), 'INSERT', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_usuario_before` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
	INSERT INTO log_usuario (dni, first_name, last_name, age, nationality, email, date, state, user)
    VALUES (OLD.dni, OLD.first_name, OLD.last_name, OLD.age, OLD.nationality, OLD.email_user, current_timestamp(), 'UPDATE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_usuario_before` BEFORE DELETE ON `usuario` FOR EACH ROW BEGIN
	INSERT INTO log_usuario (dni, first_name, last_name, age, nationality, email, date, state, user)
    VALUES (OLD.dni, OLD.first_name, OLD.last_name, OLD.age, OLD.nationality, OLD.email_user, current_timestamp(), 'DELETE', USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_acount`
--

DROP TABLE IF EXISTS `vw_acount`;
/*!50001 DROP VIEW IF EXISTS `vw_acount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_acount` AS SELECT 
 1 AS `User`,
 1 AS `Service`,
 1 AS `TypeCard`,
 1 AS `Bank`,
 1 AS `Extension`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_claim`
--

DROP TABLE IF EXISTS `vw_claim`;
/*!50001 DROP VIEW IF EXISTS `vw_claim`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_claim` AS SELECT 
 1 AS `ClaimId`,
 1 AS `Descripcion`,
 1 AS `Email`,
 1 AS `PaymentCode`,
 1 AS `Service`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_discount`
--

DROP TABLE IF EXISTS `vw_discount`;
/*!50001 DROP VIEW IF EXISTS `vw_discount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_discount` AS SELECT 
 1 AS `Name`,
 1 AS `Description`,
 1 AS `Service`,
 1 AS `Plataform`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_payment`
--

DROP TABLE IF EXISTS `vw_payment`;
/*!50001 DROP VIEW IF EXISTS `vw_payment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_payment` AS SELECT 
 1 AS `payment_code`,
 1 AS `email_user`,
 1 AS `service_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_plataform`
--

DROP TABLE IF EXISTS `vw_plataform`;
/*!50001 DROP VIEW IF EXISTS `vw_plataform`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_plataform` AS SELECT 
 1 AS `User`,
 1 AS `Email`,
 1 AS `Plataform`,
 1 AS `Resolution`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_user`
--

DROP TABLE IF EXISTS `vw_user`;
/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_user` AS SELECT 
 1 AS `Name`,
 1 AS `Email`,
 1 AS `Service`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'tp_alconchel'
--
/*!50003 DROP FUNCTION IF EXISTS `fc_associated_card` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_associated_card`(dni_param VARCHAR(8)) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE verify INT;
    DECLARE conclusion VARCHAR(30);
    SELECT
		COUNT(T.card_number) INTO verify
	FROM usuario AS U
    INNER JOIN tarjeta AS T 
    ON (U.dni = T.dni)
    WHERE U.dni = dni_param;
    
    IF verify > 0 THEN
		SET conclusion = 'This user has associated cards';
    ELSE
		SET conclusion = 'This user has no associated cards';
	END IF;
    RETURN conclusion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_dollar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_dollar`(country_param VARCHAR(5)) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE dollar FLOAT;
    SELECT
		change_dollar INTO dollar
	FROM pais
    WHERE id_country = country_param;
    
    RETURN ROUND(dollar, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_price`(service_name_param VARCHAR(30)) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE result_price FLOAT;
    SELECT
	price INTO result_price
	FROM servicio
	WHERE service_name = service_name_param;
	RETURN result_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_suscription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_suscription`(service_name_param VARCHAR(30),monts_param INT, country_param VARCHAR(5)) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE total FLOAT;
    DECLARE currency FLOAT;
    SELECT
		price INTO total
	FROM servicio
    WHERE service_name = service_name_param;
    SELECT
		change_dollar INTO currency
	FROM pais
    WHERE id_country = country_param;
    SET total  = (total * currency)* monts_param;
    RETURN ROUND(total, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fc_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fc_user`(dni_param VARCHAR(8)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE complet_name VARCHAR(60);
    SELECT
		CONCAT(first_name,' ', last_name) INTO complet_name
	FROM usuario
    WHERE dni = dni_param;
    RETURN complet_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cards` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cards`(IN dni_param VARCHAR(8))
BEGIN
	DECLARE usuarios INT;
    SELECT COUNT(dni) INTO usuarios FROM usuario WHERE dni = dni_param;
    
	IF usuarios = 1 THEN
		SELECT
			*
		FROM tarjeta AS T
		WHERE T.dni = dni_param;
    ELSE
		SELECT 'This user not exist.' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_cuenta`(IN id_param INT)
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM cuenta
		WHERE id_user = id_param;
		SELECT * FROM cuenta;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_descuento`()
BEGIN
	DECLARE today DATE;
    SET today = current_date();
    DELETE FROM descuento
    WHERE expiration_date < today;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_pais`(IN id_country_param VARCHAR(30))
BEGIN
	DECLARE usuario VARCHAR(30);
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM pais
		WHERE id_country = id_country_param;
		SELECT * FROM pais;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_servicio`(IN service_name_param VARCHAR(30))
BEGIN
    DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM servicio
		WHERE service_name = service_name_param;
		SELECT * FROM servicio;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_tarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_tarjeta`(IN card_number_param VARCHAR(30))
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM tarjeta
		WHERE card_number = card_number_param;
		SELECT * FROM tarjeta;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_usuario`(IN dni_param VARCHAR(8))
BEGIN
	DECLARE usuario VARCHAR(30);
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM usuario
		WHERE dni = dni_param;
		SELECT * FROM usuario;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_exist_acount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exist_acount`(IN id_param INT)
BEGIN
	DECLARE clausula INT;
    SELECT COUNT(*) INTO clausula FROM cuenta;
	IF id_param <= clausula THEN
		SELECT
			email_user AS Email,
            user AS User,
            service_name AS Service,
            type_service AS Type
		FROM cuenta
		WHERE id_user = id_param;
    ELSE
		SELECT 'This user not exist.' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_claim` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_claim`(IN id_user_param INT, date_param DATE, description_param VARCHAR(200))
BEGIN
	INSERT INTO reclamo (id_user, date, description)
	VALUES	(id_user_param, date_param, description_param);
    SELECT * FROM reclamo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_cuenta`(IN email_param VARCHAR(50), user_param VARCHAR(30), password_param VARCHAR(30),
	card_number_param VARCHAR(30), service_name_param VARCHAR(30), type_service_param VARCHAR(30))
BEGIN
	INSERT INTO cuenta (email_user, user, password, card_number, service_name, type_service) 
	VALUES
		(email_param , user_param , password_param , card_number_param , service_name_param , type_service_param);
    SELECT * FROM cuenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_descuento`(IN discount_id_param INT, id_user_param INT, discount_name_param VARCHAR(30),
	service_name_param VARCHAR(30), expiration_date_param DATE, description_param VARCHAR(200))
BEGIN
	INSERT INTO descuento (discount_id, id_user, discount_name, service_name, expiration_date, description)
	VALUES	(discount_id_param, id_user_param, discount_name_param,
		service_name_param , expiration_date_param, description_param);
    SELECT * FROM descuento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_pais`(IN id_country_param VARCHAR(5), name_country_param VARCHAR(20), currency_param VARCHAR(10), change_dollar_param FLOAT)
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		INSERT INTO pais (id_country, name_country, currency, change_dollar)
		VALUES	(id_country_param, name_country_param, currency_param, change_dollar_param);
		SELECT * FROM pais;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_servicio`(IN service_name_param VARCHAR(30), type_service_param VARCHAR(30), price_param FLOAT, plataform_param VARCHAR(30))
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
	IF  usuario = 'senior@localhost' THEN
		INSERT INTO servicio (service_name, type_service, price, plataform)
		VALUES	(service_name_param, type_service_param, price_param, plataform_param);
		SELECT * FROM servicio;
    ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_tarjeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_tarjeta`(IN card_number_param VARCHAR(30), bank_name_param VARCHAR(50), security_code_param INT, expiration_date_param DATE,type_card_param VARCHAR(30), first_name_param VARCHAR(20), last_name_param VARCHAR(20), dni_param VARCHAR(8), extension_param INT)
BEGIN
    DECLARE verify INT;
    SELECT COUNT(*) INTO verify FROM tarjeta WHERE card_number = card_number_param;
    
    IF verify = 0 THEN
		INSERT INTO tarjeta  (card_number, bank_name, security_code, expiration_date, type_card, first_name, last_name, dni, extension)
		VALUES
			(card_number_param, bank_name_param, security_code_param,
			expiration_date_param, type_card_param, first_name_param, last_name_param, dni_param, extension_param);
		SELECT * FROM tarjeta;
	ELSE
		SELECT 'Tarjeta is already exist' AS WARNING;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_new_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_new_usuario`(IN dni_param VARCHAR(8), first_name_param VARCHAR(20), last_name_param VARCHAR(20),
	age_param INT, nationality_param VARCHAR(5), email_user_param VARCHAR(50))
BEGIN
	DECLARE usuario VARCHAR(30);
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		INSERT INTO usuario (dni, first_name, last_name, age, nationality, email_user) 
		VALUES
			(dni_param, first_name_param, last_name_param, age_param, nationality_param, email_user_param);
		SELECT * FROM usuario;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_age_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_age_usuario`(IN dni_param VARCHAR(8), age_param INT)
BEGIN
	DECLARE verify INT;
    SELECT count(dni) INTO verify FROM usuario WHERE dni = dni_param;
    IF verify = 1 THEN
		UPDATE usuario
        SET age = age_param
        WHERE dni =  dni_param;
        SELECT * FROM usuario
        WHERE dni =  dni_param;
    ELSE
		SELECT "This user not is exist" AS Warning;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_card_number_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_card_number_cuenta`(IN id_param INT, card_number_param VARCHAR(30))
BEGIN
	DECLARE verify_card INT;
    DECLARE verify INT;
    DECLARE usuario VARCHAR(30);
    SELECT count(card_number) INTO verify_card FROM tarjeta WHERE card_number = card_number_param;
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		IF verify_card = 1 AND verify = 1 THEN
			UPDATE cuenta
			SET card_number = card_number_param
			WHERE id_user =  id_param;
			SELECT * FROM cuenta
			WHERE id_user =  id_param;
		END IF;
		IF verify_card = 0 AND verify = 0 THEN
			SELECT 'Acount and Card not exist.' AS Warning;
			ELSE 
				IF verify_card = 1 AND verify = 0 THEN
					SELECT 'Acount not exist.' AS Warning;
					ELSE 
						IF verify_card = 0 AND verify = 1 THEN
							SELECT 'Card not exist.' AS Warning;
						END IF;
					END IF;
				END IF;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_change_dollar_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_change_dollar_pais`(IN id_country_param VARCHAR(5), dollar_param FLOAT)
BEGIN
	DECLARE verify INT;
	DECLARE usuario VARCHAR(30);
    SELECT count(*) INTO verify FROM pais WHERE id_country = id_country_param;
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		IF verify = 1 THEN
			UPDATE pais
			SET change_dollar = dollar_param
			WHERE id_country = id_country_param;
			
			SELECT * FROM pais
			WHERE id_country = id_country_param;
			
		ELSE
			SELECT 'The country not exist.' AS Warning;
		END IF;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_email_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_email_cuenta`(IN id_param INT, email_param VARCHAR(50))
BEGIN
	DECLARE verify INT;
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
    IF verify = 1 THEN
		UPDATE cuenta
        SET email_user = email_param
        WHERE id_user =  id_param;
        SELECT * FROM cuenta
           WHERE id_user =  id_param;
    ELSE
		SELECT "This acount not exist" AS Warning;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_email_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_email_usuario`(IN dni_param VARCHAR(8), email_param VARCHAR(50))
BEGIN
	DECLARE verify INT;
    SELECT count(dni) INTO verify FROM usuario WHERE dni = dni_param;
    IF verify = 1 THEN
		UPDATE usuario
        SET email_user = email_param
        WHERE dni =  dni_param;
        SELECT * FROM usuario
        WHERE dni =  dni_param;
    ELSE
		SELECT "This user not is exist" AS Warning;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_expiration_date_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_expiration_date_descuento`(IN discount_id_param INT, date_param DATE)
BEGIN
	DECLARE today DATE;
    SELECT expiration_date INTO today FROM descuento WHERE discount_id = discount_id_param;
    IF today < date_param THEN
		UPDATE descuento
        SET expiration_date = date_param
        WHERE discount_id =  discount_id_param;
        SELECT * FROM descuento
        WHERE discount_id = discount_id_param;
    ELSE
		SELECT "This date not is valid" AS Warning;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_password_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_password_cuenta`(IN id_param INT, password_param VARCHAR(20))
BEGIN
	DECLARE verify INT;
    DECLARE usuario VARCHAR(30);
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		IF verify = 1 THEN
			UPDATE cuenta
			SET password = password_param
			WHERE id_user =  id_param;
			SELECT * FROM cuenta
			   WHERE id_user =  id_param;
		ELSE
			SELECT "This acount not exist" AS Warning;
		END IF;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_price_servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_price_servicio`(IN service_name_param VARCHAR(30), price_param FLOAT)
BEGIN
	DECLARE verify INT;
    SELECT COUNT(service_name) INTO verify FROM servicio WHERE service_name = service_name_param;
    IF verify = 1 THEN
		UPDATE servicio
        SET price = price_param
        WHERE service_name = service_name_param;
        
        SELECT * FROM servicio
       WHERE service_name = service_name_param;
    ELSE
		SELECT "This service not exist." AS Warning;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_user_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_user_cuenta`(IN id_param INT, user_param VARCHAR(20))
BEGIN
	DECLARE verify INT;
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
    IF verify = 1 THEN
		UPDATE cuenta
        SET user = user_param
        WHERE id_user =  id_param;
        SELECT * FROM cuenta
           WHERE id_user =  id_param;
    ELSE
		SELECT "This acount not exist" AS Warning;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_acount`
--

/*!50001 DROP VIEW IF EXISTS `vw_acount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_acount` AS select `c`.`user` AS `User`,`c`.`service_name` AS `Service`,`t`.`type_card` AS `TypeCard`,`t`.`bank_name` AS `Bank`,`t`.`extension` AS `Extension` from (`cuenta` `c` join `tarjeta` `t` on((`c`.`card_number` = `t`.`card_number`))) where (`t`.`extension` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_claim`
--

/*!50001 DROP VIEW IF EXISTS `vw_claim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_claim` AS select `r`.`claim_id` AS `ClaimId`,`r`.`description` AS `Descripcion`,`c`.`email_user` AS `Email`,`p`.`payment_code` AS `PaymentCode`,`c`.`service_name` AS `Service` from ((`reclamo` `r` join `cuenta` `c` on((`r`.`id_user` = `c`.`id_user`))) join `pago` `p` on((`r`.`id_user` = `p`.`id_user`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_discount`
--

/*!50001 DROP VIEW IF EXISTS `vw_discount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_discount` AS select `d`.`discount_name` AS `Name`,`d`.`description` AS `Description`,`d`.`service_name` AS `Service`,`s`.`plataform` AS `Plataform` from (`descuento` `d` join `servicio` `s` on((`d`.`service_name` = `s`.`service_name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_payment`
--

/*!50001 DROP VIEW IF EXISTS `vw_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_payment` AS select `p`.`payment_code` AS `payment_code`,`c`.`email_user` AS `email_user`,`c`.`service_name` AS `service_name` from (`pago` `p` join `cuenta` `c` on((`p`.`id_user` = `c`.`id_user`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_plataform`
--

/*!50001 DROP VIEW IF EXISTS `vw_plataform`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_plataform` AS select `c`.`user` AS `User`,`c`.`email_user` AS `Email`,`p`.`plataform` AS `Plataform`,`p`.`resolution` AS `Resolution` from (`plataforma` `p` join `cuenta` `c` on((`p`.`id_user` = `c`.`id_user`))) where (`p`.`plataform` like '%Movil%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_user`
--

/*!50001 DROP VIEW IF EXISTS `vw_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_user` AS select `u`.`first_name` AS `Name`,`u`.`email_user` AS `Email`,`c`.`service_name` AS `Service` from ((`usuario` `u` join `tarjeta` `t` on((`u`.`dni` = `t`.`dni`))) join `cuenta` `c` on((`t`.`card_number` = `c`.`card_number`))) where (`c`.`service_name` = 'Spotify') */;
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

-- Dump completed on 2023-02-26 22:58:56
