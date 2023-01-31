/*
Las tablas que se encuentran respaldadas en este script son:
  cuenta
  descuento
  pago
  plataforma
  reclamo
  servicio
  sistema_operativo
  tarjeta
  usuario
Las tablas excluidas son:
    log_pay
    log_price
    Todas las vistas:
        vw_discount
        vw_claim
        vw_user
        vw_plataform
        vw_acount
Las tablas se encuentran excluidas (log_price y log_pay) porque fueron creadas en el contexto de la funcionalidad
del trigger, como tal no tienen un insert independiente
*/
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
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'maynard_penn@aol.com','maybard_penn','NAtontLeAMil','5317-6612-0661-0764','Platzi','Educacion'),(2,'kelli_brett@protonmail.com','BrettKel','bUtMATINdo','3546-9540-5360-2564','SoundCloud','Streaming'),(3,'hilde_milne@protonmail.com','milnehilde','stOrANIaNc','5086-3467-5068-2166','Drive','Nube'),(4,'hilde_milne@protonmail.com','milnehilde','PIRflAtegI','5086-3467-5068-2166','YoutubeMusic','Streaming'),(5,'levi_west@yandex.com','wevi','ArDAbcarIN','4953-1354-8126-0076','HBOMAX','Streaming'),(6,'levi_west@yandex.com','levi_west','ComPEneriL','4953-1354-8126-0076','Udemy','Educacion'),(7,'miguel_boyce@gmail.com','boycemig','opyaNAnETA','5030-6937-1756-2651','HBOMAX','Streaming'),(8,'lissette_silva@yandex.com','Silvalissette','oUgeNdRaPO','4146-7691-1911-4632','Dropbox','Nube'),(9,'refugio_reynolds@outlook.com',NULL,'nfiRsTICEo','4204-2672-6934-7929','Mega','Nube'),(10,'rosalyn_matthams@gmail.com','mattrosa','RpSEdGeNta','4201-6811-9381-2100','Spotify','Streaming'),(11,'ardell_samuels@mail.com',NULL,'acaNTAwmaTiv','5025-8381-1770-9900','Mega','Nube'),(12,'albertina_redman@yahoo.com','albertinaman','escUBsIBluSc','3536-8288-6563-3243','Spotify','Streaming'),(13,'ardell_samuels@mail.com','elsard','teRnaPORnOrM','5025-8381-1770-9900','Spotify','Streaming'),(14,'albertina_redman@yahoo.com','albertina_redman','CASpiSeCieSt','3536-8288-6563-3243','Platzi','Educacion'),(15,'tasia_lloyd@hotmail.com',NULL,'cTiaLdUMPReC','3597-7985-3560-3668','SoundCloud','Streaming');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `descuento`
--

LOCK TABLES `descuento` WRITE;
/*!40000 ALTER TABLE `descuento` DISABLE KEYS */;
INSERT INTO `descuento` VALUES (117,5,'MESGRATIS','YoutubeMusic','2021-02-18','Primer mes GRATIS'),(121,8,'MESESPRUEBA','HBOMAX','2022-09-27','Tres meses de PRUEBA'),(126,3,'50%OFF','Soundcloud','2022-01-04','50% OFF en el segundo mes'),(140,11,'REINTEGRO40%','Dropbox','2022-05-22','Reintegro del 40% de tu suscripcion'),(152,4,'25%DESCUENTO','Drive','2022-12-02','25% descuento'),(158,2,'10%DESCUENTO','Mega','2022-01-16','10% de descuento'),(168,15,'HBOMAXGRATIS','HBOMAX','2022-02-12','Suscripcion gratis en HBO MAX por un mes'),(171,1,'50%OFFEN1ANIO','Udemy','2022-11-26','50% OFF pagando un anio'),(181,1,'REINTEGRO35%','Platzi','2022-12-04','35% reintegro con la suscripcion de un anio'),(191,4,'65%OFF','Spotify','2021-03-25','65% OFF en seis meses');
/*!40000 ALTER TABLE `descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES ('B4H9UMZK',1),('LCBHMVBY',2),('B4H9JMZK',3),('D6BG9AZU',3),('2FWYBYRB',4),('XNUTUJ9K',5),('LBF2NNWF',6),('7PE8DLNC',7),('EW6BPHPV',8),('DUCK982T',9),('AFUS3D73',10),('Q6FFPS9P',11),('JY574JYK',12),('TCRR8FL9',13),('TPUP6MQL',14),('7WHGBQAW',15);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
INSERT INTO `plataforma` VALUES ('Movil',1,'¡OS_13','720X1280'),('Movil',2,'Android_12L','720X1280'),('Web',3,'MAC_OS_Mojave',NULL),('Tv',4,'Android_13','3840X2160'),('Movil',5,'Android_11','720X1280'),('Tv',6,'Android_12L','3840X2160'),('Movil',7,'¡OS_12','720X1280'),('Pc',8,'Windows_11','1920X1080'),('Pc',9,'MAC_OS_Catalina','1920X1080'),('Pc',10,'Windows_11','1920X1080'),('Tv',11,'Android_12L',NULL),('Pc',12,'Windows_11','1920X1080'),('Pc',13,'MAC_OS_Catalina','1920X1080'),('Pc',14,'Windows_11','1920X1080'),('Tv',15,'Android_12L',NULL);
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
INSERT INTO `reclamo` VALUES (1,1,'2021-11-16','No se acredito mi suscripcion'),(2,12,'2022-12-23','Caidas intermitentes en el servicio'),(3,7,'2022-11-24','No es lo que esperaba'),(4,9,'2022-07-06','Catalogo reducido y no cuenta con proteccion para menores');
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('Drive','Nube',2.99,'Web, Movil'),('Dropbox','Nube',11.99,'Web, Pc, Movil'),('HBOMAX','Streaming',14.99,'Web, Movil, Tv'),('Mega','Nube',5.44,'Web, Movil, Pc'),('Netflix','Streaming',20,'Web, Pc, Movil, Tv'),('Platzi','Educacion',299,'Web'),('SoundCloud','Streaming',12,'Web'),('Spotify','Streaming',20.19,'Web, Pc, Movil, Tv'),('Udemy','Educacion',14.99,'Web'),('YoutubeMusic','Streaming',299,'Web');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sistema_operativo`
--

LOCK TABLES `sistema_operativo` WRITE;
/*!40000 ALTER TABLE `sistema_operativo` DISABLE KEYS */;
INSERT INTO `sistema_operativo` VALUES ('¡OS_12','12.5.5'),('¡OS_13','13.7'),('Android_11','11'),('Android_12L','12.1'),('Android_13','13'),('MAC_OS_Catalina','10.15'),('MAC_OS_Mojave','10.14'),('Windows_10','22h2'),('Windows_11','22h2'),('Windows_8.1','6.3');
/*!40000 ALTER TABLE `sistema_operativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES ('3536-8288-6563-3243','American Express Bank',635,'2027-06-01','EXPRESS','Albertina','Redman','42754535',1),('3546-9540-5360-2564','American Express Bank',79,'2028-04-01','EXPRESS','Kelli','Brett','44419722',1),('3597-7985-3560-3668','American Express Bank',317,'2027-06-01','EXPRESS','Tasia','Lloyd','43900273',1),('4146-7691-1911-4632','BBVA',801,'2025-11-01','VISA','Lissette','Silva','44165687',0),('4201-6811-9381-2100','BBVA',847,'2024-08-01','VISA','Rosalyn','Matthams','39458059',1),('4204-2672-6934-7929','Banco Sabadell',427,'2024-05-01','VISA','Refugio','Reynolds','44570437',0),('4953-1354-8126-0076','Evo Banco',87,'2028-10-01','VISA','Levi','West','43296287',0),('5025-8381-1770-9900','Banco Sabadell',209,'2027-08-01','MASTERCARD','Ardell','Samuels','40589745',0),('5030-6937-1756-2651','Wizink',414,'2026-11-01','MASTERCARD','Miguel','Boyce','39681299',0),('5086-3467-5068-2166','Banco Santander',324,'2026-09-01','MASTERCARD','Hilde','Milene','39559124',0),('5317-6612-0661-0764','Wizink',138,'2027-02-01','MASTERCARD','Maynard','Penn','39478272',1);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('39458059','Rosalyn','Matthams',17,'rosalyn_matthams@gmail.com'),('39478272','Maynard','Penn',16,'maynard_penn@aol.com'),('39559124','Hilde','Milene',25,'hilde_milne@protonmail.com'),('39681299','Miguel','Boyce',19,'miguel_boyce@gmail.com'),('40589745','Ardell','Samuels',20,'ardell_samuels@mail.com'),('42754535','Albertina','Redman',15,'albertina_redman@yahoo.com'),('43296287','Levi','West',29,'levi_west@yandex.com'),('43900273','Tasia','Lloyd',15,'tasia_lloyd@hotmail.com'),('44165687','Lissette','Silva',23,'lissette_silva@yandex.com'),('44419722','Kelli','Brett',15,'kelli_brett@protonmail.com'),('44570437','Refugio','Reynolds',23,'refugio_reynolds@outlook.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-30 21:15:34
